tag @s remove TempDelay

#Three or more clicks, toggles sound mode
tag @s[scores={click=3..}] add Temp
execute as @s[tag=Temp] run function johto:sound/switchmode
tellraw @s[tag=Temp,tag=DSSound] {"text":"Switching to DS sound..."}
tellraw @s[tag=Temp,tag=!DSSound] {"text":"Switching to GB sound..."}
execute as @s[tag=Temp] at @s run function johto:world/musictitles
tag @s[tag=Temp] remove RadioOff
scoreboard players set @s[tag=Temp] RadioSelect 0
execute as @s[tag=Temp] run return run tag @s remove Temp


#Two clicks, turns radio off
tag @s[tag=!RadioOff,scores={click=2}] add Temp
tellraw @s[tag=Temp] {"text":"Music toggled off... Double click the Radio again to turn on!"}
tag @s[tag=Temp] add RadioOff
execute as @s[tag=Temp] run function johto:tools/forceclick
execute as @s[tag=Temp] run return run tag @s remove Temp


#Two clicks, turns radio on
tag @s[tag=RadioOff,scores={click=2}] add Temp
tellraw @s[tag=Temp] {"text":"Music toggled on! Double click the Radio again to turn off!"}
tag @s[tag=Temp] remove RadioOff
scoreboard players set @s[tag=Temp] RadioSelect 0
execute as @s[tag=Temp] run return run tag @s remove Temp


#One click, refreshes current sounds
scoreboard players set @s[scores={click=1}] RadioSelect 0

#Only needs to be run if switchradiostation check is moved before this function
#execute if score @s RadioSelect matches 0 run function johto:world/switchradiostation