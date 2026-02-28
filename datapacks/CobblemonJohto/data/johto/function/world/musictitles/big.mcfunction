# If location hasn't changed, exit
$execute if score @s MusicTitles matches $(location) run return 0


# Determines the player's radio station currently playing
# This is slow and probably redundant; convert to predicates and move to worldcommands?
scoreboard players set @s[nbt={Inventory:[{Slot:0b,components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}]}] RadioSelect 1
scoreboard players set @s[nbt={Inventory:[{Slot:1b,components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}]}] RadioSelect 2
scoreboard players set @s[nbt={Inventory:[{Slot:2b,components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}]}] RadioSelect 3
scoreboard players set @s[nbt={Inventory:[{Slot:3b,components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}]}] RadioSelect 4
scoreboard players set @s[nbt={Inventory:[{Slot:4b,components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}]}] RadioSelect 5
scoreboard players set @s[nbt={Inventory:[{Slot:5b,components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}]}] RadioSelect 6
scoreboard players set @s[nbt={Inventory:[{Slot:6b,components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}]}] RadioSelect 7
scoreboard players set @s[nbt={Inventory:[{Slot:7b,components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}]}] RadioSelect 8
scoreboard players set @s[nbt={Inventory:[{Slot:8b,components:{"minecraft:custom_name":'{"extra":[{"color":"aqua","italic":false,"text":"Radio"}],"text":""}'}}]}] RadioSelect 9


# Restart music unless radio off or music would be the same
$execute unless score @s RadioSelect matches 3..9 $(includes)run function johto:tools/forceclick


# Restart music if cycling
execute as @s[tag=CyclingMusic] run function johto:tools/forceclick
execute as @s[tag=CyclingMusic] run tag @s remove CyclingMusic


# Show title unless exiting interior
$execute unless score @s MusicTitles matches 201..300 run title @s title {"text":"$(text)","color":"$(color)"}
$execute unless score @s MusicTitles matches 201..300 run title @s subtitle {"text":"$(subtext)","italic":true}


# Update score
$scoreboard players set @s MusicTitles $(location)


return 1