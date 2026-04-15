tag @s remove InDialogue

# set TrainerUID & ActiveTrainer
execute as @n[type=cobblemon:npc,distance=0] store result score @s TrainerUID run data get entity @s Config.trainer_uid
scoreboard players operation @s ActiveTrainer = @n[type=cobblemon:npc,distance=0] TrainerUID

# Refresh music
$scoreboard players set @s BattleStart $(battle_id)
function johto:tools/forceclick

# Generic Battle
$execute unless score @s BattleStart matches 13 run return run tbcs battle GEN_9_SINGLES @s vs @n[type=cobblemon:npc,distance=0] as tbcs:$(trainer_id) onwin {1:["tag @1 add defeated.$(trainer_id)","scoreboard players set @2 ActiveTrainer 0"],2:["scoreboard players set @1 ActiveTrainer 0"]}

# Silver
$execute if score @s StarterPick matches 1 run return run tbcs battle GEN_9_SINGLES @s vs @n[type=cobblemon:npc,distance=0] as tbcs:$(trainer_id)1 onwin {1:["tag @1 add defeated.$(trainer_id)","scoreboard players set @2 ActiveTrainer 0"],2:["scoreboard players set @1 ActiveTrainer 0"]}
$execute if score @s StarterPick matches 2 run return run tbcs battle GEN_9_SINGLES @s vs @n[type=cobblemon:npc,distance=0] as tbcs:$(trainer_id)2 onwin {1:["tag @1 add defeated.$(trainer_id)","scoreboard players set @2 ActiveTrainer 0"],2:["scoreboard players set @1 ActiveTrainer 0"]}
$execute if score @s StarterPick matches 3 run return run tbcs battle GEN_9_SINGLES @s vs @n[type=cobblemon:npc,distance=0] as tbcs:$(trainer_id)3 onwin {1:["tag @1 add defeated.$(trainer_id)","scoreboard players set @2 ActiveTrainer 0"],2:["scoreboard players set @1 ActiveTrainer 0"]}
