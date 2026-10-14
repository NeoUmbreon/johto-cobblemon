$scoreboard players set #requested_version click $(version)

# failure message if $(version) > #latest_version
$execute if score #requested_version click > #latest_version click if score #update_timer click matches 1 run say ERROR: Requested version $(version) is newer than #latest_version
execute if score #requested_version click > #latest_version click run return fail

# defer if $(version) - 1 != #world_version
scoreboard players remove #requested_version click 1
execute unless score #requested_version click = #world_version click run return 0

# try update
$execute if score #update_timer click matches 1 run say Applying map update v$(version)...
scoreboard players set #update_success click 1
$execute store success score #update_success click run function johto:updates/v$(version)/apply

# update failed, defer
execute if score #update_success click matches 0 run return 0

# update succeeded
scoreboard players set #update_timer click 0
$scoreboard players set #world_version click $(version)
$say Successfully updated map to v$(version)
return 1