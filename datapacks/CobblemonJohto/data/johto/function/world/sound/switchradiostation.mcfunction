# Store slot of radio in temp score for comparison
execute store result score @s RadioSelectTemp run data get entity @s Inventory.[{components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}].Slot
scoreboard players set @s[scores={RadioSelectTemp=-106}] RadioSelectTemp 1
scoreboard players add @s RadioSelectTemp 1

# Compare, exit if slot hasn't changed
execute if score @s RadioSelectTemp = @s RadioSelect run return fail

# Refresh sound and play radio music if slot has changed
tag @s add RadioStationMusic
scoreboard players operation @s RadioSelect = @s RadioSelectTemp
function johto:tools/forceclick