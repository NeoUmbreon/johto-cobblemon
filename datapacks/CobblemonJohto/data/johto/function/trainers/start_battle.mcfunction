# set ActiveTrainer
execute store result score @s ActiveTrainer run data get entity @n[type=cobblemon:npc,tag=trainerBusy,distance=0] Config.trainer_uid 1

# Refresh music
$scoreboard players set @s BattleStart $(battle_id)
function johto:tools/forceclick

# Generic Battle
$execute unless score @s BattleStart matches 13 run tbcs attach tbcs:$(trainer_id) @n[type=cobblemon:npc,tag=trainerBusy,distance=0]
$execute unless score @s BattleStart matches 13 run return run tbcs battle GEN_9_SINGLES @s vs tbcs:$(trainer_id) onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy","scoreboard players set @2 ActiveTrainer 0"],2:["tag @1 remove trainerBusy","scoreboard players set @1 ActiveTrainer 0"]}

# Silver
$execute if score @s StarterPick matches 1 run tbcs attach tbcs:$(trainer_id)1 @n[type=cobblemon:npc,tag=trainerBusy,distance=0]
$execute if score @s StarterPick matches 1 run return run tbcs battle GEN_9_SINGLES @s vs tbcs:$(trainer_id)1 onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy","scoreboard players set @2 ActiveTrainer 0"],2:["tag @1 remove trainerBusy","scoreboard players set @1 ActiveTrainer 0"]}
$execute if score @s StarterPick matches 2 run tbcs attach tbcs:$(trainer_id)2 @n[type=cobblemon:npc,tag=trainerBusy,distance=0]
$execute if score @s StarterPick matches 2 run return run tbcs battle GEN_9_SINGLES @s vs tbcs:$(trainer_id)2 onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy","scoreboard players set @2 ActiveTrainer 0"],2:["tag @1 remove trainerBusy","scoreboard players set @1 ActiveTrainer 0"]}
$execute if score @s StarterPick matches 3 run tbcs attach tbcs:$(trainer_id)3 @n[type=cobblemon:npc,tag=trainerBusy,distance=0]
$execute if score @s StarterPick matches 3 run return run tbcs battle GEN_9_SINGLES @s vs tbcs:$(trainer_id)3 onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy","scoreboard players set @2 ActiveTrainer 0"],2:["tag @1 remove trainerBusy","scoreboard players set @1 ActiveTrainer 0"]}
