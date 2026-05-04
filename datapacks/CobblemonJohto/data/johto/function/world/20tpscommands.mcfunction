#-------------------------------------------------------------------------------------------------------------------------
#Auto-battle detection
execute as @a[scores={BattleStart=0,BattleCD=0},tag=!InDialogue] run runmolangscript johto:detect_trainers @s

# Keep players inside radius
execute as @a[scores={BattleStart=11..18}] run runmolangscript cobblemon:prevent_flee @s

# Free trainer if no active battle players nearby
execute as @e[type=cobblemon:npc,tag=trainerBusy] run runmolangscript cobblemon:clear_trainer_busy


#--------------------------------------------------------------------------------------------------GENERAL WORLD-----------------------------------------------------------------------------------------------------------------------------------

#Runs the Portals when a player steps on a carpet plate block
execute as @a at @s if block ~ ~ ~ minecraft:magenta_carpet run function johto:world/portals

#Runs the Game Corner slots if any of the armor stands are tagged as active
execute if entity @e[x=485,y=59,z=-370,dx=22,dy=4,type=armor_stand,tag=SlotRolled] run function johto:triggers/gamecorner


#Ilex Forest Farfetch'd running function
execute if entity @e[x=-792,y=65,z=-284,dy=3,type=armor_stand,scores={Farfetchd=1..}] run function johto:triggers/farfetchdrun


#Sudowoodo Blocks
execute as @a[x=327,y=63,z=-19,dx=10,dy=5,dz=5,tag=!Dialogue29] run opendialogue sudowoodo_nobottle @s 
execute as @a[x=327,y=63,z=-19,dx=10,dy=5,dz=5,tag=!Dialogue29] at @s run tp @s ~-10 ~ ~

execute as @a[x=331,y=63,z=-23,dx=4,dy=5,dz=9,tag=!Dialogue29] run opendialogue sudowoodo_nobottle @s 
execute as @a[x=331,y=63,z=-23,dx=4,dy=5,dz=9,tag=!Dialogue29] at @s run tp @s ~ ~ ~-10


#Cycling Road Blocks
#Celadon Side
execute as @a[x=-2096,y=63,z=314,dx=5,dy=7,dz=17,tag=!Cycling] run opendialogue cyclingroad_blocked @s
execute as @a[x=-2096,y=63,z=314,dx=5,dy=7,dz=17,tag=!Cycling] at @s run tp @s ~-5 ~ ~

#Fuchsia Side
execute as @a[x=-2196,y=63,z=-547,dx=5,dy=7,dz=17,tag=!Cycling] run opendialogue cyclingroad_blocked @s
execute as @a[x=-2196,y=63,z=-547,dx=5,dy=7,dz=17,tag=!Cycling] at @s run tp @s ~-5 ~ ~


#Surfing Detection
#Remove Surfing tag and refresh music if player dismounts or mount hasn't been in the water (SurfingCD reached 0)
scoreboard players set @a[tag=Surfing,predicate=!johto:riding] SurfingCD 0
execute as @a[scores={SurfingCD=0,BattleStart=0},tag=Surfing] run function johto:tools/forceclick
tag @a[scores={SurfingCD=0},tag=Surfing] remove Surfing

#Detection hysteresis
scoreboard players remove @a[scores={SurfingCD=1..}] SurfingCD 1
scoreboard players set @a[predicate=johto:surfing] SurfingCD 30

#Add Surfing tag to newly surfing players and refresh music
execute as @a[scores={SurfingCD=30,BattleStart=0},tag=!Surfing] run function johto:tools/forceclick
tag @a[scores={SurfingCD=30},tag=!Surfing] add Surfing


#Battle endings
execute as @a[scores={BattleEnd=1..},tag=!Overwrite] run function johto:triggers/battles/battleend

#Radio
execute as @a[tag=!RadioOff,scores={MusicCooldown=0},tag=DSSound] at @s run function johto:sound/dsradioloop
execute as @a[tag=!RadioOff,scores={MusicCooldown=0,MusicLoop=0},tag=!DSSound] at @s run function johto:sound/gbradiointro
execute as @a[tag=!RadioOff,scores={MusicCooldown=0,MusicLoop=1..},tag=!DSSound] at @s run function johto:sound/gbradioloop

#Removes a MusicCooldown score each refresh if present
scoreboard players remove @a[scores={MusicCooldown=1..}] MusicCooldown 1

#Removes forceclick prevention tag
tag @a[tag=Overwrite,scores={MusicCooldown=0}] remove Overwrite