import json
import re
from pathlib import Path
import pandas as pd
import os
import time
from concurrent.futures import ThreadPoolExecutor, as_completed

PROJECT_ROOT = Path(__file__).resolve().parent

TBCS_TRAINERS_EXPORT_DIR = (
    PROJECT_ROOT
    / "data"
    / "molang"
    / "challengemode_trainers"
)

TRAINER_REGISTRY = (
    PROJECT_ROOT
    / "data"
    / "molang"
    / "trainers.json"
)

INTERACTIONS_DIR = (
    PROJECT_ROOT
    / "datapacks"
    / "CobblemonJohto"
    / "data"
    / "cobblemon"
    / "dialogues"
    / "interactions"
)

NPC_DIR = (
    PROJECT_ROOT
    / "datapacks"
    / "CobblemonJohto"
    / "data"
    / "cobblemon"
    / "npcs"
    / "trainers"
)

KANTO_FOLDERS = {
    "route1","route2","route3","route4","route5","route6","route7","route8","route9",
    "route10","route11","route12","route13","route14","route15","route17","route18",
    "route19","route20","route21","route24","route25",
    "pewtergym","ceruleangym","vermiliongym","celadongym",
    "fuchsiagym","saffrongym","cinnabargym",
    "seafoamislands","pokemonmansion","viridianforest"
}

TEAMS_XLSX_PATH = PROJECT_ROOT / "challengemode_trainers.xlsx"

if TEAMS_XLSX_PATH.exists():
    ENABLE_CHALLENGE_MODE = True
else:
    ENABLE_CHALLENGE_MODE = False

def load_excel_teams(valid_items, valid_moves, excel_file):
    if not ENABLE_CHALLENGE_MODE:
        return {}

    df = excel_file.parse()

    teams = {}

    for row in df.to_dict('records'):
        if pd.isna(row["Folder"]) or pd.isna(row["Trainer"]):
            break
        
        folder = str(row["Folder"]).strip().lower()
        trainer = str(row["Trainer"]).strip().lower()
        
        teams.setdefault(trainer, {"party": {}})
        teams[trainer]["name"] = " ".join([str(row["Trainer Class"]),str(row["Name"])]) if not pd.isna(row["Trainer Class"]) else str(row["Name"])

        pokemon = {}

        pokemon["species"] = (
            str(row["Species"])
            .strip()
            .lower()
            .replace("'", "")
            .replace("’", "")
            .replace(".", "")
            .replace(" ", "")
        )
        
        if not pd.isna(row["Gender"]):
            opt = {
                "M": "MALE",
                "F": "FEMALE"
            }
            gender = opt.get(str(row["Gender"]).upper())

            if gender:
                pokemon["gender"] = gender
        
        if not pd.isna(row["Item"]):
            item = (
                str(row["Item"])
                .strip()
                .lower()
                .replace(" ", "_")
                .replace("-", "_")
            )

            if item not in valid_items:
                raise ValueError(f"Invalid item: {item}")
            else:
                pokemon["helditem"] = item

        if not pd.isna(row["Ability"]):
            ability = (
                str(row["Ability"])
                .strip()
                .lower()
                .replace("'", "")
                .replace("’", "")
                .replace(".", "")
                .replace(" ", "")
            )
            # validate?
            pokemon["ability"] = ability
        
        pokemon["level"] = int(row["Level"]) if not pd.isna(row["Level"]) else 1
        
        if not pd.isna(row["EVs"]):
            try:
                evs = json.loads(row["EVs"])
            except:
                species = pokemon["species"]
                print(f"Error: Couldn't load EVs for {trainer}'s {species}")
            else:
                pokemon["evs"] = evs

        if not pd.isna(row["Nature"]):
            nature = (
                str(row["Nature"])
                .strip()
                .lower()
            )
            # validate?
            pokemon["nature"] = nature
        
        if not pd.isna(row["IVs"]):
            pokemon["ivs"] = int(row["IVs"])

        moveset = []
        for col in ["Move1", "Move2", "Move3", "Move4"]:
            if not pd.isna(row[col]):
                move = (
                    str(row[col])
                    .strip()
                    .lower()
                    .replace(" ", "")
                    .replace("-", "")
                )

                if move not in valid_moves:
                    raise ValueError(f"Invalid move: {move}")
                else:
                    moveset.append(move)

        if moveset:
            pokemon["moveset"] = ",".join(moveset)

        teams[trainer]["party"][len(teams[trainer]["party"])] = pokemon

    return teams

def load_validation_lists(excel_file):
    df = excel_file.parse("Lists")

    def normalize_item(val):
        return (
            str(val)
            .strip()
            .lower()
            .replace(" ", "_")
            .replace("-", "_")
        )

    def normalize_move(val):
        return (
            str(val)
            .strip()
            .lower()
            .replace(" ", "")
            .replace("-", "")
        )
    items = set()
    moves = set()

    if "ItemsList" in df.columns:
        items = {
            normalize_item(v)
            for v in df["ItemsList"]
            if not pd.isna(v)
        }

    if "MovesList" in df.columns:
        moves = {
            normalize_move(v)
            for v in df["MovesList"]
            if not pd.isna(v)
        }

    #print("Sample items:", list(items)[:10])
    #print("Sample moves:", list(moves)[:10])

    return items, moves

def index_files_by_name(root: Path, suffix: str = "") -> dict:
    """Map each file's name (minus `suffix`) to the folder holding it"""
    return {path.stem.removesuffix(suffix): path.parent.name for path in root.rglob(f"*{suffix}.json")}

def get_trainer_files(registry: dict, npc_folders: dict, interaction_folders: dict):
    """List the files to rewrite for every registered trainer
    For NPC classes, treat registry key as filename.
    For interaction files, instead use doubles_id if it exists."""
    interaction_files = set()
    npc_files = []

    for npc_class, data in registry.items():
        trainer_id = data.get("doubles_id") or npc_class
        interaction_files.add((trainer_id, interaction_folders[trainer_id]))
        npc_files.append((npc_class, npc_folders[npc_class]))

    return sorted(interaction_files), sorted(npc_files)

def validate_challenge_trainers(trainer_ids, registry: dict, doubles_teams: set):
    problems = []

    # Doubles teams are battled under their shared name
    battleable = {npc_class for npc_class, data in registry.items() if not data.get("doubles_id")} | doubles_teams

    for trainer_id in trainer_ids:
        # Numeric variants (e.g. "azalea_silver1") are keyed off their base NPC class
        base_class = re.sub(r"\d+$", "", trainer_id)

        if trainer_id in battleable or base_class in battleable:
            continue

        doubles_id = registry.get(base_class, {}).get("doubles_id")
        if doubles_id:
            problems.append(f"'{trainer_id}' should be '{doubles_id}'")
        else:
            problems.append(f"'{trainer_id}' is not registered in {TRAINER_REGISTRY.name}")

    if problems:
        raise ValueError("Challenge mode trainers are not registered in the map:\n  " + "\n  ".join(problems))

def get_battle_music(trainer_id: str, folder: str) -> int:
    if trainer_id.startswith("lance") or trainer_id == "red":
        return 16  # Champion music
    if trainer_id.startswith("rocket"):
        return 14  # Rocket music
    if folder == "silver":
        return 13  # Rival music
    if trainer_id.startswith(("falkner","bugsy","whitney","morty","chuck","jasmine","pryce","clair","will","koga","bruno","karen")):
        return 12  # Johto Gym Leader & Elite Four music
    if trainer_id.startswith(("brock","misty","surge","erika","janine","sabrina","blaine","blue")):
        return 18  # Kanto Gym Leader music
    if folder in KANTO_FOLDERS:
        return 17  # Kanto trainer music
    return 11  # Default Johto trainer

def build_battle_action(trainer_id: str, folder: str):
    music_id = get_battle_music(trainer_id, folder)

    actions = [
        "q.dialogue.close;",
        f"q.run_script('cobblemon:start_battle', {music_id});"
    ]

    return actions

def update_npc_class(npc_class: str, folder: str):
    """Point an NPC class's interaction field at the shared molang script"""
    npc_file = NPC_DIR / folder / f"{npc_class}.json"

    with open(npc_file, "r", encoding="utf-8") as f:
        npc_data = json.load(f)

    npc_data["interaction"] = {
        "type": "script",
        "script": "johto:trainer_dialogue_handler"
    }

    # write back
    with open(npc_file, "w", encoding="utf-8") as f:
        json.dump(npc_data, f, indent=4, ensure_ascii=False)

    #print(f"Updated NPC: {npc_file}")

    return True

def export_challenge_trainers(excel_teams):
    TBCS_TRAINERS_EXPORT_DIR.mkdir(parents=True, exist_ok=True)

    for trainer_id, data in excel_teams.items():
        output_file = TBCS_TRAINERS_EXPORT_DIR / f"{trainer_id}.json"
        with open(output_file, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)

        #print(f"Exported trainer file: {output_file}")

def update_trainer_interaction(trainer_id: str, folder: str):
    """Modify a trainer's dialogue file to always flow to battle, and to use our battle script"""
    interaction_file = INTERACTIONS_DIR / folder / f"{trainer_id}_interaction.json"

    with open(interaction_file, "r", encoding="utf-8") as f:
        data = json.load(f)

    # Update battle pages
    battle_action = build_battle_action(trainer_id, folder)

    for page in data.get("pages", []):
        input_data = page.get("input")
        if not isinstance(input_data, dict):
            continue

        options = input_data.get("options")
        if not isinstance(options, list):
            continue

        battle_options = [opt for opt in options if isinstance(opt["action"], list) and any("start_battle(q.player)" in line for line in opt["action"])]
        if not battle_options:
            continue

        # Keep only battle option
        input_data["options"] = battle_options
        input_data["options"][0]["action"] = battle_action

        # Timeout/escape: Goto to battle action
        #page_id = page["id"]
        #value = battle_options[0]["value"]
        
        #goto_battle = [
        #    f"q.dialogue.current_page.id != '{page_id}' ? q.dialogue.set_page('{page_id}');",
        #    f"q.dialogue.input('{value}');"
        #]

        # Add timeout
        #input_data["timeout"] = {
        #    "duration": 3,
        #    "showTimer": True,
        #    "action": f"q.dialogue.input('{value}');",
        #}

        # Add dialogue skip to battle
        data["escapeAction"] = battle_action


    with open(interaction_file, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)

    #print(f"Updated interaction: {interaction_file}")
    return True

def main():
    start = time.time()

    load_registry_start = time.time()
    with open(TRAINER_REGISTRY, "r", encoding="utf-8") as f:
        registry = json.load(f)

    npc_folders = index_files_by_name(NPC_DIR)
    interaction_folders = index_files_by_name(INTERACTIONS_DIR, "_interaction")
    doubles_teams = {data["doubles_id"] for data in registry.values() if data.get("doubles_id")}
    print(f"Loaded {len(registry)} trainers from {TRAINER_REGISTRY.name} in {time.time() - load_registry_start:.2f}s")

    if ENABLE_CHALLENGE_MODE:
        load_excel_start = time.time()
        excel_file = pd.ExcelFile(TEAMS_XLSX_PATH)
        print(f"Loaded Excel file in {time.time() - load_excel_start:.2f}s")

        validation_start = time.time()
        valid_items, valid_moves = load_validation_lists(excel_file)
        print(f"Validation lists loaded in {time.time() - validation_start:.2f}s")

        if not valid_items:
            raise ValueError("No items loaded from Lists sheet!")

        if not valid_moves:
            raise ValueError("No moves loaded from Lists sheet!")
        
        process_excel_start = time.time()
        excel_teams = load_excel_teams(valid_items, valid_moves, excel_file)
        
        # Show a few samples
        #for i, (k, v) in enumerate(excel_teams.items()):
        #    print(f"Sample {i}: {k} -> {len(v)} mons")
        #    if i >= 70:
        #        break

        validate_challenge_trainers(excel_teams, registry, doubles_teams)

        export_challenge_trainers(excel_teams)
        print(f"Processed {len(excel_teams)} Excel teams in {time.time() - process_excel_start:.2f}s")
    else:
        print("Challenge mode disabled, skipping Excel loading")

    processing_start = time.time()
    interaction_files, npc_files = get_trainer_files(registry, npc_folders, interaction_folders)

    def _update_trainer_interaction(trainer_id: str, folder: str):
        try:
            update_trainer_interaction(trainer_id, folder)
            return True
        except Exception as e:
            print(f"FAILED: {folder}/{trainer_id}_interaction.json")
            print(e)
            return False

    def _update_npc_class(npc_class: str, folder: str):
        try:
            update_npc_class(npc_class, folder)
            return True
        except Exception as e:
            print(f"FAILED: {folder}/{npc_class}.json")
            print(e)
            return False

    with ThreadPoolExecutor(max_workers=8) as executor:
        interaction_futures = [executor.submit(_update_trainer_interaction, *file) for file in interaction_files]
        npc_futures = [executor.submit(_update_npc_class, *file) for file in npc_files]

        interaction_count = sum(1 for future in as_completed(interaction_futures) if future.result())
        npc_count = sum(1 for future in as_completed(npc_futures) if future.result())
    
    print(f"Modified {interaction_count}/{len(interaction_files)} interaction files and {npc_count}/{len(npc_files)} NPC files in {time.time() - processing_start:.2f}s")
    print(f"Done. Total time: {time.time() - start:.2f}s")

if __name__ == "__main__":
    main()