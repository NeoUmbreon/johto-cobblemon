# Return states
$execute if entity @s[tag=defeated.$(trainer_id)] run return 1
execute if entity @s[tag=inTrainerBattle] run return 1
$execute if entity @e[type=cobblemon:npc,tag=trainer.$(trainer_id),tag=trainerBusy] run return 1

# Lock States
tag @s add inTrainerBattle
tag @s remove dialogueLock
$tag @e[type=cobblemon:npc,tag=trainer.$(trainer_id),limit=1] add trainerBusy

# Start Battle
$scoreboard players set @s BattleStart $(battle_id)
execute as @s run function johto:tools/forceclick

$execute as @e[type=cobblemon:npc,tag=trainer.$(trainer_id),tag=!tbcs_attached] at @s run tbcs attach $(tbcs_id) @s

$tbcs battle GEN_9_SINGLES @s vs $(tbcs_id) onwin {1:["tag @1 remove inTrainerBattle","tag @1 add defeated.$(trainer_id)","tag @e[type=cobblemon:npc,tag=trainer.$(trainer_id),limit=1] remove trainerBusy"],2:["tag @3 remove inTrainerBattle","tag @3 remove dialogueLock","tag @e[type=cobblemon:npc,tag=trainer.$(trainer_id),limit=1] remove trainerBusy"]}
