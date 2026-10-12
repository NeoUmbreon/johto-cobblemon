# Iterate this whenever a new in-world update needs to be done
#----------------------------------------------------
scoreboard players set #latest_version click 1
#----------------------------------------------------

execute if score #world_version click = #latest_version click run return 0

# let auto-reload run first
execute if score #check_reload click matches 0 run return run schedule function johto:load/checkversion 1t

say Updating world...
execute unless score #world_version click matches 0.. run scoreboard players set #world_version click 0

function johto:updates/apply