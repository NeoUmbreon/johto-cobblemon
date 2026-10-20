"""
Reads:
  gs_enc_data.json & maps.h from a pokeheartgold checkout (--pokeheartgold)

Writes:
  source_data/encounter_data.json (--output)

Transformations:
- Species: formats to Cobblemon names (lowercase alphanumeric)
- Levels: int -> "N", {min,max} -> "min" or "min-max"
- Time dicts (morn/day/nite): collapse to single species if all times match
- Drops contexts with no mons, and maps with no surviving contexts
- Version dicts are kept intact
- Keeps only the swarm type this map can roll (per sSwarmMapLUT)
- Appends human-readable map alias from maps.h

Args:
  --pokeheartgold  Path to pokeheartgold checkout (default: ../pokeheartgold)
  --output         Output path (default: source_data/encounter_data.json)
"""
import argparse
import hashlib
import json
import re
from pathlib import Path

RODS = ("old_rod", "good_rod", "super_rod")
RADIO_REGIONS = ("hoenn", "sinnoh")
VERSION_KEYS = {"HEARTGOLD", "SOULSILVER"}
TIMES = ("morn", "day", "nite")

# Expected SHA-256 hashes of the two pokeheartgold files this script reads.
# Script raises on non-match.
EXPECTED_HASHES = {
    "gs_enc_data.json": "ae0895407231448bbf12be33480e534e5ca812d9f172ffd0b0918c29070f4ab1",
    "maps.h": "9ebf1f2f6110af509b830cc33f271d4b5d257f309212345a6bb4557321634adb",
}

# from sSwarmMapLUT in ntr/field/unk_02097F6C.c
SWARM_MAPS = {
    "R01": "landSwarm", "R03": "landSwarm", "R09": "landSwarm",
    "R12": "fishSwarm", "R13": "landSwarm", "W19": "surfSwarm",
    "R32": "fishSwarm", "R25": "landSwarm", "R27": "surfSwarm",
    "R34": "landSwarm", "R35": "landSwarm", "R38": "landSwarm",
    "R44": "fishSwarm", "R45": "landSwarm", "R47": "landSwarm",
    "D38R0101": "landSwarm", "D42R0102": "landSwarm",
    "D46R0101": "landSwarm", "T06": "surfSwarm", "T22": "fishSwarm",
}


def get_hash(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_map_names(maps_h: Path) -> dict:
    names = {}
    for line in maps_h.read_text(encoding="utf-8").splitlines():
        m = re.match(r"^\s*#define\s+MAP_(\S+)\s+\d+\s*//\s*MAP_(\S+)", line)
        if m:
            names[m.group(2)] = m.group(1)
    return names


def normalize_species(v):
    if isinstance(v, dict):
        # Version dict (HEARTGOLD/SOULSILVER): recurse each arm independently
        if VERSION_KEYS & v.keys():
            return {k: normalize_species(x) for k, x in v.items()}
        # Time dict (morn/day/nite): collapse to one species if all times agree
        if all(k in v for k in TIMES):
            vals = [v[k] for k in TIMES]
            if all(x == vals[0] for x in vals):
                return normalize_species(vals[0])
        return {k: normalize_species(x) for k, x in v.items()}
    return re.sub(r"[^a-z0-9]", "", v.replace("SPECIES_", "").lower())


def is_none(v):
    return v in (None, "", "SPECIES_NONE", "none")


def normalize_level(v):
    if isinstance(v, dict):
        if set(v) <= VERSION_KEYS and v:
            return {k: normalize_level(x) for k, x in v.items()}
        lo, hi = v["min"], v["max"]
        # If one side is a version dict and the other isn't, broadcast the
        # scalar to both versions so min/max pair up per version
        if isinstance(lo, dict) or isinstance(hi, dict):
            lo = lo if isinstance(lo, dict) else {k: lo for k in VERSION_KEYS}
            hi = hi if isinstance(hi, dict) else {k: hi for k in VERSION_KEYS}
            return {k: f"{normalize_level(lo[k])}-{normalize_level(hi[k])}" for k in lo}
        lo_s, hi_s = normalize_level(lo), normalize_level(hi)
        return lo_s if lo_s == hi_s else f"{lo_s}-{hi_s}"
    return str(v)


def normalize_context(context):
    mons = [
        {"pokemon": normalize_species(m["species"]), "level": normalize_level(m["level"])}
        for m in context.get("mons", [])
    ]
    if not mons:
        return None
    out = {"mons": mons}
    if "rate" in context:
        out["rate"] = context["rate"]
    return out


def normalize_fishing(fishing):
    out = {}
    for rod in RODS:
        context = normalize_context(fishing.get(rod, {}))
        if context:
            out[rod] = context
    return out


def normalize_encounter(enc, map_names):
    # Normalize one raw map entry; drops contexts with no mons
    # Returns None if no encounter data survives
    map_code = enc["map"]
    out = {"map": map_code, "name": map_names.get(map_code, map_code)}

    for key in ("land", "surf", "rock_smash"):
        context = normalize_context(enc.get(key, {}))
        if context:
            out[key] = context

    fishing = normalize_fishing(enc.get("fishing", {}))
    if fishing:
        out["fishing"] = fishing

    night_fish = enc.get("nightFish")
    if not is_none(night_fish):
        out["nightFish"] = normalize_species(night_fish)

    for region in RADIO_REGIONS:
        species = [normalize_species(x) for x in enc.get(region, []) if not is_none(x)]
        if species:
            out[region] = species

    # filter by swarm lut
    swarm_key = SWARM_MAPS.get(map_code)
    if swarm_key:
        v = enc.get(swarm_key)
        if not is_none(v):
            out[swarm_key] = normalize_species(v)

    return out if len(out) > 2 else None  # 2 = map + name; drop if nothing else survived


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--pokeheartgold", default="../pokeheartgold")
    parser.add_argument("--output", default=None)
    args = parser.parse_args()

    ph_root = Path(args.pokeheartgold)
    if not ph_root.is_absolute():
        ph_root = (Path(__file__).resolve().parent.parent / ph_root).resolve()

    out_path = Path(args.output) if args.output else Path(__file__).resolve().parent.parent / "source_data" / "encounter_data.json"

    enc_path = ph_root / "files/fielddata/encountdata/gs_enc_data.json"
    maps_path = ph_root / "include/constants/maps.h"
    for label, path in (("gs_enc_data.json", enc_path), ("maps.h", maps_path)):
        actual = get_hash(path)
        expected = EXPECTED_HASHES[label]
        if actual != expected:
            raise SystemExit(f"ERROR: {label} hash mismatch (expected {expected}, got {actual})")

    map_names = load_map_names(maps_path)
    raw = json.loads(enc_path.read_text(encoding="utf-8"))

    kept = []
    for e in raw["encounters"]:
        stripped = normalize_encounter(e, map_names)
        if stripped is not None:
            kept.append(stripped)

    kept.sort(key=lambda e: e["map"])
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(kept, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"Wrote {out_path}: {len(kept)} maps kept")


if __name__ == "__main__":
    main()
