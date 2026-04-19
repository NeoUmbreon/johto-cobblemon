import json
from pathlib import Path
import re
import pandas as pd

PROJECT_ROOT = Path(__file__).resolve().parent

TBCS_TRAINERS_EXPORT_DIR = PROJECT_ROOT / "trainers"

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

ENABLE_CHALLENGE_MODE = False
TEAMS_XLSX_PATH = PROJECT_ROOT / "challengemode_trainers.xlsx"

def load_excel_teams(valid_items, valid_moves):
    if not ENABLE_CHALLENGE_MODE:
        return {}

    df = pd.read_excel(TEAMS_XLSX_PATH)

    teams = {}

    for _, row in df.iterrows():
        folder = str(row["Folder"]).strip().lower()
        trainer = str(row["Trainer"]).strip().lower()

        if pd.isna(row["Folder"]) or pd.isna(row["Trainer"]):
            continue

        key = (folder, trainer)

        pokemon = {
            "species": (
                str(row["Species"])
                .strip()
                .lower()
                .replace("'", "")
                .replace("’", "")
                .replace(".", "")
                .replace(" ", "")
            ),
            "level": int(row["Level"]) if not pd.isna(row["Level"]) else 1
        }
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
                pokemon["item"] = item

        moves = []
        for col in ["Move1", "Move2", "Move3", "Move4"]:
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
                    moves.append(move)

        if moves:
            pokemon["moves"] = moves

        teams.setdefault(key, []).append(pokemon)

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

def apply_excel_team_override(entity_data, folder, trainer_id, excel_teams):
    if not ENABLE_CHALLENGE_MODE:
        return entity_data

    if not folder or not trainer_id:
        return entity_data

    key = (folder.lower().strip(), trainer_id.lower().strip())

    if key not in excel_teams:
        return entity_data

    new_team = excel_teams[key]

    pokemon_entries = []
    for p in new_team:
        entry = f"{p['species']} level={p['level']}"
        if "item" in p:
            entry += f" helditem=cobblemon:{p['item']}"
        if "moves" in p:
            entry += " moves=" + ",".join(p["moves"])
        pokemon_entries.append(entry)

    entity_data["party"] = {
        "type": "simple",
        "pokemon": pokemon_entries
    }

    return entity_data

def is_silver(trainer_id: str) -> bool:
    return "_silver" in trainer_id

def get_silver_base_id(trainer_id: str) -> str:
    return re.sub(r"\d+$", "", trainer_id)

def silver_base_entity(folder: str, trainer_id: str):
    base_id = get_silver_base_id(trainer_id)

    base_file = NPC_DIR / folder / f"{base_id}.json"
    if base_file.exists():
        return base_file

    # Try to find a variant to copy from
    for i in range(1, 4):
        variant_file = NPC_DIR / folder / f"{base_id}{i}.json"
        if variant_file.exists():
            with open(variant_file, "r", encoding="utf-8") as f:
                data = json.load(f)

            # Remove party so base NPC has no team
            data.pop("party", None)

            with open(base_file, "w", encoding="utf-8") as f:
                json.dump(data, f, indent=4, ensure_ascii=False)

            #print(f"Created base silver NPC: {base_file}")
            return base_file

    #print(f"No variant found to create base NPC: {base_id}")
    return None

def export_all_silver_variants(folder: str, base_id: str):
    for i in range(1, 4):
        variant_id = f"{base_id}{i}"
        entity_file = NPC_DIR / folder / f"{variant_id}.json"

        if not entity_file.exists():
            #print(f"Missing variant: {entity_file}")
            continue

        with open(entity_file, "r", encoding="utf-8") as f:
            entity_data = json.load(f)

        trainer_name = entity_data.get("name", variant_id)

        party = entity_data.get("party", {})
        pokemon_list = party.get("pokemon", [])

        team = []

        for entry in pokemon_list:
            match = re.match(r"(.+?)\s+level=(\d+)", entry, re.IGNORECASE)
            if not match:
                continue

            species = match.group(1).strip().lower()
            level = int(match.group(2))

            team.append({
                "species": species,
                "level": level
            })

        export_data = {
            "name": trainer_name,
            "team": team
        }

        TBCS_TRAINERS_EXPORT_DIR.mkdir(exist_ok=True)

        output_file = TBCS_TRAINERS_EXPORT_DIR / f"{variant_id}.json"
        with open(output_file, "w", encoding="utf-8") as f:
            json.dump(export_data, f, indent=2, ensure_ascii=False)

        #print(f"Exported silver trainer: {output_file}")
        
def get_battle_music(folder: str, trainer_id: str) -> int:
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

def get_model_identifier(folder: str, trainer_id) -> str:
    if folder == "silver":
        return "cobblemon:silver"

    entity_file = NPC_DIR / folder / f"{trainer_id}.json"

    if not entity_file.exists():
        #print(f"Entity file not found for identifier: {entity_file}")
        return f"cobblemon:{trainer_id}"  # fallback

    try:
        with open(entity_file, "r", encoding="utf-8") as f:
            data = json.load(f)

        return data.get("resourceIdentifier", f"cobblemon:{trainer_id}")

    except Exception as e:
        #print(f"Failed to read resourceIdentifier from {entity_file}: {e}")
        return f"cobblemon:{trainer_id}"

def build_battle_action(trainer_id: str, battle_id: int):
    actions = []

    #if is_silver(trainer_id):
    #    base_id = get_silver_base_id(trainer_id)

    #    actions.append("q.run_command('tag ' + q.player.username + ' remove InDialogue');")

    #    if "cherrygrove" in base_id:
    #        actions.append("q.run_command('tag ' + q.player.username + ' add Dialogue6');")

    actions.extend([
        "q.run_command('tag ' + q.player.username + ' remove InDialogue');",
        "q.run_command('scoreboard players set ' + q.player.username + ' BattleStart 0');",
        (
            "q.run_command("
            f"'execute as ' + q.player.username + ' at @s"
            f" at @n[type=cobblemon:npc,tag=trainerBusy,distance=..16,nbt={{Config:{{trainer_id:\"{trainer_id}\"}}}}]"
            f" run function johto:trainers/start_battle "
            f"{{trainer_id:\"{trainer_id}\",battle_id:{battle_id}}}'"
            ");"
        ),
        "q.dialogue.close();",
    ])

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
def inject_trainer_config(entity_data, trainer_id, battle_id, trainer_uid, auto_battle):
    if "config" not in entity_data or not isinstance(entity_data["config"], list):
        entity_data["config"] = []

    existing_vars = {c.get("variableName") for c in entity_data["config"]}

    def add_var(obj):
        entity_data["config"].append(obj)

    if "trainer" not in existing_vars:
        add_var({
            "variableName": "trainer",
            "displayName": "npc.variable.trainer.name",
            "description": "npc.variable.trainer.desc",
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

    if "battle_id" not in existing_vars:
        add_var({
            "variableName": "battle_id",
            "displayName": "npc.variable.battle_id.name",
            "description": "npc.variable.battle_id.desc",
            "type": "NUMBER",
            "defaultValue": battle_id
        })

    if "trainer_uid" not in existing_vars:
        add_var({
            "variableName": "trainer_uid",
            "displayName": "npc.variable.trainer_uid.name",
            "description": "npc.variable.trainer_uid.desc",
            "type": "NUMBER",
            "defaultValue": trainer_uid
        })

def update_trainer_entity(trainer_id: str, folder: str, battle_id: int, trainer_uid: int, excel_teams):
    auto_battle = not ("gym_leaders" in folder.lower() or "gym_leader_rematches" in folder.lower() or "fuchsiagym" in folder.lower())

    # Collapse to base file if Silver
    if is_silver(trainer_id):
        entity_file = silver_base_entity(folder, trainer_id)
        if not entity_file:
            return
    else:
        entity_file = NPC_DIR / folder / f"{trainer_id}.json"

    if not entity_file.exists():
        return

    with open(entity_file, "r", encoding="utf-8") as f:
        entity_data = json.load(f)

    if not is_silver(trainer_id):
        entity_data = apply_excel_team_override(
            entity_data,
            folder,
            trainer_id,
            excel_teams
        )

    if is_silver(trainer_id):
        base_id = get_silver_base_id(trainer_id)

        for i in range(1, 4):
            variant_id = f"{base_id}{i}"
            variant_file = NPC_DIR / folder / f"{variant_id}.json"

            if not variant_file.exists():
                continue

            with open(variant_file, "r", encoding="utf-8") as f:
                variant_data = json.load(f)

            updated_variant = apply_excel_team_override(
                variant_data,
                folder,
                variant_id,
                excel_teams
            )

            with open(variant_file, "w", encoding="utf-8") as f:
                json.dump(updated_variant, f, indent=4, ensure_ascii=False)

            print(f"Updated Silver variant: {variant_file}")

        if variant_file.exists():
            with open(variant_file, "r", encoding="utf-8") as f:
                variant_data = json.load(f)

            updated_variant = apply_excel_team_override(
                variant_data,
                folder,
                trainer_id,
                excel_teams
            )

            with open(variant_file, "w", encoding="utf-8") as f:
                json.dump(updated_variant, f, indent=4, ensure_ascii=False)

            print(f"Updated Silver variant: {variant_file}")

    # Early exit for gym leaders
    #if is_gym_leader:
    #    with open(entity_file, "w", encoding="utf-8") as f:
    #        json.dump(entity_data, f, indent=4, ensure_ascii=False)
    #    return

    # inject config
    inject_trainer_config(entity_data, trainer_id, battle_id, trainer_uid, auto_battle)

    # interaction handling
    entity_data["interaction"] = {
        "type": "custom_script",
        "script": "q.run_command('runmolangscript cobblemon:dialogue_check_battle ' + c.player.username + ' ' + c.npc.uuid)"
    }

    # write back
    with open(entity_file, "w", encoding="utf-8") as f:
        json.dump(entity_data, f, indent=4, ensure_ascii=False)

    #print(f"Updated entity: {entity_file}")

def export_trainer_team(trainer_id: str, folder: str, excel_teams):

    entity_file = NPC_DIR / folder / f"{trainer_id}.json"

    if not entity_file.exists():
        return

    with open(entity_file, "r", encoding="utf-8") as f:
        entity_data = json.load(f)

    trainer_name = entity_data.get("name", trainer_id)

    party = entity_data.get("party", {})
    pokemon_list = party.get("pokemon", [])

    team = []

    for entry in pokemon_list:
        parts = entry.split()
        species = parts[0].lower().replace("'", "").replace("’", "").replace(".", "").replace(" ", "")

        attrs = {}
        for part in parts[1:]:
            if "=" in part:
                key, value = part.split("=", 1)
                attrs[key.lower()] = value

        pokemon = {
            "species": species,
            "level": int(attrs.get("level", 1))
        }
        if "helditem" in attrs:
            item = attrs["helditem"].replace("cobblemon:", "")
            pokemon["heldItem"] = item
        if "moves" in attrs:
            pokemon["moveset"] = attrs["moves"].split(",")

        team.append(pokemon)

    export_data = {
        "name": trainer_name,
        "team": team
    }

    TBCS_TRAINERS_EXPORT_DIR.mkdir(exist_ok=True)

    output_file = TBCS_TRAINERS_EXPORT_DIR / f"{trainer_id}.json"
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(export_data, f, indent=2, ensure_ascii=False)

    #print(f"Exported trainer file: {output_file}")

#def build_tbcs_command(trainer_id: str):
#    trainer_id_cap = trainer_id.capitalize()
#    return [
#        "q.run_command('execute as ' + q.player.username + ' run function johto:trainers/gym_battle {trainer_id:\"%s\",trainer_id_cap:\"%s\"}')"
#        % (trainer_id, trainer_id_cap)
#    ]

def update_interaction_file(path: Path):
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)

    trainer_id = path.stem.replace("_interaction", "")
    folder = path.parent.name
    

    if "johto:trainers/start_battle" in json.dumps(data):
        #print(f"Skipping (already converted): {path}")
        return

    battle_id = get_battle_music(folder, trainer_id)

    is_gym_leader = "gym_leaders" in folder.lower() or "gym_leader_rematches" in folder.lower()

    #if is_gym_leader:
    #    for page in data.get("pages", []):
    #        input_data = page.get("input")
    #        if not isinstance(input_data, dict):
    #            continue

    #        options = input_data.get("options")
    #        if not isinstance(options, list):
    #            continue

    #        for opt in options:
    #            action = opt.get("action")

    #            if isinstance(action, list):
    #                new_actions = []

    #                for line in action:
    #                    if "q.npc.start_battle(q.player)" in line:
    #                        new_actions.extend(build_tbcs_command(trainer_id))
    #                    else:
    #                        new_actions.append(line)

    #                opt["action"] = new_actions

    #    with open(path, "w", encoding="utf-8") as f:
    #        json.dump(data, f, indent=4, ensure_ascii=False)

    #    return trainer_id, folder, battle_id
    
    #if is_silver(trainer_id):
    #    if "initializationAction" not in data:
    #        data["initializationAction"] = []

    #    init_line = "q.run_command('tag ' + q.player.username + ' add InDialogue');"

    #    if init_line not in data["initializationAction"]:
    #        data["initializationAction"].append(init_line)

    data["escapeAction"] = build_battle_action(trainer_id, battle_id)

    # Replace speakers.npc
    npc_name = data.get("names", [trainer_id])[0]
    data["speakers"]["npc"] = {
        "name": npc_name,
        "face": {
            "type": "artificial",
            "modelType": "npc",
            "identifier": get_model_identifier(folder, trainer_id),
            "isLeftSide": False,
        },
    }

    # Update battle pages
    for page in data.get("pages", []):
        input_data = page.get("input")
        if not isinstance(input_data, dict):
            continue

        options = input_data.get("options")
        if not isinstance(options, list):
            continue

        battle_options = [opt for opt in options if opt.get("value") == "battle"]
        if not battle_options:
            continue

        # Keep only battle option
        input_data["options"] = battle_options
        input_data["options"][0]["action"] = build_battle_action(trainer_id, battle_id)

        # Add timeout
        input_data["timeout"] = {
            "duration": 2,
            "showTimer": True,
            "action": build_battle_action(trainer_id, battle_id),
        }


    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4, ensure_ascii=False)

    #print(f"Updated entity interaction: {path}")
    return trainer_id, folder, battle_id

def validate_trainer_files(excel_df, fs_lookup):
    missing = []
    def normalize_id(val: str) -> str:
        return (
            str(val)
            .strip()
            .lower()
            .replace(" ", "")
            .replace("-", "")
        )
    for _, row in excel_df.iterrows():
        if pd.isna(row["Folder"]) or pd.isna(row["Trainer"]):
            continue

        folder = normalize_id(row["Folder"])
        trainer = normalize_id(row["Trainer"])

        key = (folder, trainer)

        if key not in fs_lookup:
            missing.append(key)

    if missing:
        print("\n[TRAINER FILE VALIDATION ERRORS]")
        for folder, trainer in missing:
            print(f"Missing JSON: {folder}/{trainer}.json")

        raise ValueError("Trainer file validation failed.")

    print("\nTrainer file validation passed")

def scan_trainer_files():
    """
    Returns:
        dict: {(folder, trainer_id)} -> Path
    """
    lookup = {}

    for path in NPC_DIR.rglob("*.json"):
        folder = path.parent.name.lower().strip()
        trainer_id = path.stem.lower().strip()

        lookup[(folder, trainer_id)] = path

    return lookup

def validate_all_json_have_excel_entry(excel_df, fs_lookup):
    def normalize_id(val: str) -> str:
        return (
            str(val)
            .strip()
            .lower()
            .replace(" ", "")
            .replace("-", "")
        )

    excel_keys = set()

    for _, row in excel_df.iterrows():
        if pd.isna(row["Folder"]) or pd.isna(row["Trainer"]):
            continue

        folder = normalize_id(row["Folder"])
        trainer = normalize_id(row["Trainer"])

        excel_keys.add((folder, trainer))

    missing = []

    for folder, trainer in fs_lookup.keys():
        if not should_check(folder, trainer):
            continue

        if (folder, trainer) not in excel_keys:
            missing.append((folder, trainer))

    if missing:
        print("\n[JSON WITHOUT EXCEL ENTRY]")
        for folder, trainer in missing:
            print(f"{folder}/{trainer}.json not in Excel")

        raise ValueError("Reverse validation failed.")

    print("\nAll trainer JSONs have Excel entries")
    
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

    excel_teams = {}
    if ENABLE_CHALLENGE_MODE:
        valid_items, valid_moves = load_validation_lists()
        if not valid_items:
            raise ValueError("No items loaded from Lists sheet!")

        if not valid_moves:
            raise ValueError("No moves loaded from Lists sheet!")
        
        excel_df = pd.read_excel(TEAMS_XLSX_PATH)

        # Validate trainer files exist
        fs_lookup = scan_trainer_files()

        # Validate Excel -> JSON
        validate_trainer_files(excel_df, fs_lookup)

        # Validate JSON -> Excel
        validate_all_json_have_excel_entry(excel_df, fs_lookup)
        
        excel_teams = load_excel_teams(valid_items, valid_moves)
        print(f"Loaded {len(excel_teams)} Excel trainer entries")
        
        """
        # Show a few samples
        for i, (k, v) in enumerate(excel_teams.items()):
            print(f"Sample {i}: {k} -> {len(v)} mons")
            if i >= 70:
                break
        """
    else:
        print("Challenge mode disabled, skipping Excel loading")

    uid_counter = 1
    processed = []

    for file_path in files:
        try:
            result = update_interaction_file(file_path)
            if result:
                trainer_id, folder, battle_id = result
                processed.append((trainer_id, folder, battle_id, uid_counter))
                uid_counter += 1

        except Exception as e:
            print(f"FAILED: {file_path}")
            print(e)

    seen_silver = set()

    for trainer_id, folder, battle_id, trainer_uid in processed:

        is_gym_leader = "gym_leaders" in folder.lower() or "gym_leader_rematches" in folder.lower()
        #if is_gym_leader: print(f"Skipping export (gym leader): {trainer_id} in {folder}")

        if is_silver(trainer_id):
            base_id = get_silver_base_id(trainer_id)

            if base_id in seen_silver:
                continue

            seen_silver.add(base_id)

            #generate_battle_end_copy(base_id, folder)
            update_trainer_entity(trainer_id, folder, battle_id, trainer_uid, excel_teams)

            export_all_silver_variants(folder, base_id)

        else:
            if not is_gym_leader:
                generate_battle_end_copy(trainer_id, folder)

            update_trainer_entity(trainer_id, folder, battle_id, trainer_uid, excel_teams)

            export_trainer_team(trainer_id, folder, excel_teams)

    print("\nDone.")


if __name__ == "__main__":
    main()