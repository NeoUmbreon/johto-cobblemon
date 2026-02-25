import json
from pathlib import Path
import re

PROJECT_ROOT = Path(__file__).resolve().parent

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

DETECT_FUNCTION = (
    PROJECT_ROOT
    / "datapacks"
    / "CobblemonJohto"
    / "data"
    / "johto"
    / "function"
    / "trainers"
    / "detect_trainers.mcfunction"
)

BOOTSTRAP_FUNCTION = (
    PROJECT_ROOT
    / "datapacks"
    / "CobblemonJohto"
    / "data"
    / "johto"
    / "function"
    / "trainers"
    / "bootstrap.mcfunction"
)

KANTO_FOLDERS = {
    "route1","route2","route3","route4","route5","route6","route7","route8","route9",
    "route10","route11","route12","route13","route14","route15","route17","route18",
    "route19","route20","route21","route24","route25",
    "pewtergym","ceruleangym","vermiliongym","celadongym",
    "fuchsiagym","saffrongym","cinnabargym",
    "seafoamislands","pokemonmansion","viridianforest"
}

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
    battle_cmd = (
        f"q.run_command('execute as ' + q.player.username + "
        f"' run function johto:trainers/start_battle "
        f"{{battle_id:{battle_id},tbcs_id:\"tbcs:{trainer_id}\",trainer_id:\"{trainer_id}\"}}');"
    )
    return [
        battle_cmd,
        "q.dialogue.close();",
    ]

# Battle End copy for right click interaction (_end_defeated.json)
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
        if not (cmd.startswith("q.run_command('scoreboard") or cmd.startswith("q.run_command('tellraw"))
    ]
    data["initializationAction"] = cleaned_actions

    new_file = BATTLE_END_DIR / folder / f"{trainer_id}_end_defeated.json"
    with open(new_file, "w", encoding="utf-8") as f:
        json.dump(data, f, indent=4)

    print(f"Generated battle end copy: {new_file}")
    return new_file

# Update trainers to use right click interaction
def update_trainer_entity(trainer_id: str, folder: str):
    entity_file = NPC_DIR / folder / f"{trainer_id}.json"
    if not entity_file.exists():
        print(f"Entity file not found: {entity_file}")
        return

    with open(entity_file, "r", encoding="utf-8") as f:
        entity_data = json.load(f)

    entity_data["interaction"] = {
        "type": "dialogue",
        "dialogue": f"cobblemon:{trainer_id}_end_defeated"
    }

    with open(entity_file, "w", encoding="utf-8") as f:
        json.dump(entity_data, f, indent=4)

    print(f"Updated entity interaction: {entity_file}")

# Update interaction file
def update_file(path: Path):
    with open(path, "r", encoding="utf-8") as f:
        data = json.load(f)

    trainer_id = path.stem.replace("_interaction", "")
    folder = path.parent.name

    if "johto:trainers/start_battle" in json.dumps(data):
        print(f"Skipping (already converted): {path}")
        return

    battle_id = get_battle_music(folder, trainer_id)

    # Add dialogueLock
    init_actions = data.get("initializationAction", [])
    if isinstance(init_actions, list) and not any("dialogueLock" in a for a in init_actions):
        init_actions.append(
            "q.run_command('tag ' + q.player.username + ' add dialogueLock');"
        )
        data["initializationAction"] = init_actions

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
        json.dump(data, f, indent=4)

    print(f"Updated: {path}")
    
def main():
    files = sorted(INTERACTIONS_DIR.rglob("*_interaction.json"))

    print(f"Found {len(files)} interaction files\n")

    processed_trainers = []

    for file_path in files:
        folder = file_path.parent.name
        if folder == "gym_leaders":
            print(f"==== Skipping Folder: {folder} ====")
            continue

        # TODO
        if folder == "silver":
            print(f"==== Skipping Folder: {folder} ====")
            continue

        try:
            update_file(file_path)
            trainer_id = file_path.stem.replace("_interaction", "")
            processed_trainers.append((trainer_id, folder))
        except Exception as e:
            print(f"FAILED: {file_path}")
            print(e)

    # Generate detect_trainers.mcfunction
    detect_lines = []
    for trainer_id, _ in sorted(processed_trainers):
        detect_lines.append(
            f'execute as @a[tag=!dialogueLock,tag=!inTrainerBattle,tag=!defeated.{trainer_id}] '
            f'at @s if entity @e[type=cobblemon:npc,tag=trainer.{trainer_id},distance=..6] '
            f'run opendialogue {trainer_id}_interaction @s'
        )
    DETECT_FUNCTION.write_text("\n".join(detect_lines) + "\n")

    # Generate bootstrap.mcfunction
    bootstrap_lines = []
    for trainer_id, _ in sorted(processed_trainers):
        bootstrap_lines.append(
            f'execute as @e[type=cobblemon:npc,nbt={{NPCClass:"cobblemon:{trainer_id}"}},'
            f'tag=!trainer.{trainer_id}] run tag @s add trainer.{trainer_id}'
        )
    BOOTSTRAP_FUNCTION.write_text("\n".join(bootstrap_lines) + "\n")

    # Generate battle end copies and update entities
    for trainer_id, folder in processed_trainers:
        generate_battle_end_copy(trainer_id, folder)
        update_trainer_entity(trainer_id, folder)

    print("\nGenerated detect_trainers.mcfunction")
    print("Generated bootstrap.mcfunction")
    print("\nDone.")


if __name__ == "__main__":
    main()