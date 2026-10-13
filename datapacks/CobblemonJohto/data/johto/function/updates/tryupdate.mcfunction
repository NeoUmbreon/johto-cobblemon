$execute if score #update_timer click matches 0 run say Applying map update v$(version)...
$execute store success score #update_success click run function johto:updates/v$(version)/apply

# update succeeded
execute if score #update_success click matches 1 run scoreboard players set #update_timer click 0
$execute if score #update_success click matches 1 run scoreboard players set #world_version click $(version)
$execute if score #update_success click matches 1 run say Updated map to v$(version)
execute if score #update_success click matches 1 run return 1

# update failed
scoreboard players add #update_timer click 1
execute unless score #update_timer click matches 200.. run return 0

# update takin too damn long
schedule clear johto:updates/updateworld
$say Update v$(version) took >10s to apply, aborting
say Retry by running /reload