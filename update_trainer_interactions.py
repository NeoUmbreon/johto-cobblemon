import json
from pathlib import Path
import re

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

            print(f"Created base silver NPC: {base_file}")
            return base_file

    print(f"No variant found to create base NPC: {base_id}")
    return None

def export_all_silver_variants(folder: str, base_id: str):
    for i in range(1, 4):
        variant_id = f"{base_id}{i}"
        entity_file = NPC_DIR / folder / f"{variant_id}.json"

        if not entity_file.exists():
            print(f"Missing variant: {entity_file}")
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

        print(f"Exported silver trainer: {output_file}")
        
def get_battle_music(folder: str, trainer_id: str) -> int:
    if trainer_id.startswith("rocket"):
        return 14  # Rocket music
    if folder == "silver":
        return 13  # Rival music
    if folder in KANTO_FOLDERS:
        return 17  # Kanto trainer music
    return 11  # Default Johto trainer

def get_model_identifier(folder: str, trainer_id: str, npc_name: str) -> str:
    if folder == "silver":
        return "cobblemon:silver"

    base = trainer_id.lower()
    name_part = npc_name.lower()

    # Remove trainer name if it exists at end
    if base.endswith(name_part):
        base = base[:-len(name_part)]

    # Remove trailing numbers
    base = re.sub(r"\d+$", "", base)

    return f"cobblemon:{base}"

def build_battle_action(trainer_id: str, battle_id: int):
    return [
        (
            "q.run_command("
            f"'execute as ' + q.player.username + "
            f"' run function johto:trainers/start_battle "
            f"{{trainer_id:\"{trainer_id}\",battle_id:{battle_id},player:\"' "
            f"+ q.player.username + '\"}}'"
            ");"
        ),
        "q.dialogue.close();",
    ]

def generate_battle_end_copy(trainer_id: str, folder: str):
    end_file = BATTLE_END_DIR / folder / f"{trainer_id}_end.json"
    if not end_file.exists():
        print(f"Battle end file not found: {end_file}")
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

    print(f"Generated battle end copy: {new_file}")
    return new_file
# Inject Trainer Variables into config
def inject_trainer_config(entity_data, trainer_id, battle_id, trainer_uid):
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
            "defaultValue": True
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

def update_trainer_entity(trainer_id: str, folder: str, battle_id: int, trainer_uid: int):
    # Collapse to base file if Silver
    if is_silver(trainer_id):
        entity_file = silver_base_entity(folder, trainer_id)
        if not entity_file:
            return
    else:
        entity_file = NPC_DIR / folder / f"{trainer_id}.json"

    if not entity_file.exists():
        print(f"Entity file not found: {entity_file}")
        return

    with open(entity_file, "r", encoding="utf-8") as f:
        entity_data = json.load(f)

    inject_trainer_config(entity_data, trainer_id, battle_id, trainer_uid)

    if is_silver(trainer_id):
        entity_data.pop("interaction", None)
    else:
        entity_data["interaction"] = {
            "type": "dialogue",
            "dialogue": f"cobblemon:{trainer_id}_end_defeated"
        }

    with open(entity_file, "w", encoding="utf-8") as f:
        json.dump(entity_data, f, indent=4, ensure_ascii=False)

    print(f"Updated entity: {entity_file}")

def export_trainer_team(trainer_id: str, folder: str):
    entity_file = NPC_DIR / folder / f"{trainer_id}.json"

    if not entity_file.exists():
        print(f"Cannot export team, entity missing: {entity_file}")
        return

    with open(entity_file, "r", encoding="utf-8") as f:
        entity_data = json.load(f)

    trainer_name = entity_data.get("name", trainer_id)

    party = entity_data.get("party", {})
    pokemon_list = party.get("pokemon", [])

    team = []

    for entry in pokemon_list:
        # Expect format: "Charmeleon level=29"
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

    output_file = TBCS_TRAINERS_EXPORT_DIR / f"{trainer_id}.json"
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(export_data, f, indent=2, ensure_ascii=False)

    print(f"Exported trainer file: {output_file}")

def update_interaction_file(path: Path):
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)

    trainer_id = path.stem.replace("_interaction", "")
    folder = path.parent.name

    if "johto:trainers/start_battle" in json.dumps(data):
        #print(f"Skipping (already converted): {path}")
        return

    battle_id = get_battle_music(folder, trainer_id)

    # Replace escapeAction
    data["escapeAction"] = build_battle_action(trainer_id, battle_id)

    # Replace speakers.npc
    npc_name = data.get("names", [trainer_id])[0]
    data["speakers"]["npc"] = {
        "name": npc_name,
        "face": {
            "type": "artificial",
            "modelType": "npc",
            "identifier": get_model_identifier(folder, trainer_id, npc_name),
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

    print(f"Updated entity interaction: {path}")
    return trainer_id, folder, battle_id


def main():
    files = sorted(INTERACTIONS_DIR.rglob("*_interaction.json"))
    print(f"Found {len(files)} interaction files\n")

    uid_counter = 1
    processed = []

    for file_path in files:
        # Recursive skip for gym_leaders
        if "gym_leaders" in file_path.parts:
            #print(f"Skipping gym_leaders: {file_path}")
            continue

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

        if is_silver(trainer_id):
            base_id = get_silver_base_id(trainer_id)

            if base_id in seen_silver:
                continue

            seen_silver.add(base_id)

            generate_battle_end_copy(base_id, folder)
            update_trainer_entity(trainer_id, folder, battle_id, trainer_uid)

            export_all_silver_variants(folder, base_id)

        else:
            generate_battle_end_copy(trainer_id, folder)
            update_trainer_entity(trainer_id, folder, battle_id, trainer_uid)
            export_trainer_team(trainer_id, folder)

    print("\nDone.")


if __name__ == "__main__":
    main()