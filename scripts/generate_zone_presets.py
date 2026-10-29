"""Generate spawn_detail_presets for bounding boxes from zones.json.

Reads source_data/zones.json, writes one preset per zone to
cobblemon/spawn_detail_presets/zones/.
"""
import argparse
import json
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
ZONES = REPO_ROOT / "source_data" / "zones.json"
PRESET_DIR = (
    REPO_ROOT
    / "datapacks"
    / "CobblemonJohto"
    / "data"
    / "cobblemon"
    / "spawn_detail_presets"
    / "zones"
)


def validate_box(box, label):
    # minX, minZ, maxX, and maxZ are required
    for key in ("minX", "minZ", "maxX", "maxZ"):
        if key not in box:
            raise ValueError(f"{label}: missing required field '{key}'")
    if box["maxX"] < box["minX"]:
        raise ValueError(
            f"{label}: maxX ({box['maxX']}) < minX ({box['minX']})"
        )
    if box["maxZ"] < box["minZ"]:
        raise ValueError(
            f"{label}: maxZ ({box['maxZ']}) < minZ ({box['minZ']})"
        )
    # Y is optional, only validates min/max if both are present
    if "minY" in box and "maxY" in box and box["maxY"] < box["minY"]:
        raise ValueError(
            f"{label}: maxY ({box['maxY']}) < minY ({box['minY']})"
        )


def generate_route_presets(zones, zone_filter=None):
    PRESET_DIR.mkdir(parents=True, exist_ok=True)
    for z in zones:
        if zone_filter and z["map"] != zone_filter and z.get("name", "").lower() != zone_filter.lower():
            continue
        coords = z.get("coords") or []
        if not coords:
            continue
        for i, box in enumerate(coords):
            validate_box(box, f"{z['map']} ({z['name']}) coords[{i}]")
        preset = {"condition": coords[0]}
        if len(coords) > 1:
            preset["anticondition"] = coords[1]
        name = z["name"].lower()
        out_path = PRESET_DIR / f"{name}.json"
        out_path.write_text(
            json.dumps(preset, indent=2), encoding="utf-8"
        )
        print(f"Wrote zones\\{name}.json")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--zone", default=None, help="Only generate for this map code or name")
    args = parser.parse_args()

    zones = json.loads(ZONES.read_text(encoding="utf-8"))
    generate_route_presets(zones, args.zone)


if __name__ == "__main__":
    main()
