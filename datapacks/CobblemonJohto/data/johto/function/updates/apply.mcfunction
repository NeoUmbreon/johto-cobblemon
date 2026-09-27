# Recurse
execute if score #world_version click < #latest_version click run schedule function johto:updates/apply 3t

# Apply updates in sequence
execute if score #world_version click matches 0 run return run function johto:updates/v1/pass1
# execute if score #world_version click matches 1 run return run ..