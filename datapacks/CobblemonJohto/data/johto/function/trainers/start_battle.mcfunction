# return if something went really wrong
$execute as @n[type=cobblemon:npc,tag=trainerBusy,distance=0] unless entity @s[nbt={Config:{trainer_id:$(trainer_id)}}] run return run say Fatal error! (trainer mismatch)

# set TrainerUID & ActiveTrainer
$scoreboard players set @n[type=cobblemon:npc,tag=trainerBusy,distance=0] TrainerUID $(trainer_uid)
$scoreboard players set @s ActiveTrainer $(trainer_uid)

# Refresh music
$scoreboard players set @s BattleStart $(battle_id)
function johto:tools/forceclick

# Generic Battle
$execute unless score @s BattleStart matches 13 run return run tbcs battle GEN_9_SINGLES @s vs @n[type=cobblemon:npc,tag=trainerBusy,distance=0] as tbcs:$(trainer_id) onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy","scoreboard players set @2 ActiveTrainer 0"],2:["tag @1 remove trainerBusy","scoreboard players set @1 ActiveTrainer 0"]}

# Silver
$execute if score @s StarterPick matches 1 run return run tbcs battle GEN_9_SINGLES @s vs @n[type=cobblemon:npc,tag=trainerBusy,distance=0] as tbcs:$(trainer_id)1 onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy","scoreboard players set @2 ActiveTrainer 0"],2:["tag @1 remove trainerBusy","scoreboard players set @1 ActiveTrainer 0"]}
$execute if score @s StarterPick matches 2 run return run tbcs battle GEN_9_SINGLES @s vs @n[type=cobblemon:npc,tag=trainerBusy,distance=0] as tbcs:$(trainer_id)2 onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy","scoreboard players set @2 ActiveTrainer 0"],2:["tag @1 remove trainerBusy","scoreboard players set @1 ActiveTrainer 0"]}
$execute if score @s StarterPick matches 3 run return run tbcs battle GEN_9_SINGLES @s vs @n[type=cobblemon:npc,tag=trainerBusy,distance=0] as tbcs:$(trainer_id)3 onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy","scoreboard players set @2 ActiveTrainer 0"],2:["tag @1 remove trainerBusy","scoreboard players set @1 ActiveTrainer 0"]}
