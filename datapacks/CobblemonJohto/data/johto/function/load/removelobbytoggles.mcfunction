# Forceload chunks
forceload add -968 -360 -970 -345

# Clear Weather signs, button
fill -972 66 -358 -972 68 -358 air replace

# Whiteout signs, button
fill -974 66 -358 -974 68 -358 air replace

# Clear Weather command blocks, redstone
fill -972 68 -356 -972 64 -345 air replace

# Whiteout command blocks, redstone
fill -974 68 -356 -974 64 -345 air replace

# Gamerules label
kill @e[x=-971,y=67,z=-358,name=Gamerules,type=minecraft:armor_stand]

# Remove forceload when done
forceload remove -968 -360 -970 -345