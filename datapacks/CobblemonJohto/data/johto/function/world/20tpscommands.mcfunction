#-------------------------------------------------------------------------------------------------------------------------
#Auto-battle detection
execute as @a[scores={BattleStart=0}] at @s as @e[type=cobblemon:npc,tag=!trainerBusy,distance=..6,nbt={Config:{trainer:1.0d}}] at @s run function johto:trainers/detect_trainers with entity @s Config

# Keep players inside radius
execute as @e[type=cobblemon:npc,tag=trainerBusy] store result score @s TrainerUID run data get entity @s Config.trainer_uid
execute as @a[scores={BattleStart=1..}] at @s run execute as @e[type=cobblemon:npc,tag=trainerBusy,distance=6.05..7.5] if score @s TrainerUID = @a[distance=..0.1,limit=1] ActiveTrainer run tp @a[distance=..0.1,limit=1] @s

# Free trainer if no active battle players nearby
execute as @e[type=cobblemon:npc,tag=trainerBusy] at @s unless entity @a[scores={BattleStart=1..},distance=..7.6,limit=1] run tag @s remove trainerBusy

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
