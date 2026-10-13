# let auto-reload run first
execute if score #check_reload click matches 0 run return run schedule function johto:load/startupdates 1t

# defaults
execute unless score #world_version click matches 0.. run scoreboard players set #world_version click 0
scoreboard players set #update_timer click 0

function johto:updates/updateworld