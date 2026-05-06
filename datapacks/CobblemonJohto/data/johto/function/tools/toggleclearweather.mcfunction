# Enable
execute if score #weathertoggle click matches 0 run gamerule doWeatherCycle false
execute if score #weathertoggle click matches 0 run weather clear
execute if score #weathertoggle click matches 0 run tellraw @a {"text":"Permanent Clear Weather has been turned ","extra":[{"text":"ON","color":"gold"}]}
execute if score #weathertoggle click matches 0 run return run scoreboard players set #weathertoggle click 1

# Disable
gamerule doWeatherCycle true
scoreboard players set #weathertoggle click 0
tellraw @a {"text":"Permanent Clear Weather has been turned ","extra":[{"text":"OFF","color":"gray"}]}