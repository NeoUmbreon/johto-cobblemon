#----- Increment this whenever a new in-world update needs to be done -----
scoreboard players set #latest_version click 1
#--------------------------------------------------------------------------
# Poll world version; exit if up-to-date
execute unless score #world_version click < #latest_version click run return 0

scoreboard players add #update_timer click 1

# update takin too damn long
execute if score #update_timer click matches 200.. run say Update took too long to apply, aborting
execute if score #update_timer click matches 200.. run return run say To retry, run /reload

schedule function johto:updates/updateworld 1t

# Update list
#--------------------------------------------------------------------------
# To add a new update:
# 1. Increment #latest_version at the top of this file
# 2. Place your function(s) named `apply.mcfunction` in `johto:updates/v(N)/`
#    - Main function MUST be named `apply.mcfunction`
#    - Helper functions can be named whatever
# 3. Add a new `tryupdate` call below with the corresponding version number
#--------------------------------------------------------------------------
function johto:updates/tryupdate {version:1}