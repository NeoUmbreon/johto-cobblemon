$fill $(pos1) $(pos2) air replace barrier
$execute positioned $(pos1) at @e[type=minecraft:armor_stand,tag=CutTree,distance=..$(distance)] run particle minecraft:explosion ~ ~ ~ 1 1 1 1 10 normal
$execute positioned $(midpoint) run function johto:sound/playglobalsfx {sfx:"cut",category:"block"}
$execute positioned $(pos1) as @e[type=minecraft:armor_stand,tag=CutTree,distance=..$(distance)] run data merge entity @s {ArmorItems:[{},{},{},{id:"air",Count:1}]}
$execute positioned $(pos1) run kill @e[type=interaction,tag=CutTree,distance=..$(distance)]