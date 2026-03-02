
#--------------------------------------------------------------------------------------------------GENERAL WORLD-----------------------------------------------------------------------------------------------------------------------------------

#Runs the Portals when a player steps on a carpet plate block
execute at @a run execute if block ~ ~ ~ minecraft:magenta_carpet run function johto:world/portals

#Runs the Game Corner slots if the player is within the building
execute if entity @e[x=485,y=59,z=-370,dx=22,dy=4,scores={SlotRolled=1..}] run execute as @a[x=489,y=64,z=-389,dx=31,dy=10,dz=19,tag=CoinCase] run function johto:triggers/gamecorner


#Ilex Forest Farfetch'd running function
execute if entity @e[x=-792,y=65,z=-284,dy=3,type=armor_stand,scores={Farfetchd=1..}] run function johto:triggers/farfetchdrun


#Sudowoodo Blocks
execute as @a[x=327,y=63,z=-19,dx=10,dy=5,dz=5,tag=!Dialogue29] run opendialogue sudowoodo_nobottle @s 
execute as @a[x=327,y=63,z=-19,dx=10,dy=5,dz=5,tag=!Dialogue29] at @s run tp @a[x=327,y=63,z=-19,dx=10,dy=5,dz=5,tag=!Dialogue29] ~-10 ~ ~

execute as @a[x=331,y=63,z=-23,dx=4,dy=5,dz=9,tag=!Dialogue29] run opendialogue sudowoodo_nobottle @s 
execute as @a[x=331,y=63,z=-23,dx=4,dy=5,dz=9,tag=!Dialogue29] at @s run tp @a[x=331,y=63,z=-23,dx=4,dy=5,dz=9,tag=!Dialogue29] ~ ~ ~-10


#Cycling Road Blocks
#Celadon Side
execute as @a[x=-2096,y=63,z=314,dx=5,dy=7,dz=17,tag=!Cycling] run opendialogue cyclingroad_blocked @s
execute as @a[x=-2096,y=63,z=314,dx=5,dy=7,dz=17,tag=!Cycling] at @s run tp @s ~-5 ~ ~

#Fuchsia Side
execute as @a[x=-2196,y=63,z=-547,dx=5,dy=7,dz=17,tag=!Cycling] run opendialogue cyclingroad_blocked @s
execute as @a[x=-2196,y=63,z=-547,dx=5,dy=7,dz=17,tag=!Cycling] at @s run tp @s ~-5 ~ ~

#Surfing Detection
#TODO: should probably be compacted
execute as @a[tag=Surfing] unless predicate johto:riding run scoreboard players set @s SurfingCD 0
execute as @a[tag=Surfing] if score @s SurfingCD matches 0 run function johto:tools/forceclick
execute as @a[tag=Surfing] if score @s SurfingCD matches 0 run tag @s remove Surfing

execute as @a if score @s SurfingCD matches 1.. run scoreboard players remove @s SurfingCD 1
execute as @a at @s if predicate johto:surfing run scoreboard players set @s SurfingCD 30

execute as @a[tag=!Surfing] at @s if predicate johto:surfing run function johto:tools/forceclick
execute as @a[tag=!Surfing] at @s if predicate johto:surfing run tag @s add Surfing

#Radio
execute as @a[tag=!RadioOff,scores={MusicCooldown=0,MusicLoop=0,RadioSelect=2}] at @s run function johto:world/sound/retroradiointro
execute as @a[tag=!RadioOff,scores={MusicCooldown=0,MusicLoop=1,RadioSelect=2}] at @s run function johto:world/sound/retroradioloop

#Removes a MusicCooldown score each refresh if present
scoreboard players remove @a[scores={MusicCooldown=1..}] MusicCooldown 1