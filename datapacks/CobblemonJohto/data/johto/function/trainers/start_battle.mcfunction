# Start Battle
$scoreboard players set @s BattleStart $(battle_id)
execute as @s run function johto:tools/forceclick

$execute at @s run tbcs attach tbcs:$(trainer_id) @n[type=cobblemon:npc,tag=trainerBusy,distance=..6,nbt={Config:{trainer_id:"$(trainer_id)"}}] 

$tbcs battle GEN_9_SINGLES @s vs tbcs:$(trainer_id) onwin {1:["tag @1 add defeated.$(trainer_id)","tag @2 remove trainerBusy"],2:["tag @1 remove trainerBusy"]}
