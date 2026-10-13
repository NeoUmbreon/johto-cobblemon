#----- Increment this whenever a new in-world update needs to be done -----
scoreboard players set #latest_version click 1
#--------------------------------------------------------------------------
# Poll world version
execute if score #world_version click < #latest_version click run schedule function johto:updates/updateworld 1t

# Apply updates in order
# Must return to ensure subsequent updates do not fire too early
execute if score #world_version click matches 0 run return run function johto:updates/tryupdate {version:1}