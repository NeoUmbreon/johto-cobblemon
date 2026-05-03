#Forceload chunks
forceload add 1406 -90 1591 101
forceload add 1592 -90 1777 101

#Fill base
#TODO: this is a bit too brute-force
fill 1406 79 -90 1591 82 101 stone
fill 1592 79 -90 1777 82 101 stone

#Clones as in spawners from reference spawn
#^ i have no fucking clue what this means. is this a pixelmon thing? ^
clone -870 65 -157 -870 65 -157 -716 0 -268
clone -870 65 -157 -870 65 -157 -716 0 -310
clone -875 65 -157 -875 65 -157 -779 12 -310
clone -875 65 -157 -875 65 -157 -779 12 -268
clone -869 65 -157 -869 65 -157 -716 31 -268
clone -869 65 -157 -869 65 -157 -716 31 -310
clone -871 65 -157 -871 65 -157 -779 46 -268
clone -871 65 -157 -871 65 -157 -779 46 -310
clone -873 65 -157 -873 65 -157 -716 0 -172
clone -873 65 -157 -873 65 -157 -779 0 -172
clone -872 65 -157 -872 65 -157 -716 17 -214
clone -872 65 -157 -872 65 -157 -779 17 -214
clone -876 65 -157 -876 65 -157 -716 39 -172
clone -877 65 -157 -877 65 -157 -779 58 -214
clone -877 65 -157 -877 65 -157 -779 58 -172
clone -874 65 -157 -874 65 -157 -716 72 -172
clone -874 65 -157 -874 65 -157 -716 72 -214
clone -880 65 -157 -880 65 -157 -716 90 -172
clone -880 65 -157 -880 65 -157 -779 90 -172
clone -879 65 -157 -879 65 -157 -850 14 -310
clone -879 65 -157 -879 65 -157 -850 14 -268
clone -878 65 -157 -878 65 -157 -850 14 -214
clone -878 65 -157 -878 65 -157 -850 14 -172
clone -870 65 -157 -870 65 -157 -779 0 -310
clone -870 65 -157 -870 65 -157 -779 0 -268
clone -875 65 -157 -875 65 -157 -716 12 -310
clone -875 65 -157 -875 65 -157 -716 12 -268
clone -869 65 -157 -869 65 -157 -779 31 -310
clone -869 65 -157 -869 65 -157 -779 31 -268
clone -871 65 -157 -871 65 -157 -716 46 -310
clone -871 65 -157 -871 65 -157 -716 46 -268
clone -873 65 -157 -873 65 -157 -779 0 -214
clone -873 65 -157 -873 65 -157 -716 0 -214
clone -872 65 -157 -872 65 -157 -779 17 -172
clone -872 65 -157 -872 65 -157 -716 17 -172
clone -876 65 -157 -876 65 -157 -779 39 -214
clone -876 65 -157 -876 65 -157 -779 39 -172
clone -877 65 -157 -877 65 -157 -716 58 -214
clone -877 65 -157 -877 65 -157 -716 58 -172
clone -874 65 -157 -874 65 -157 -779 72 -172
clone -874 65 -157 -874 65 -157 -779 72 -214
clone -880 65 -157 -880 65 -157 -716 90 -214
clone -880 65 -157 -880 65 -157 -779 90 -214
clone -879 65 -157 -879 65 -157 -841 1 -268
clone -879 65 -157 -879 65 -157 -841 1 -310
clone -878 65 -157 -878 65 -157 -841 1 -214
clone -878 65 -157 -878 65 -157 -841 1 -172


#Generates biomes
#---------------------------
#Zone 1
#Zone 1 Biome 1
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=1}] run function johto:triggers/safarizone/biomes/desert {destination:"1654 79 6"}

#Zone 1 Biome 2
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=2}] run function johto:triggers/safarizone/biomes/marshland {destination:"1654 79 6"}

#Zone 1 Biome 3
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=3}] run function johto:triggers/safarizone/biomes/peak {destination:"1654 79 6"}

#Zone 1 Biome 4
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=4}] run function johto:triggers/safarizone/biomes/plains {destination:"1654 79 6"}

#Zone 1 Biome 5
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=5}] run function johto:triggers/safarizone/biomes/forest {destination:"1654 79 6"}

#Zone 1 Biome 6
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=6}] run function johto:triggers/safarizone/biomes/meadow {destination:"1654 79 6"}

#Zone 1 Biome 7
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=7}] run function johto:triggers/safarizone/biomes/mountain {destination:"1654 79 6"}

#Zone 1 Biome 8
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=8}] run function johto:triggers/safarizone/biomes/rockybeach {destination:"1654 79 6"}

#Zone 1 Biome 9
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=9}] run function johto:triggers/safarizone/biomes/swamp {destination:"1654 79 6"}

#Zone 1 Biome 10
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=10}] run function johto:triggers/safarizone/biomes/wetland {destination:"1654 79 6"}

#Zone 1 Biome 11
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=11}] run function johto:triggers/safarizone/biomes/savannah {destination:"1654 79 6"}

#Zone 1 Biome 12
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=12}] run function johto:triggers/safarizone/biomes/wasteland {destination:"1654 79 6"}

#---------------------------
#Zone 2
#Zone 2 Biome 1
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=1}] run function johto:triggers/safarizone/biomes/desert {destination:"1654 79 -90"}

#Zone 2 Biome 2
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=2}] run function johto:triggers/safarizone/biomes/marshland {destination:"1654 79 -90"}

#Zone 2 Biome 3
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=3}] run function johto:triggers/safarizone/biomes/peak {destination:"1654 79 -90"}

#Zone 2 Biome 4
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=4}] run function johto:triggers/safarizone/biomes/plains {destination:"1654 79 -90"}

#Zone 2 Biome 5
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=5}] run function johto:triggers/safarizone/biomes/forest {destination:"1654 79 -90"}

#Zone 2 Biome 6
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=6}] run function johto:triggers/safarizone/biomes/meadow {destination:"1654 79 -90"}

#Zone 2 Biome 7
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=7}] run function johto:triggers/safarizone/biomes/mountain {destination:"1654 79 -90"}

#Zone 2 Biome 8
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=8}] run function johto:triggers/safarizone/biomes/rockybeach {destination:"1654 79 -90"}

#Zone 2 Biome 9
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=9}] run function johto:triggers/safarizone/biomes/swamp {destination:"1654 79 -90"}

#Zone 2 Biome 10
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=10}] run function johto:triggers/safarizone/biomes/wetland {destination:"1654 79 -90"}

#Zone 2 Biome 11
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=11}] run function johto:triggers/safarizone/biomes/savannah {destination:"1654 79 -90"}

#Zone 2 Biome 12
execute if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=12}] run function johto:triggers/safarizone/biomes/wasteland {destination:"1654 79 -90"}

#---------------------------
#Zone 3
#Zone 3 Biome 1
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=1}] run function johto:triggers/safarizone/biomes/desert {destination:"1530 79 -90"}

#Zone 3 Biome 2
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=2}] run function johto:triggers/safarizone/biomes/marshland {destination:"1530 79 -90"}

#Zone 3 Biome 3
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=3}] run function johto:triggers/safarizone/biomes/peak {destination:"1530 79 -90"}

#Zone 3 Biome 4
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=4}] run function johto:triggers/safarizone/biomes/plains {destination:"1530 79 -90"}

#Zone 3 Biome 5
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=5}] run function johto:triggers/safarizone/biomes/forest {destination:"1530 79 -90"}

#Zone 3 Biome 6
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=6}] run function johto:triggers/safarizone/biomes/meadow {destination:"1530 79 -90"}

#Zone 3 Biome 7
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=7}] run function johto:triggers/safarizone/biomes/mountain {destination:"1530 79 -90"}

#Zone 3 Biome 8
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=8}] run function johto:triggers/safarizone/biomes/rockybeach {destination:"1530 79 -90"}

#Zone 3 Biome 9
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=9}] run function johto:triggers/safarizone/biomes/swamp {destination:"1530 79 -90"}

#Zone 3 Biome 10
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=10}] run function johto:triggers/safarizone/biomes/wetland {destination:"1530 79 -90"}

#Zone 3 Biome 11
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=11}] run function johto:triggers/safarizone/biomes/savannah {destination:"1530 79 -90"}

#Zone 3 Biome 12
execute if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=12}] run function johto:triggers/safarizone/biomes/wasteland {destination:"1530 79 -90"}

#---------------------------
#Zone 4
#Zone 4 Biome 1
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=1}] run function johto:triggers/safarizone/biomes/desert {destination:"1530 79 6"}

#Zone 4 Biome 2
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=2}] run function johto:triggers/safarizone/biomes/marshland {destination:"1530 79 6"}

#Zone 4 Biome 3
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=3}] run function johto:triggers/safarizone/biomes/peak {destination:"1530 79 6"}

#Zone 4 Biome 4
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=4}] run function johto:triggers/safarizone/biomes/plains {destination:"1530 79 6"}

#Zone 4 Biome 5
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=5}] run function johto:triggers/safarizone/biomes/forest {destination:"1530 79 6"}

#Zone 4 Biome 6
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=6}] run function johto:triggers/safarizone/biomes/meadow {destination:"1530 79 6"}

#Zone 4 Biome 7
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=7}] run function johto:triggers/safarizone/biomes/mountain {destination:"1530 79 6"}

#Zone 4 Biome 8
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=8}] run function johto:triggers/safarizone/biomes/rockybeach {destination:"1530 79 6"}

#Zone 4 Biome 9
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=9}] run function johto:triggers/safarizone/biomes/swamp {destination:"1530 79 6"}

#Zone 4 Biome 10
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=10}] run function johto:triggers/safarizone/biomes/wetland {destination:"1530 79 6"}

#Zone 4 Biome 11
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=11}] run function johto:triggers/safarizone/biomes/savannah {destination:"1530 79 6"}

#Zone 4 Biome 12
execute if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=12}] run function johto:triggers/safarizone/biomes/wasteland {destination:"1530 79 6"}

#---------------------------
#Zone 5
#Zone 5 Biome 1
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=1}] run function johto:triggers/safarizone/biomes/desert {destination:"1406 79 6"}

#Zone 5 Biome 2
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=2}] run function johto:triggers/safarizone/biomes/marshland {destination:"1406 79 6"}

#Zone 5 Biome 3
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=3}] run function johto:triggers/safarizone/biomes/peak {destination:"1406 79 6"}

#Zone 5 Biome 4
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=4}] run function johto:triggers/safarizone/biomes/plains {destination:"1406 79 6"}

#Zone 5 Biome 5
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=5}] run function johto:triggers/safarizone/biomes/forest {destination:"1406 79 6"}

#Zone 5 Biome 6
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=6}] run function johto:triggers/safarizone/biomes/meadow {destination:"1406 79 6"}

#Zone 5 Biome 7
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=7}] run function johto:triggers/safarizone/biomes/mountain {destination:"1406 79 6"}

#Zone 5 Biome 8
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=8}] run function johto:triggers/safarizone/biomes/rockybeach {destination:"1406 79 6"}

#Zone 5 Biome 9
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=9}] run function johto:triggers/safarizone/biomes/swamp {destination:"1406 79 6"}

#Zone 5 Biome 10
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=10}] run function johto:triggers/safarizone/biomes/wetland {destination:"1406 79 6"}

#Zone 5 Biome 11
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=11}] run function johto:triggers/safarizone/biomes/savannah {destination:"1406 79 6"}

#Zone 5 Biome 12
execute if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=12}] run function johto:triggers/safarizone/biomes/wasteland {destination:"1409 79 6"}

#---------------------------
#Zone 6
#Zone 6 Biome 1
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=1}] run function johto:triggers/safarizone/biomes/desert {destination:"1406 79 -90"}

#Zone 6 Biome 2
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=2}] run function johto:triggers/safarizone/biomes/marshland {destination:"1406 79 -90"}

#Zone 6 Biome 3
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=3}] run function johto:triggers/safarizone/biomes/peak {destination:"1406 79 -90"}

#Zone 6 Biome 4
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=4}] run function johto:triggers/safarizone/biomes/plains {destination:"1406 79 -90"}

#Zone 6 Biome 5
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=5}] run function johto:triggers/safarizone/biomes/forest {destination:"1406 79 -90"}

#Zone 6 Biome 6
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=6}] run function johto:triggers/safarizone/biomes/meadow {destination:"1406 79 -90"}

#Zone 6 Biome 7
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=7}] run function johto:triggers/safarizone/biomes/mountain {destination:"1406 79 -90"}

#Zone 6 Biome 8
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=8}] run function johto:triggers/safarizone/biomes/rockybeach {destination:"1406 79 -90"}

#Zone 6 Biome 9
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=9}] run function johto:triggers/safarizone/biomes/swamp {destination:"1406 79 -90"}

#Zone 6 Biome 10
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=10}] run function johto:triggers/safarizone/biomes/wetland {destination:"1406 79 -90"}

#Zone 6 Biome 11
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=11}] run function johto:triggers/safarizone/biomes/savannah {destination:"1406 79 -90"}

#Zone 6 Biome 12
execute if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=12}] run function johto:triggers/safarizone/biomes/wasteland {destination:"1406 79 -90"}

#---------------------------

#Player commands
spawnpoint @s 1591 84 -87
tp @s 1591 84 -87 -180 1
scoreboard players set @s SafariState 1
give @s cobblemon:safari_ball 64
tellraw @s ["",{"text":"Enjoy your stay in the Safari Zone! Come back to the start when you are ready to leave."}]

#Clean up waiting room
setblock 1595 81 -129 redstone_block
scoreboard players set @e[x=-879,y=64,z=-180,dy=5,dz=10,type=armor_stand] BiomeID 0

#Clear forceloaded chunks
forceload remove 1406 -90 1591 101
forceload remove 1592 -90 1777 101