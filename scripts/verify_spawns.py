"""Verify spawn pool output: for each of 18 conditions, each context
(land/surf/old_rod/good_rod/super_rod) should separately sum to 100 weight."""

import json
import glob
import os
import itertools
from collections import defaultdict

import argparse

TIME_PRESETS = {
    "morn": {"morn"},
    "day": {"day"},
    "nite": {"nite"},
    "morn_day": {"morn", "day"},
    "morn_nite": {"morn", "nite"},
    "day_nite": {"day", "nite"},
}

TIMES = ("morn", "day", "nite")
SWARM_STATES = [False, True]
RADIO_STATES = ["none", "hoenn", "sinnoh"]

CONTEXTS = ["land", "surf", "old_rod", "good_rod", "super_rod"]


def get_context(entry):
    """First preset = context preset"""
    presets = entry.get("presets", [])
    if not presets:
        return None
    first = presets[0]
    if first in ("grass", "indoor"):
        return "land"
    if first == "surf":
        return "surf"
    if first in ("old_rod", "good_rod", "super_rod"):
        return first
    return None


def get_time_preset(entry):
    """Extract time preset"""
    presets = entry.get("presets", [])
    last_preset = presets[len(presets) - 1]
    if last_preset in TIME_PRESETS:
        return last_preset
    return None  # anytime


def time_matches(time_preset, current_time):
    """Check if time preset matches or includes the current time"""
    if time_preset is None:
        return True  # anytime
    allowed = TIME_PRESETS.get(time_preset, set())
    return current_time in allowed


def swarm_active(entry_id, swarm_state):
    """Check if entry is active during swarm (True=active, False=inactive)"""
    if "swarm_inactive" in entry_id:
        return not swarm_state
    if "swarm_active" in entry_id:
        return swarm_state
    return True  # not affected by swarm


def radio_active(entry_id, radio_state):
    """Check if entry is active during radio state"""
    if "sound_inactive" in entry_id:
        return radio_state == "none"
    if "hoennsound_active" in entry_id:
        return radio_state == "hoenn"
    if "sinnohsound_active" in entry_id:
        return radio_state == "sinnoh"
    return True  # not affected by radio


def entry_active(entry, time, swarm_state, radio_state):
    """Check if an entry is active under the given condition"""
    eid = entry["id"]
    tp = get_time_preset(entry)
    if not time_matches(tp, time):
        return False
    if not swarm_active(eid, swarm_state):
        return False
    if not radio_active(eid, radio_state):
        return False
    return True




def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--zone", default=None, help="Filter to one map (filename stem)")
    parser.add_argument("--verbose", action="store_true", help="Print weight sum for each condition")
    args = parser.parse_args()

    files = sorted(glob.glob("datapacks/CobblemonJohto/data/cobblemon/spawn_pool_world/**/*.json", recursive=True))
    if args.zone:
        files = [f for f in files if os.path.splitext(os.path.basename(f))[0].lower() == args.zone.lower()]

    all_failures = []
    for f in files:
        data = json.load(open(f))
        spawns = data.get("spawns", [])
        by_context = defaultdict(list)
        for entry in spawns:
            ctx = get_context(entry)
            if ctx:
                by_context[ctx].append(entry)

        has_swarm = any("swarm_active" in e.get("id", "") or "swarm_inactive" in e.get("id", "") for e in spawns)
        has_radio = any(
            "sound_inactive" in e.get("id", "")
            or "hoennsound_active" in e.get("id", "")
            or "sinnohsound_active" in e.get("id", "")
            for e in spawns
        )

        swarm_states = SWARM_STATES if has_swarm else [False]
        radio_states = RADIO_STATES if has_radio else ["none"]

        def expected_total(ctx):
            if "_block.json" in os.path.basename(f): # safari zone block-specific constants
                if ctx == "surf":
                    return 30
                if ctx in ("old_rod", "good_rod", "super_rod"):
                    return 20
            return 100

        file_failures = []
        for time, swarm_state, radio_state, ctx in itertools.product(TIMES, swarm_states, radio_states, CONTEXTS):
            entries = by_context.get(ctx, [])
            if not entries:
                continue
            active = [e for e in entries if entry_active(e, time, swarm_state, radio_state)]
            total = sum(e.get("weight", 0) for e in active)
            exp = expected_total(ctx)
            if total != exp:
                file_failures.append(
                    f"  {os.path.basename(f)}: time={time} swarm={swarm_state} "
                    f"radio={radio_state} ctx={ctx}: sum={total} (expected {exp}), "
                    f"{len(active)}/{len(entries)} entries active"
                )
            if args.verbose:
                print(f"  {os.path.basename(f)}: time={time} swarm={swarm_state} "
                      f"radio={radio_state} ctx={ctx}: sum={total}")

        all_failures.extend(file_failures)

    if all_failures:
        print(f"FAILURES: {len(all_failures)}")
        for fail in all_failures[:50]:
            print(fail)
        if len(all_failures) > 50:
            print(f"  ... and {len(all_failures) - 50} more")
    else:
        print(f"ALL PASS: {len(files)} files verified")


if __name__ == "__main__":
    main()
