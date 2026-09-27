# Iterate this whenever a new in-world update needs to be done
#----------------------------------------------------
scoreboard players set #latest_version click 1
#----------------------------------------------------

execute if score #world_version click = #latest_version click run return fail

say Updating world...
execute unless score #world_version click matches 0.. run scoreboard players set #world_version click 0

function johto:updates/apply