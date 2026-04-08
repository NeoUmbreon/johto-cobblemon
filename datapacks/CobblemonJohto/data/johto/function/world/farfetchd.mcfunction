#execute as @a[limit=1,x=513,y=60,z=-793,dx=187,dy=10,dz=228] run function johto:world/farfetchd

#Turns Farfetch'd invisible if player hasn't beaten Bugsy
execute unless entity @a[x=513,y=60,z=-793,dx=187,dy=10,dz=228,tag=Bugsy] run return run effect give @e[x=513,y=60,z=-793,dx=187,dy=10,dz=228,type=cobblemon:pokemon,tag=InitialSetup] minecraft:invisibility 5 1 true

#Summons uncatchable, noAI Farfetch'd if missing
execute unless entity @e[x=513,y=60,z=-793,dx=187,dy=10,dz=228,type=cobblemon:pokemon,tag=InitialSetup] run pokespawnat 593.5 64 -717.5 farfetchd no_ai=yes uncatchable=yes level=10
execute as @e[x=593,y=64,z=-717,distance=..5,tag=!InitialSetup,type=cobblemon:pokemon,nbt={Pokemon:{Species:"cobblemon:farfetchd",PokemonOriginalTrainerType:"NONE"}}] run tag @s add InitialSetup
execute as @e[x=593,y=64,z=-717,distance=..5,type=cobblemon:pokemon,tag=InitialSetup] at @s run tp @s ~ ~ ~ -180 ~
execute as @e[x=593,y=64,z=-717,distance=..5,type=cobblemon:pokemon,tag=InitialSetup] run data modify entity @s PersistenceRequired set value 1b
execute as @e[x=593,y=64,z=-717,distance=..5,type=cobblemon:pokemon,tag=InitialSetup] run data modify entity @s Unbattleable set value 1b
execute as @e[x=593,y=64,z=-717,distance=..5,type=cobblemon:pokemon,tag=InitialSetup] run data modify entity @s Invulnerable set value true
execute as @e[x=593,y=64,z=-717,distance=..5,type=cobblemon:pokemon,tag=InitialSetup] run data merge entity @s {Pokemon:{PokemonData:["uncatchable"]}}

#tps the statue to first chase position if statue is solved
execute if entity @a[x=622,y=64,z=-714,distance=..20,scores={Farfetchd=0},tag=Bugsy] run tp @e[x=622,y=64,z=-714,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] 593.5 64 -717.5


#Zone 6 East Detect
execute if entity @a[x=588,y=63,z=-701,dx=3,dy=5,dz=5,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-698,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=588,y=63,z=-701,dx=3,dy=5,dz=5,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-698,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5
execute if entity @a[x=588,y=63,z=-701,dx=3,dy=5,dz=5,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-698,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 3

#Zone 6 South Detect
execute if entity @a[x=592,y=63,z=-703,dx=3,dy=5,dz=7,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-698,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 4
execute if entity @a[x=592,y=63,z=-703,dx=3,dy=5,dz=7,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-698,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=592,y=63,z=-703,dx=3,dy=5,dz=7,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-698,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 5 West
execute if entity @a[x=574,y=63,z=-703,dx=5,dy=5,dz=10,scores={Farfetchd=0},tag=Bugsy] at @e[x=575,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 6
execute if entity @a[x=574,y=63,z=-703,dx=5,dy=5,dz=10,scores={Farfetchd=0},tag=Bugsy] at @e[x=575,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=574,y=63,z=-703,dx=5,dy=5,dz=10,scores={Farfetchd=0},tag=Bugsy] at @e[x=575,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5

#Zone 5 East
execute if entity @a[x=569,y=63,z=-703,dx=4,dy=5,dz=10,scores={Farfetchd=0},tag=Bugsy] at @e[x=575,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 5
execute if entity @a[x=569,y=63,z=-703,dx=4,dy=5,dz=10,scores={Farfetchd=0},tag=Bugsy] at @e[x=575,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=569,y=63,z=-703,dx=4,dy=5,dz=10,scores={Farfetchd=0},tag=Bugsy] at @e[x=575,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 4 North
execute if entity @a[x=545,y=63,z=-702,dx=5,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 8
execute if entity @a[x=545,y=63,z=-702,dx=5,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=545,y=63,z=-702,dx=5,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 4 South
execute if entity @a[x=545,y=63,z=-707,dx=3,dy=5,dz=4,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 7
execute if entity @a[x=545,y=63,z=-707,dx=3,dy=5,dz=4,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=545,y=63,z=-707,dx=3,dy=5,dz=4,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-701,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 3 West
execute if entity @a[x=551,y=63,z=-730,dx=4,dy=5,dz=10,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 9
execute if entity @a[x=551,y=63,z=-730,dx=4,dy=5,dz=10,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=551,y=63,z=-730,dx=4,dy=5,dz=10,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 3 North
execute if entity @a[x=544,y=63,z=-723,dx=6,dy=5,dz=3,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 10
execute if entity @a[x=544,y=63,z=-723,dx=6,dy=5,dz=3,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=544,y=63,z=-723,dx=6,dy=5,dz=3,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 3 South
execute if entity @a[x=544,y=63,z=-730,dx=6,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 9
execute if entity @a[x=544,y=63,z=-730,dx=6,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=544,y=63,z=-730,dx=6,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=547,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 2 North
execute if entity @a[x=568,y=63,z=-723,dx=6,dy=5,dz=4,scores={Farfetchd=0},tag=Bugsy] at @e[x=570,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 11
execute if entity @a[x=568,y=63,z=-723,dx=6,dy=5,dz=4,scores={Farfetchd=0},tag=Bugsy] at @e[x=570,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=568,y=63,z=-723,dx=6,dy=5,dz=4,scores={Farfetchd=0},tag=Bugsy] at @e[x=570,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 2 South
execute if entity @a[x=565,y=63,z=-729,dx=9,dy=5,dz=5,scores={Farfetchd=0},tag=Bugsy] at @e[x=570,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 12
execute if entity @a[x=565,y=63,z=-729,dx=9,dy=5,dz=5,scores={Farfetchd=0},tag=Bugsy] at @e[x=570,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=565,y=63,z=-729,dx=9,dy=5,dz=5,scores={Farfetchd=0},tag=Bugsy] at @e[x=570,y=64,z=-725,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 1 East
#,x=588,y=63,z=-720,dx=4,dy=5,dz=6
execute if entity @a[x=588,y=63,z=-720,dx=4,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-717,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 2
execute if entity @a[x=588,y=63,z=-720,dx=4,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-717,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=588,y=63,z=-720,dx=4,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-717,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5


#Zone 1 North (solves the puzzle)
#x=592,y=63,z=-713,dx=6,dy=5,dz=5
execute if entity @a[x=592,y=63,z=-713,dx=6,dy=5,dz=5,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-717,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 1
execute if entity @a[x=592,y=63,z=-713,dx=6,dy=5,dz=5,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-717,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=592,y=63,z=-713,dx=6,dy=5,dz=5,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-717,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5



#Zone 1 South
execute if entity @a[x=593,y=63,z=-722,dx=5,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-717,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run scoreboard players set @e[x=-792,y=65,z=-284,dy=3,type=minecraft:armor_stand] Farfetchd 13
execute if entity @a[x=593,y=63,z=-722,dx=5,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-717,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run tellraw @a[distance=..24] ["",{"text":"<Farfetch'd> "},{"text":"Kwaa!!","italic":true}]
execute if entity @a[x=593,y=63,z=-722,dx=5,dy=5,dz=6,scores={Farfetchd=0},tag=Bugsy] at @e[x=593,y=64,z=-717,distance=..3,type=cobblemon:pokemon,tag=InitialSetup] run playsound common/cries/farfetchd neutral @a ~ ~ ~ 1.5






#
