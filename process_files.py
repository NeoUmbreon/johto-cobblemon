import json
from pathlib import Path
import re
import pandas as pd
import os

PROJECT_ROOT = Path(__file__).resolve().parent

TBCS_TRAINERS_EXPORT_DIR = (
    PROJECT_ROOT
    / "data"
    / "molang"
    / "challengemode_trainers"
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

BATTLE_END_DIR = (
    PROJECT_ROOT
    / "datapacks"
    / "CobblemonJohto"
    / "data"
    / "cobblemon"
    / "dialogues"
    / "battle_ends"
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

def load_excel_teams(valid_items, valid_moves):
    if not ENABLE_CHALLENGE_MODE:
        return {}

    df = pd.read_excel(TEAMS_XLSX_PATH)

    teams = {}

    for _, row in df.iterrows():
        if pd.isna(row["Folder"]) or pd.isna(row["Trainer"]):
            break
        
        folder = str(row["Folder"]).strip().lower()
        trainer = str(row["Trainer"]).strip().lower()
        
        teams.setdefault(trainer, {"party": {}})
        teams[trainer]["name"] = " ".join([str(row["Trainer Class"]),str(row["Name"])]) if not pd.isna(row["Trainer Class"]) else str(row["Name"])

        pokemon = {}

        species = str(row["Species"]).strip().lower().replace("'", "").replace("’", "").replace(".", "").replace(" ", "")
        level = int(row["Level"]) if not pd.isna(row["Level"]) else 1

        pokemon["properties"] = f"{species} level={level}"
        
        if "Item" in row and not pd.isna(row["Item"]):
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

        if "Ability" in row and not pd.isna(row["Ability"]):
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
        
        if not pd.isna(row["EVs"]):
            try:
                evs = json.loads(row["EVs"])
            except:
                print(f"Error: Couldn't load EVs for {trainer}'s {species}")
            else:
                pokemon["evs"] = evs

        if "Nature" in row and not pd.isna(row["Nature"]):
            nature = (
                str(row["Nature"])
                .strip()
                .lower()
            )
            # validate?
            pokemon["nature"] = nature
        
        if not pd.isna(row["IVs"]):
            pokemon["ivs"] = int(row["IVs"])

        moveset = {}
        for i, col in enumerate(["Move1", "Move2", "Move3", "Move4"]):
            if col in row and not pd.isna(row[col]):
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
                    moveset[i] = move

        if moveset:
            pokemon["moveset"] = moveset

        teams[trainer]["party"][len(teams[trainer]["party"])] = pokemon

    return teams

def load_validation_lists():
    df = pd.read_excel(TEAMS_XLSX_PATH, sheet_name="Lists")

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
    battle_id = get_battle_music(trainer_id, folder)

    actions = [
        "q.get_variable(q.file.load('data/molang/config.json'), 'hotReload') == true ? q.file.clear('data/molang/config.json');",
        "v.format = ( q.npc.config.doubles == 0 ? 'singles' : 'doubles' );",
        "q.player.remove_tag('InDialogue');",
        f"q.run_command('scoreboard players set ' + q.player.username + ' BattleStart {battle_id}');",
        "q.run_command('execute as ' + q.player.username + ' run function johto:tools/forceclick');",
        "q.get_variable(q.file.load('data/molang/config.json'), 'challengeMode') == true ? { q.run_script('johto:instantiate_rctapi_trainer') == 0 ? q.npc.start_battle(q.player, v.format); } : q.npc.start_battle(q.player, v.format);",
        "q.dialogue.close;"
    ]

    return actions

def generate_battle_end_copy(trainer_id: str, folder: str):
    end_file = BATTLE_END_DIR / folder / f"{trainer_id}_end.json"
    if not end_file.exists():
        #print(f"Battle end file not found: {end_file}")
        return None

    with open(end_file, "r", encoding="utf-8") as f:
        data = json.load(f)

    # Remove scoreboard and tellraw commands
    init_actions = data.get("initializationAction", [])
    cleaned_actions = [
        cmd
        for cmd in init_actions
        if not (
            cmd.startswith("q.run_command('scoreboard")
            or cmd.startswith("q.run_command('tellraw")
            or "johto:tools/forceclick" in cmd
        )
    ]
    data["initializationAction"] = cleaned_actions

    new_file = BATTLE_END_DIR / folder / f"{trainer_id}_end_defeated.json"
    with open(new_file, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)

    #print(f"Generated battle end copy: {new_file}")
    return new_file

# Inject Trainer Variables into config
def inject_trainer_config(entity_data, trainer_id, auto_battle):
    if "config" not in entity_data or not isinstance(entity_data["config"], list):
        entity_data["config"] = []

    existing_vars = {c.get("variableName") for c in entity_data["config"]}

    def add_var(obj):
        entity_data["config"].append(obj)

    if "auto_battle" not in existing_vars:
        add_var({
            "variableName": "auto_battle",
            "displayName": "npc.variable.auto_battle.name",
            "description": "npc.variable.auto_battle.desc",
            "type": "BOOLEAN",
            "defaultValue": auto_battle
        })

    if "trainer_id" not in existing_vars:
        add_var({
            "variableName": "trainer_id",
            "displayName": "npc.variable.trainer_id.name",
            "description": "npc.variable.trainer_id.desc",
            "type": "TEXT",
            "defaultValue": trainer_id
        })

def update_trainer_entity(trainer_id: str, folder: str):
    # Auto-battle exclusions
    exclude_folder = ["gym_leaders","gym_leader_rematches","fuchsiagym"]
    exclude_trainer = ["sageli","rocketproton1"]
    auto_battle = not (folder.lower() in exclude_folder or trainer_id in exclude_trainer)

    entity_file = NPC_DIR / folder / f"{trainer_id}.json"

    if not entity_file.exists():
        return

    with open(entity_file, "r", encoding="utf-8") as f:
        entity_data = json.load(f)

    # inject config
    inject_trainer_config(entity_data, trainer_id, auto_battle)

    # interaction handling
    entity_data["interaction"] = {
        "type": "script",
        "script": "johto:trainer_dialogue_handler"
    }

    # write back
    with open(entity_file, "w", encoding="utf-8") as f:
        json.dump(entity_data, f, indent=4, ensure_ascii=False)

    #print(f"Updated entity: {entity_file}")

def export_challenge_trainers(excel_teams):
    TBCS_TRAINERS_EXPORT_DIR.mkdir(parents=True, exist_ok=True)

    for trainer_id, data in excel_teams.items():
        output_file = TBCS_TRAINERS_EXPORT_DIR / f"{trainer_id}.json"
        with open(output_file, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)

        #print(f"Exported trainer file: {output_file}")

def update_interaction_file(path: Path):
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)

    trainer_id = path.stem.replace("_interaction", "")
    folder = path.parent.name

    # Update battle pages
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
        input_data["options"][0]["action"] = build_battle_action(trainer_id, folder)

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
        data["escapeAction"] = build_battle_action(trainer_id, folder)


    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)

    #print(f"Updated entity interaction: {path}")
    return trainer_id, folder
    
def should_check(folder, trainer):
    # Skip generated or special cases
    if trainer.endswith("_end") or trainer.endswith("_end_defeated"):
        return False

    if folder == "silver" or folder == "pokemonmansion":
        return False

    return True

def main():
    files = sorted(INTERACTIONS_DIR.rglob("*_interaction.json"))
    print(f"Found {len(files)} interaction files\n")

    if ENABLE_CHALLENGE_MODE:
        valid_items, valid_moves = load_validation_lists()
        if not valid_items:
            raise ValueError("No items loaded from Lists sheet!")

        if not valid_moves:
            raise ValueError("No moves loaded from Lists sheet!")
        
        excel_df = pd.read_excel(TEAMS_XLSX_PATH)
        
        excel_teams = load_excel_teams(valid_items, valid_moves)
        print(f"Loaded {len(excel_teams)} Excel trainer entries")
        
        """
        # Show a few samples
        for i, (k, v) in enumerate(excel_teams.items()):
            print(f"Sample {i}: {k} -> {len(v)} mons")
            if i >= 70:
                break
        """

        export_challenge_trainers(excel_teams)
    else:
        print("Challenge mode disabled, skipping Excel loading")

    processed = []

    for file_path in files:
        try:
            result = update_interaction_file(file_path)
            if result:
                trainer_id, folder = result
                processed.append((trainer_id, folder))

        except Exception as e:
            print(f"FAILED: {file_path}")
            print(e)

    for trainer_id, folder in processed:

        #is_gym_leader = "gym_leaders" in folder.lower() or "gym_leader_rematches" in folder.lower()

        #if not is_gym_leader:
        #    generate_battle_end_copy(trainer_id, folder)

        update_trainer_entity(trainer_id, folder)

    print("\nDone.")


if __name__ == "__main__":
    main()