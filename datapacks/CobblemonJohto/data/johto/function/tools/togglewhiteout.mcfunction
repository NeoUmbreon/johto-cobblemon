execute positioned -974 67 -351 run forceload add ~ ~

execute positioned -974 67 -351 if block ~ ~ ~ redstone_block run setblock ~ ~ ~-1 redstone_block
execute positioned -974 67 -351 if block ~ ~ ~ redstone_block run return run setblock ~ ~ ~ air

execute positioned -974 67 -351 run setblock ~ ~ ~-1 air
execute positioned -974 67 -351 run return run setblock ~ ~ ~ redstone_block