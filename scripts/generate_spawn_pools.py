"""Generate Cobblemon spawn pool entries from the normalized encounter data.

Reads source_data/encounter_data.json and source_data/zones.json, writes one
spawn pool file per map to cobblemon/spawn_pool_world/.
"""
import argparse
import json
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent

ENC_DATA = REPO_ROOT / "source_data" / "encounter_data.json"
ZONES = REPO_ROOT / "source_data" / "zones.json"
OUT_DIR = (
    REPO_ROOT
    / "datapacks"
    / "CobblemonJohto"
    / "data"
    / "cobblemon"
    / "spawn_pool_world"
)

TIMES = ("morn", "day", "nite")
RODS = ("old_rod", "good_rod", "super_rod")
ALL_TIMES = frozenset(TIMES)
DAYTIME = frozenset(("morn", "day"))
NIGHTTIME = frozenset(("nite",))
VERSION_KEYS = ("HEARTGOLD", "SOULSILVER")

# HGSS percentages by slot
SLOT_WEIGHTS = {
    "land": [20, 20, 10, 10, 10, 10, 5, 5, 4, 4, 1, 1],
    "surf": [60, 30, 5, 4, 1],
    "fishing": [40, 30, 15, 10, 5],
    "rock_smash": [90, 10],  # unused
}

# Night fishing slot replacement
NIGHT_FISH_SLOT = (None, 3, 1)

# Hoenn/Sinnoh sound slot replacement
SOUND_SLOT_INDICES = (2, 3, 4, 5)
SOUND_ELEM_INDEX = (0, 0, 1, 1)

# Swarms
# Land slot replacement
LAND_SWARM_SLOTS = frozenset((0, 1))

# Fishing slot replacement
FISHING_SWARM_SLOTS = {
    "old_rod": (2,),
    "good_rod": (0, 2, 3),
    "super_rod": None, # all slots
}


def is_version(v):
    """True if v is a per-version dict."""
    return isinstance(v, dict) and any(k in v for k in VERSION_KEYS)


def get_time_pokemon(pokemon, time):
    """Resolve a slot's pokemon for a time-of-day."""
    if isinstance(pokemon, dict) and not is_version(pokemon):
        return pokemon.get(time)
    return pokemon


def norm_weight(w):
    """Prefer int over float for whole-number weights."""
    if w == int(w):
        return int(w)
    return w


def emit_versioned(species, level, times, weight, slots=None):
    """Emit one entry per present version, splitting the slot weight."""
    sl = frozenset() if slots is None else slots
    sp_ver, lv_ver = is_version(species), is_version(level)
    if not (sp_ver or lv_ver):
        return [
            {"pokemon": species, "level": level, "times": times, "weight": weight, "slots": sl}
        ]
    vers = [
        v
        for v in VERSION_KEYS
        if (species[v] if sp_ver else species) is not None
    ]
    n = len(vers)
    return [
        {
            "pokemon": species[v] if sp_ver else species,
            "level": level[v] if lv_ver else level,
            "times": times,
            "weight": weight / n,
            "slots": sl,
        }
        for v in vers
    ]


def expand_slot(slot, weight, has_times, times=None, slot_idx=None):
    """Expand a slot into weighted entries: per-time for land, single entry for surf/fishing."""
    if has_times:
        entries = []
        for time in TIMES:
            pokemon = get_time_pokemon(slot["pokemon"], time)
            if pokemon is None:
                continue
            entries.extend(emit_versioned(pokemon, slot["level"], frozenset((time,)), weight, frozenset((slot_idx,))))
        return entries
    sl = frozenset((slot_idx,)) if slot_idx is not None else frozenset()
    return emit_versioned(slot["pokemon"], slot["level"], times, weight, sl)


def build_slot_list(mons, slot_weights, night_fish, night_slot):
    """Pair each slot with its weight and time restriction."""
    work = [(slot, w, None, i) for i, (slot, w) in enumerate(zip(mons, slot_weights))]

    if night_fish is None or night_slot is None or night_slot >= len(work):
        return work

    # Night-fish override: no-op if it matches species; else restrict displaced
    # slot to daytime and add a separate night slot.
    displaced, weight, _, idx = work[night_slot]
    if displaced["pokemon"] == night_fish:
        return work

    work[night_slot] = (displaced, weight, DAYTIME, idx)
    work.append(
        ({"pokemon": night_fish, "level": displaced["level"]}, weight, NIGHTTIME, idx)
    )
    return work


def merge_time_weights(per_time):
    """Split per-time weights into a shared all-times weight plus per-time excess."""
    base = min(per_time[t] for t in TIMES)
    out = []
    if base > 0:
        out.append((None, base))

    # Build runs in order (morn, day, nite)
    run, run_w = [], None
    for t in TIMES:
        extra = per_time[t] - base
        if extra > 0 and extra == run_w:
            run.append(t)
            continue
        if run_w and run_w > 0:
            out.append((frozenset(run), run_w))
        run, run_w = ([t], extra) if extra > 0 else ([], None)
    if run_w and run_w > 0:
        out.append((frozenset(run), run_w))

    # Wrap-around merge
    if len(out) >= 2 and out[0][1] == out[-1][1]:
        first_times, w = out[0]
        last_times, _ = out[-1]
        if first_times is not None and last_times is not None:
            merged = first_times | last_times
            # Only merge if it doesn't cover all three times
            if len(merged) < 3:
                out = out[1:-1]
                out.append((merged, w))

    return out


def compact_slots(slots, slot_weights, has_times, night_fish=None, night_slot=None):
    """Compact a context's slots into weighted, deduplicated entries."""
    work = build_slot_list(slots, slot_weights, night_fish, night_slot)

    all_entries = []
    for slot, weight, times, slot_idx in work:
        all_entries.extend(expand_slot(slot, weight, has_times, times, slot_idx))

    # Group by (pokemon, level, times) and sum weights and slots
    groups = {}
    for e in all_entries:
        key = (e["pokemon"], e["level"], e["times"])
        if key not in groups:
            groups[key] = {
                "pokemon": e["pokemon"],
                "level": e["level"],
                "times": e["times"],
                "weight": 0,
                "slots": set(),
            }
        groups[key]["weight"] += e["weight"]
        groups[key]["slots"] |= e.get("slots", set())

    # A pokemon+level weighted at every time can share an all-times baseline;
    # partial coverage keeps its own time restriction.
    pending = {}  # (pokemon, level) -> {time: weight, slots: set}
    result = []
    for entry in groups.values():
        if entry["times"] is None:
            result.append(((entry["pokemon"], entry["level"]), None, entry["weight"], frozenset(entry["slots"])))
            continue
        sl = (entry["pokemon"], entry["level"])
        acc = pending.setdefault(sl, {"weights": {}, "slots": set()})
        for t in entry["times"]:
            acc["weights"][t] = acc["weights"].get(t, 0) + entry["weight"]
        acc["slots"] |= entry["slots"]

    for sl, data in pending.items():
        per_time = data["weights"]
        slots = data["slots"]

        for times, weight in merge_time_weights(
            {t: per_time.get(t, 0) for t in TIMES}
        ):
            result.append((sl, times, weight, slots))

    mons = []
    for (pokemon, level), times, weight, slots in result:
        entry = {"pokemon": pokemon, "level": level, "weight": norm_weight(weight), "slots": sorted(slots)}
        # All times = anytime
        if times is not None and times != ALL_TIMES:
            entry["time"] = ",".join(t for t in TIMES if t in times)
        mons.append(entry)

    def _time_order(x):
        if "time" not in x:
            return -1
        return min(TIMES.index(t) for t in x["time"].split(","))

    mons.sort(key=lambda x: (_time_order(x), -x["weight"]))
    return mons


def compact_and_emit(spawns, slots, weights, has_times, zone_name,
                    context_label, ctx_preset, suffix="", night_fish=None,
                    night_slot=None):
    """Compact slots and append one make_entry per result to spawns."""
    if not slots:
        return
    compacted = compact_slots(slots, weights, has_times,
                               night_fish=night_fish, night_slot=night_slot)
    for i, entry in enumerate(compacted):
        spawns.append(make_entry(zone_name, entry, context_label,
                                ctx_preset, i, suffix))


class SpawnEmitter:
    """Per-map emitter: binds spawns accumulator and zone name to compact_and_emit."""

    def __init__(self, spawns, zone_name):
        self.spawns = spawns
        self.zone_name = zone_name

    def emit(self, slots, weights, has_times, context_label, ctx_preset, suffix="",
             night_fish=None, night_slot=None):
        compact_and_emit(self.spawns, slots, weights, has_times, self.zone_name,
                        context_label, ctx_preset, suffix,
                        night_fish=night_fish, night_slot=night_slot)


def night_slot_in_group(night_slot, affected_indices):
    """Map a night fishing slot's global index (into the rod's slot list) to its index
    within a swarm-affected subgroup. Returns None if the slot is not in that subgroup."""
    if night_slot is None or night_slot not in affected_indices:
        return None
    return sorted(affected_indices).index(night_slot)


def replacement_entries(affected_slots, affected_weights, active_species, has_times,
                        night_fish=None, night_slot=None):
    """Compact affected slots as inactive; create active entries for a replacement species."""
    inactive = compact_slots(
        affected_slots, affected_weights, has_times,
        night_fish=night_fish, night_slot=night_slot,
    )
    # Active entries replace the species but keep the displaced slot's level
    synth_slots = [{"pokemon": active_species, "level": s.get("level")} for s in affected_slots]
    synth_weights = list(affected_weights)
    active = compact_slots(synth_slots, synth_weights, has_times)
    return inactive, active



def compact_surf_and_fishing(enc):
    """Run compaction for surf and fishing contexts of one map."""
    out = {}

    if "surf" in enc:
        out["surf"] = compact_slots(
            enc["surf"]["mons"], SLOT_WEIGHTS["surf"], has_times=False
        )

    night_fish = enc.get("nightFish")
    fishing = {}
    for rod in RODS:
        ctx = enc.get("fishing", {}).get(rod)
        if not ctx:
            continue
        rod_idx = RODS.index(rod)
        fishing[rod] = compact_slots(
            ctx["mons"],
            SLOT_WEIGHTS["fishing"],
            has_times=False,
            night_fish=night_fish,
            night_slot=NIGHT_FISH_SLOT[rod_idx],
        )
    if fishing:
        out["fishing"] = fishing

    return out



def make_entry_id(zone_name, context_label, idx, id_suffix=""):
    """Build the spawn entry id string."""
    if not id_suffix:
        return f"{zone_name}-{context_label}-{idx}"
    if id_suffix.startswith("-swarm"):
        kind = id_suffix.lstrip("-").split("_")[-1]  # inactive / active
        label = f"{context_label}_swarm_{kind}"
    else:
        label = id_suffix.lstrip("-")
    return f"{zone_name}-{label}-{idx}"


def make_entry(zone_name, entry, context_label, ctx_preset, idx, id_suffix=""):
    """Build one spawn entry dict."""
    presets = [ctx_preset, zone_name]
    if "time" in entry and entry["time"]:
        time_str = entry["time"].replace(",", "_")
        presets.append(time_str)
    spawn_id = make_entry_id(zone_name, context_label, idx, id_suffix)
    return {
        "id": spawn_id,
        "presets": presets,
        "pokemon": entry["pokemon"],
        "level": entry["level"],
        "weight": entry["weight"],
    }

# ---------------------------------------------------------------------------
# Per-map generators
# ---------------------------------------------------------------------------

def generate_land(enc: dict, zone: dict, zone_name: str, has_sound: bool, hoenn: list, sinnoh: list) -> list:
    """Generate land spawn entries."""
    spawns = []
    emitter = SpawnEmitter(spawns, zone_name)
    land_context = zone.get("landContext", "none")
    if land_context == "none":
        return spawns
    ctx_preset = land_context
    land_mons = enc.get("land", {}).get("mons", [])
    land_weights = SLOT_WEIGHTS["land"][:len(land_mons)]

    excluded = set()
    if has_sound:
        excluded |= set(SOUND_SLOT_INDICES)
    land_swarm = enc.get("landSwarm")
    if land_swarm:
        excluded |= LAND_SWARM_SLOTS
    non_sound_indices = [i for i in range(len(land_mons)) if i not in excluded]
    non_sound_slots = [land_mons[i] for i in non_sound_indices]
    non_sound_weights = [SLOT_WEIGHTS["land"][i] for i in non_sound_indices]
    sound_slots_raw = [land_mons[i] for i in range(2, min(6, len(land_mons)))] if has_sound else []
    sound_weights = [SLOT_WEIGHTS["land"][i] for i in range(2, min(6, len(land_mons)))] if has_sound else []

    # Non-sound (and full, when no sound) land entries
    if land_mons and not has_sound:
        emitter.emit(land_mons, land_weights,
                     True, "land", ctx_preset)
    elif non_sound_slots:
        emitter.emit(non_sound_slots, non_sound_weights, True,
                     "land", ctx_preset)

    # Sound-inactive entries for sound slots
    if sound_slots_raw and has_sound:
        emitter.emit(sound_slots_raw, sound_weights, True,
                     "land", ctx_preset, "-sound_inactive")

    # Sound-active entries (hoenn/sinnoh replacement)
    if has_sound and hoenn and sound_slots_raw:
        hoenn_slots, hoenn_w = [], []
        for si, orig_slot in enumerate(sound_slots_raw):
            elem_idx = SOUND_ELEM_INDEX[si]
            if elem_idx < len(hoenn):
                hoenn_slots.append({"pokemon": hoenn[elem_idx], "level": orig_slot.get("level")})
                hoenn_w.append(sound_weights[si])
        emitter.emit(hoenn_slots, hoenn_w, True,
                     "land", ctx_preset, "-hoennsound_active")

    if has_sound and sinnoh and sound_slots_raw:
        sinnoh_slots, sinnoh_w = [], []
        for si, orig_slot in enumerate(sound_slots_raw):
            elem_idx = SOUND_ELEM_INDEX[si]
            if elem_idx < len(sinnoh):
                sinnoh_slots.append({"pokemon": sinnoh[elem_idx], "level": orig_slot.get("level")})
                sinnoh_w.append(sound_weights[si])
        emitter.emit(sinnoh_slots, sinnoh_w, True,
                     "land", ctx_preset, "-sinnohsound_active")

    # Swarm entries
    land_swarm = enc.get("landSwarm")
    if land_swarm and len(land_mons) >= 2:
        swarm_affected = land_mons[:2]
        swarm_affected_w = SLOT_WEIGHTS["land"][:2]
        swarm_inactive, swarm_active = replacement_entries(
            swarm_affected, swarm_affected_w, land_swarm, has_times=True)
        for i, entry in enumerate(swarm_inactive):
            spawns.append(make_entry(zone_name, entry, "land", ctx_preset, i, "-swarm_inactive"))
        for i, entry in enumerate(swarm_active):
            spawns.append(make_entry(zone_name, entry, "land", ctx_preset, i, "-swarm_active"))

    return spawns


def generate_surf(enc: dict, zone: dict, zone_name: str) -> list:
    """Generate surf spawn entries."""
    spawns = []
    emitter = SpawnEmitter(spawns, zone_name)
    surf_mons = enc.get("surf", {}).get("mons", [])
    if not surf_mons:
        return spawns
    surf_swarm = enc.get("surfSwarm")
    if surf_swarm:
        # Swarm replacement: slot 0 inactive, swarm species active
        surf_inactive, surf_active = replacement_entries(
            surf_mons[:1], SLOT_WEIGHTS["surf"][:1], surf_swarm, has_times=False,
        )
        for i, entry in enumerate(surf_inactive):
            spawns.append(make_entry(zone_name, entry, "surf", "surf", i, "-swarm_inactive"))
        for i, entry in enumerate(surf_active):
            spawns.append(make_entry(zone_name, entry, "surf", "surf", i, "-swarm_active"))
        if len(surf_mons) > 1:
            non_surf = surf_mons[1:]
            non_surf_w = SLOT_WEIGHTS["surf"][1:len(surf_mons)]
            emitter.emit(non_surf, non_surf_w, False,
                         "surf", "surf")
    else:
        compacted = compact_surf_and_fishing(enc)
        if "surf" in compacted:
            for i, entry in enumerate(compacted["surf"]):
                spawns.append(make_entry(zone_name, entry, "surf", "surf", i))
    return spawns


def generate_fishing(enc: dict, zone: dict, zone_name: str) -> list:
    """Generate fishing spawn entries."""
    spawns = []
    emitter = SpawnEmitter(spawns, zone_name)
    fishing_raw = enc.get("fishing", {})
    fish_swarm = enc.get("fishSwarm")
    night_fish = enc.get("nightFish")
    for rod in RODS:
        ctx = fishing_raw.get(rod)
        if not ctx:
            continue
        mons = ctx.get("mons", [])
        if not mons:
            continue
        affected_slots_spec = FISHING_SWARM_SLOTS[rod]
        if affected_slots_spec is None:
            affected_indices = set(range(len(mons)))
        else:
            affected_indices = {i for i in affected_slots_spec if i < len(mons)}

        has_swarm = bool(fish_swarm) and bool(affected_indices)
        night_slot = NIGHT_FISH_SLOT[RODS.index(rod)]

        if has_swarm:
            affected_mons = [mons[i] for i in sorted(affected_indices)]
            affected_w = [SLOT_WEIGHTS["fishing"][i] for i in sorted(affected_indices)]
            non_affected_indices = [i for i in range(len(mons)) if i not in affected_indices]
            non_affected_mons = [mons[i] for i in non_affected_indices]
            non_affected_w = [SLOT_WEIGHTS["fishing"][i] for i in non_affected_indices]

            emitter.emit(
                affected_mons, affected_w, False,
                rod, rod, "-swarm_inactive",
                night_fish=night_fish,
                night_slot=night_slot_in_group(night_slot, affected_indices),
            )

            swarm_slots = []
            swarm_w = []
            for si in sorted(affected_indices):
                orig_slot = mons[si]
                synth_slot = {"pokemon": fish_swarm, "level": orig_slot.get("level")}
                swarm_slots.append(synth_slot)
                swarm_w.append(SLOT_WEIGHTS["fishing"][si])
            emitter.emit(swarm_slots, swarm_w, False,
                         rod, rod, "-swarm_active")

            if non_affected_mons:
                non_aff_ns = night_slot_in_group(night_slot, set(non_affected_indices))
                emitter.emit(
                    non_affected_mons, non_affected_w, False,
                    rod, rod, "",
                    night_fish=night_fish, night_slot=non_aff_ns,
                )
        else:
            compacted = compact_surf_and_fishing(enc)
            if rod in compacted.get("fishing", {}):
                for i, entry in enumerate(compacted["fishing"][rod]):
                    spawns.append(make_entry(zone_name, entry, rod, rod, i))
    return spawns


def generate_for_map(enc: dict, zone: dict) -> dict:
    """Generate spawn entries for one map from its encounter and zone data."""
    if zone.get("landContext") == "none" and zone.get("coords") and enc.get("land", {}).get("mons"):
        raise ValueError(
            f"{enc['map']} ({zone['name']}): landContext is 'none' but has land spawns and non-empty coords"
        )
    hoenn = enc.get("hoenn") or []
    sinnoh = enc.get("sinnoh") or []
    has_sound = bool(hoenn or sinnoh)
    zone_name = zone["name"].lower()
    spawns = []

    spawns.extend(generate_land(enc, zone, zone_name, has_sound, hoenn, sinnoh))
    spawns.extend(generate_surf(enc, zone, zone_name))
    spawns.extend(generate_fishing(enc, zone, zone_name))

    return {"spawns": spawns}

def load_inputs() -> tuple:
    """Load and index encounter data by map code."""
    encounters = json.loads(ENC_DATA.read_text(encoding="utf-8"))
    zones = {
        z["map"]: z for z in json.loads(ZONES.read_text(encoding="utf-8"))
    }
    return encounters, zones


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--zone", default=None, help="Only generate for this map code (e.g. R32)")
    args = parser.parse_args()

    encounters, zones = load_inputs()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    for enc in encounters:
        if args.zone and enc["map"] != args.zone and enc.get("name", "").lower() != args.zone.lower():
            continue
        zone = zones.get(enc["map"])
        if zone is None:
            print(f"no zone for {enc['map']}, skipping")
            continue
        if not zone.get("coords"):
            continue
        if zone.get("landContext") == "none" and not enc.get("surf") and not enc.get("fishing"):
            continue
        result = generate_for_map(enc, zone)
        if not result["spawns"]:
            continue
        name = enc['name'].lower()
        out_path = OUT_DIR / f"{name}.json"
        out_path.write_text(
            json.dumps(result, indent=2, ensure_ascii=False), encoding="utf-8"
        )
        print(f"Wrote spawn_pool_world\\{name}.json")


if __name__ == "__main__":
    main()
