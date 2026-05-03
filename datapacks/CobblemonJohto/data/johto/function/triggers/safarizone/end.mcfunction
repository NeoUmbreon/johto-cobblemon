#Clears Safari Zone

#Forceload chunks
forceload add 1406 -90 1591 101
forceload add 1592 -90 1777 101

#---------------------------
#Zone 1 Clear
fill 1654 79 6 1777 92 102 air
fill 1654 93 6 1777 106 102 air
kill @e[x=1654,y=78,z=6,dx=124,dy=10,dz=96,type=!player]

#Zone 2 Clear
fill 1654 79 -90 1777 92 5 air
fill 1654 93 -90 1777 106 5 air
kill @e[x=1654,y=78,z=-90,dx=124,dy=10,dz=96,type=!player]

#Zone 3 Clear
fill 1530 79 6 1653 92 101 air
fill 1530 93 6 1653 106 101 air
kill @e[x=1530,y=78,z=6,dx=124,dy=10,dz=96,type=!player]

#Zone 4 Clear
fill 1530 79 -90 1653 92 5 air
fill 1530 93 -90 1653 106 5 air
kill @e[x=1530,y=78,z=-90,dx=124,dy=10,dz=96,type=!player]

#Zone 5 Clear
fill 1406 79 6 1529 92 101 air
fill 1406 93 6 1529 106 101 air
kill @e[x=1406,y=78,z=6,dx=124,dy=10,dz=96,type=!player]

#Zone 6 Clear
fill 1406 79 -90 1529 92 5 air
fill 1406 93 -90 1529 106 5 air
kill @e[x=1406,y=78,z=-90,dx=124,dy=10,dz=96,type=!player]
#---------------------------

#Player commands
clear @s cobblemon:safari_ball
scoreboard players set @s SafariState 0
tp @s 1591 88 -111 180 4
spawnpoint @s 1591 88 -111
tellraw @s ["",{"text":"Thank you for visiting! Come again soon!"}]
advancement grant @s only johto:sidequests/safarizone

#Clear armor stand data
scoreboard players set @e[x=-879,y=64,z=-180,dy=5,dz=10,type=armor_stand] BiomeID 0
tag @e[x=-792,y=65,z=-284,dy=3,type=armor_stand] remove SafariActive

#Clear forceloaded chunks
forceload remove 1406 -90 1591 101
forceload remove 1592 -90 1777 101