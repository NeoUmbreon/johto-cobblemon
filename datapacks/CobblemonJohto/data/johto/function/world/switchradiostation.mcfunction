# Store slot of radio in temp score for comparison
execute store result score @s RadioSelectTemp run data get entity @s Inventory.[{components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}].Slot
scoreboard players set @s[scores={RadioSelectTemp=-106}] RadioSelectTemp 1
scoreboard players add @s RadioSelectTemp 1

# Compare, exit if slot hasn't changed
execute if score @s RadioSelectTemp = @s RadioSelect run return fail

# Store
scoreboard players operation @s RadioSelect = @s RadioSelectTemp

# Refresh sound and run radio function (unless in battle)
execute if entity @s[x=1169,y=252,z=619,distance=..40] run scoreboard players set @s MusicTitles 15
function johto:tools/forceclick
execute if score @s RadioSelect matches 3..8 if score @s BattleStart matches 0 run function johto:world/radiostations