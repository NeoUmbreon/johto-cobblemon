# Return states (moved to detect_trainers)
#$execute as $(player) if entity @s[tag=defeated.$(trainer_id)] run scoreboard players set @s BattleStart 0
#$execute as $(player) if entity @s[scores={BattleStart=0}] run return 1

# Lock States (moved to detect_trainers)
#tag @s add trainerBusy

# Start Battle
$scoreboard players set $(player) BattleStart $(battle_id)
$execute as $(player) run function johto:tools/forceclick

$tbcs attach tbcs:$(trainer_id) @s

$tbcs battle GEN_9_SINGLES $(player) vs tbcs:$(trainer_id) onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy"],2:["tag @1 remove trainerBusy"]}
