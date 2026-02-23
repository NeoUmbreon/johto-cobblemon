#!/usr/bin/env bash

set -e

# ROOT PATHS

TRAINER_ROOT="datapacks/CobblemonJohto/data/cobblemon/npcs/trainers"
DIALOGUE_ROOT="datapacks/CobblemonJohto/data/cobblemon/dialogues/interactions"

TRAINER_OUT="trainers"
BOOTSTRAP="datapacks/CobblemonJohto/data/johto/function/trainers/bootstrap.mcfunction"
DETECT="datapacks/CobblemonJohto/data/johto/function/trainers/detect_trainers.mcfunction"
BATTLE_DIR="datapacks/CobblemonJohto/data/johto/function/trainers/battles"

# Ensure correct working directory

if [ ! -d "datapacks" ]; then
    echo "Error: You must run this script from the directory that contains 'datapacks/'"
    echo "Current directory: $(pwd)"
    exit 1
fi

mkdir -p "$TRAINER_OUT"
mkdir -p "$BATTLE_DIR"

# Clean old generated files

echo "Cleaning old generated files..."

rm -f "$BATTLE_DIR"/*.mcfunction
rm -f trainers/*.json

echo "# Auto-generated bootstrap file" > "$BOOTSTRAP"
echo "# Auto-generated detect file" > "$DETECT"

# Per-folder spot distance

get_spot_distance() {
    folder="$1"

    case "$folder" in
        viridianforest) echo 10 ;;
        nationalpark) echo 8 ;;
        route*) echo 8 ;;
        olivinecity*) echo 6 ;;
        *) echo 6 ;;
    esac
}

get_battle_music() {
    folder="$1"
    trainer_id="$2"

    if [[ "$trainer_id" == rocket* ]]; then
        echo 14
        return
    fi

    case "$folder" in
        route1|route2|route3|route4|route5|route6|route7|route8|route9|route10|route11|route12|route13|route14|route15|route17|route18|route19|route20|route21|route24|route25| \
        pewtergym|ceruleangym|vermiliongym|celadongym|fuchsiagym|saffrongym|cinnabargym| \
        seafoamislands|pokemonmansion|viridianforest)
            echo 17
            return
        ;;
    esac

    echo 11
}

#TODO:
get_prebattle_music() {
    trainer_id="$1"

    case "$trainer_id" in
        silver*) echo 1 ;;  # Rival
        sage*) echo 3 ;;
        kimono*) echo 10 ;;
        rocket*) echo 7 ;;
        burglar*|biker*|firebreather*) echo 5 ;;
        medium*|psychic*|policeman*) echo 6 ;;
        beauty*|lass*|birdkeeper*) echo 4 ;;
        schoolkid*|supernerd*|pokemaniac*|hiker*|camper*) echo 8 ;;
        picknicker*|twin*|pokefan*|teacher*) echo 9 ;;
        acetrainer*|blackbelt*|fisherman*|sailor*|swimmer*) echo 2 ;;
        *) echo 2 ;; # Default Boy 1
    esac
}

# Process all folders

for folder_path in "$TRAINER_ROOT"/*; do
    [ -d "$folder_path" ] || continue

    folder=$(basename "$folder_path")

    if [[ "$folder" == "gym_leaders" || "$folder" == "silver" ]]; then
        echo "==== Skipping Folder: $folder ===="
        continue
    fi

    echo "==== Processing Folder: $folder ===="

    NPC_FOLDER="$folder_path"
    DIALOGUE_FOLDER="$DIALOGUE_ROOT/$folder"
    SPOT_DISTANCE=$(get_spot_distance "$folder")

    for file in "$NPC_FOLDER"/*.json; do
        [ -f "$file" ] || continue

        trainer_id=$(basename "$file" .json)
        BATTLE_MUSIC=$(get_battle_music "$folder" "$trainer_id")
        tbcs_id="tbcs:${trainer_id}"

        echo "Processing trainer: $trainer_id"

        name=$(jq -r '.name' "$file")

        dialogue_file="${DIALOGUE_FOLDER}/${trainer_id}_interaction.json"
        dialogue_text="..."

        if [ -f "$dialogue_file" ]; then
            dialogue_text=$(jq -r '[.pages[].lines[]] | join(" ")' "$dialogue_file")
        fi

        dialogue_text=$(echo "$dialogue_text" | sed 's/"/\\"/g')

        # Build TBCS team JSON

        team_json=""

        while read -r poke; do
            species=$(echo "$poke" | awk '{print $1}')
            level=$(echo "$poke" | sed -E 's/.*level=([0-9]+)/\1/')

            team_json="${team_json}
        {
          \"species\": \"${species,,}\",
          \"level\": ${level}
        },"
        done < <(jq -r '.party.pokemon[]' "$file")

        team_json=$(echo "$team_json" | sed '$ s/,$//')

        cat > "$TRAINER_OUT/${trainer_id}.json" <<EOF
{
  "name": "${name}",
  "team": [
${team_json}
  ]
}
EOF

        # Bootstrap tagging

        cat >> "$BOOTSTRAP" <<EOF

# ${trainer_id}
execute as @e[type=cobblemon:npc,nbt={NPCClass:"cobblemon:${trainer_id}"},tag=!trainer.${trainer_id}] run tag @s add trainer.${trainer_id}
EOF

        # Detect (runs every tick)

        echo "execute as @e[type=cobblemon:npc,tag=trainer.${trainer_id}] at @s run function johto:trainers/battles/${trainer_id}" >> "$DETECT"

        # Trainer-level function

        cat > "$BATTLE_DIR/${trainer_id}.mcfunction" <<EOF
# Trainer tick logic
execute as @a[distance=..${SPOT_DISTANCE}] at @s run function johto:trainers/battles/${trainer_id}_player
EOF

        # Player-level function

        cat > "$BATTLE_DIR/${trainer_id}_player.mcfunction" <<EOF
execute if entity @s[tag=defeated.${trainer_id}] run return 1
execute if entity @e[type=cobblemon:npc,tag=trainer.${trainer_id},tag=trainerBusy,distance=..${SPOT_DISTANCE}] run return 1
execute if entity @s[tag=inTrainerBattle] run return 1

execute anchored eyes facing entity @e[type=cobblemon:npc,tag=trainer.${trainer_id},limit=1] eyes positioned ^ ^ ^1 if entity @e[type=cobblemon:npc,tag=trainer.${trainer_id},distance=..${SPOT_DISTANCE}] run tag @s add inTrainerBattle
execute unless entity @s[tag=inTrainerBattle] run return 1

tag @e[type=cobblemon:npc,tag=trainer.${trainer_id},distance=..${SPOT_DISTANCE},limit=1] add trainerBusy

tellraw @s {"text":"${name}: ${dialogue_text}","color":"yellow"}
scoreboard players set @s BattleStart ${BATTLE_MUSIC}

execute as @e[type=cobblemon:npc,tag=trainer.${trainer_id},tag=!tbcs_attached] at @s run tbcs attach ${tbcs_id} @s

tbcs battle GEN_9_SINGLES @s vs ${tbcs_id} onwin {1:["tag @1 remove inTrainerBattle","tag @1 add defeated.${trainer_id}","tag @e[type=cobblemon:npc,tag=trainer.${trainer_id},limit=1] remove trainerBusy"],2:["tag @3 remove inTrainerBattle","tag @e[type=cobblemon:npc,tag=trainer.${trainer_id},limit=1] remove trainerBusy"]}
EOF

    done
done

echo " All trainers processed successfully."
