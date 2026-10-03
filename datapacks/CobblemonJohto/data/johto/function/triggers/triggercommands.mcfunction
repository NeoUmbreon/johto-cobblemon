
#Command to activate in tellraws:
#/trigger TriggerCommand set 1
#/scoreboard players enable @p TriggerCommand

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#10 - Makes Sudowoodo battleable and catchable
execute as @a[scores={TriggerCommand=10}] run data merge entity @e[x=332,y=64,z=-17,distance=..5,type=cobblemon:pokemon,limit=1,name=Sudowoodo] {Pokemon:{PokemonData:["catchable"]}}
execute as @a[scores={TriggerCommand=10}] run data merge entity @e[x=332,y=64,z=-17,distance=..5,type=cobblemon:pokemon,limit=1,name=Sudowoodo] {NoAI:0b}
execute as @a[scores={TriggerCommand=10}] run data modify entity @e[x=332,y=64,z=-17,distance=..5,type=cobblemon:pokemon,limit=1,name=Sudowoodo] Unbattleable set value 0b
execute as @a[scores={TriggerCommand=10}] run advancement grant @s only johto:story/weirdtree
execute as @a[scores={TriggerCommand=10}] at @s run function johto:sound/playcry {species:"sudowoodo",distance:24,volume:1.5}

#11 - Sets up Electrode in Rocket HQ
execute as @a[scores={TriggerCommand=11}] unless entity @e[x=-92,y=46,z=187,distance=..2,type=cobblemon:pokemon] run pokespawnat -92 46 187 electrode no_ai=yes level=23
execute as @a[scores={TriggerCommand=11}] unless entity @e[x=-92,y=46,z=195,distance=..2,type=cobblemon:pokemon] run pokespawnat -92 46 195 electrode no_ai=yes level=23
execute as @a[scores={TriggerCommand=11}] unless entity @e[x=-92,y=46,z=203,distance=..2,type=cobblemon:pokemon] run pokespawnat -92 46 203 electrode no_ai=yes level=23
execute as @a[scores={TriggerCommand=11}] as @e[x=-94,y=45,z=185,dx=4,dy=5,dz=20,type=cobblemon:pokemon] at @s run tp @s ~ ~ ~ 180 ~
execute as @a[scores={TriggerCommand=11}] as @e[x=-94,y=45,z=185,dx=4,dy=5,dz=20,type=cobblemon:pokemon] run data modify entity @s PersistenceRequired set value 1

execute as @a[scores={TriggerCommand=11}] unless entity @e[x=-143,y=46,z=187,distance=..2,type=cobblemon:pokemon] run pokespawnat -143 46 187 electrode no_ai=yes level=23
execute as @a[scores={TriggerCommand=11}] unless entity @e[x=-143,y=46,z=195,distance=..2,type=cobblemon:pokemon] run pokespawnat -143 46 195 electrode no_ai=yes level=23
execute as @a[scores={TriggerCommand=11}] unless entity @e[x=-143,y=46,z=203,distance=..2,type=cobblemon:pokemon] run pokespawnat -143 46 203 electrode no_ai=yes level=23
execute as @a[scores={TriggerCommand=11}] as @e[x=-145,y=45,z=185,dx=4,dy=5,dz=20,type=cobblemon:pokemon] at @s run tp @s ~ ~ ~ 180 ~
execute as @a[scores={TriggerCommand=11}] as @e[x=-145,y=45,z=185,dx=4,dy=5,dz=20,type=cobblemon:pokemon] run data modify entity @s PersistenceRequired set value 1


#22 - Safari Zone Begin Session
#If triggered by ownership transfer, mark Safari Zone as inactive to reset biomes
execute as @s[scores={TriggerCommand=22},tag=SafariStarter] run tag @e[x=-792,y=65,z=-284,dy=3,type=armor_stand] remove SafariActive

#No money :(
execute as @s[scores={TriggerCommand=22},tag=!SafariState] unless score @s Money matches 500.. run tellraw @s {"text":"<Safari Clerk> I am sorry. You don't have enough money. I hope you will drop by again."}
execute as @s[scores={TriggerCommand=22},tag=!SafariState] unless score @s Money matches 500.. run scoreboard players set @s TriggerCommand 0

#If Safari Zone is currently active, join ongoing session
execute as @s[scores={TriggerCommand=22}] if entity @e[x=-792,y=65,z=-284,dy=3,type=armor_stand,tag=SafariActive] run function johto:triggers/safarizone/join
execute as @s[scores={TriggerCommand=22}] if entity @e[x=-792,y=65,z=-284,dy=3,type=armor_stand,tag=SafariActive] run scoreboard players set @s TriggerCommand 0

#Else: tp to waiting room
execute as @s[scores={TriggerCommand=22}] unless entity @a[x=1590,y=74,z=-129,dx=10,dy=5,dz=10] unless entity @a[tag=SafariStarter] run tag @s add SafariStarter
execute as @s[scores={TriggerCommand=22}] run tp @s 1595 75 -125 -180 -5
execute as @s[scores={TriggerCommand=22}] run tellraw @s {"text":"Before you start, you must pick which biomes you want in your Safari Zone!"}
execute as @s[scores={TriggerCommand=22},tag=SafariStarter] run scoreboard players set @a[tag=SafariState] TriggerCommand 22
execute as @s[scores={TriggerCommand=22},tag=SafariStarter] run clone 1595 81 -121 1595 81 -121 1595 75 -122
execute as @s[scores={TriggerCommand=22}] run scoreboard players set @s Cooldown 0
execute as @s[scores={TriggerCommand=22}] run scoreboard players set @s TriggerCommand 0


#23 - Safari Zone Confirm Maps
execute as @s[scores={TriggerCommand=23},tag=SafariStarter] run function johto:triggers/safarizone/generate
execute as @s[scores={TriggerCommand=23},tag=SafariStarter] run setblock 1595 81 -129 minecraft:redstone_block
execute as @s[scores={TriggerCommand=23},tag=SafariStarter] run scoreboard players set @e[x=-879,y=64,z=-180,dy=5,dz=10,type=armor_stand] BiomeID 0
execute as @s[scores={TriggerCommand=23},tag=SafariStarter] run tag @e[x=-792,y=65,z=-284,dy=3,type=armor_stand] add SafariActive
execute as @s[scores={TriggerCommand=23}] as @a[x=1590,y=74,z=-129,dx=10,dy=5,dz=10] run function johto:triggers/safarizone/join
execute as @s[scores={TriggerCommand=23}] run scoreboard players set @s TriggerCommand 0


#77 - Map Room Cancel
execute as @s[scores={TriggerCommand=77}] run function johto:triggers/safarizone/leave
execute as @s[scores={TriggerCommand=77}] run setblock 1595 81 -129 minecraft:redstone_block
execute as @s[scores={TriggerCommand=77}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=5,dz=10,type=armor_stand] BiomeID 0
execute as @s[scores={TriggerCommand=77}] run scoreboard players set @s Cooldown 0
execute as @s[scores={TriggerCommand=77}] run scoreboard players set @s TriggerCommand 0


#24 - Safari Zone quit button & Fly Prompt
execute as @s[scores={TriggerCommand=24..25}] run function johto:triggers/safarizone/leave
scoreboard players set @s[scores={TriggerCommand=24..25}] TriggerCommand 0


#26 - Sinjoh Ruins Abra TP out
#execute as @a[scores={TriggerCommand=26}] run scoreboard players set @s[scores={TalkTime=0}] DialogueTrigger 177
#execute as @a[scores={TriggerCommand=26}] run tag @s remove Dialogue177
#scoreboard players set @a[scores={TriggerCommand=26}] TriggerCommand 0










#Lance teleporting out from Lake of Rage
execute as @a[scores={TriggerCommand=84}] run particle cloud -159 64 590 1 1 1 1 100
execute as @a[scores={TriggerCommand=84}] run tp @e[x=-159,y=63,z=590,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=84}] run scoreboard players set @s TriggerCommand 0

#Jasmine teleports back to gym from lighthouse
execute as @a[scores={TriggerCommand=85}] run particle cloud 705 119 -40 1 1 1 0.15 100
execute as @a[scores={TriggerCommand=85}] run tp @e[x=705,y=119,z=-40,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=85}] run scoreboard players set @s TriggerCommand 0

#Cleans out Slowpoke Well before teleport out
execute as @a[scores={TriggerCommand=86}] run particle cloud 289 39 -661 1 1 1 1 100
execute as @a[scores={TriggerCommand=86}] run tp @e[x=251,y=38,z=-691,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=86}] run tp @e[x=262,y=42,z=-671,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=86}] run tp @e[x=289,y=38,z=-661,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=86}] run tp @e[x=291,y=38,z=-679,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=86}] run tp @e[x=244,y=38,z=-708,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=86}] run scoreboard players set @s TriggerCommand 0

#Runs teleport back to Kurt's
execute as @a[scores={TriggerCommand=87}] run effect give @s minecraft:blindness 3 1 true
execute as @a[scores={TriggerCommand=87}] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"366 64 -703 -30 13"}
execute as @a[scores={TriggerCommand=87}] run scoreboard players set @s click 1
execute as @a[scores={TriggerCommand=87}] run scoreboard players set @s TriggerCommand 0


#Elm's Lab tps out policeman
execute as @a[scores={TriggerCommand=88}] run particle cloud -682 64 -481 1 1 1 0.15 100
execute as @a[scores={TriggerCommand=88}] run tp @e[x=-682,y=63,z=-481,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=88}] run scoreboard players set @s TriggerCommand 0

#Rocket HQ Silver TP out
execute as @a[scores={TriggerCommand=89}] run particle cloud -82 34 182 1 1 1 1 100
execute as @a[scores={TriggerCommand=89}] run tp @e[x=-82,y=33,z=182,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=89}] run scoreboard players set @s TriggerCommand 0

#Ecruteak Silver TP out
execute as @a[scores={TriggerCommand=90}] run particle cloud 343 64 216 1 1 1 1 100
execute as @a[scores={TriggerCommand=90}] run tp @e[x=343,y=64,z=216,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=90}] run scoreboard players set @s TriggerCommand 0

#Silver Sprout Tower TP out
execute as @a[scores={TriggerCommand=91}] run tellraw @s {"text":"Silver used an Escape Rope!","italic":true,"color":"gray"}
execute as @a[scores={TriggerCommand=91}] at @e[x=57,y=103,z=29,dy=3,type=cobblemon:npc] run function johto:sound/playglobalsfx {sfx:"warpto",category:"player"}
execute as @a[scores={TriggerCommand=91}] run particle cloud 57 104 29 1 1 1 0.15 100
execute as @a[scores={TriggerCommand=91}] run tp @e[x=57,y=103,z=29,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=91}] run scoreboard players set @s TriggerCommand 0

#Silver Olivine TP out
execute as @a[scores={TriggerCommand=92}] run particle cloud 809 64 14 1 1 1 1 100
execute as @a[scores={TriggerCommand=92}] run tp @e[x=809,y=64,z=14,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=92}] run scoreboard players set @s TriggerCommand 0

#Bill tps out
execute as @a[scores={TriggerCommand=93}] run particle cloud 337 64 191 1 1 1 1 100
execute as @a[scores={TriggerCommand=93}] run tp @e[x=337,y=63,z=191,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=93}] run scoreboard players set @s TriggerCommand 0

#Cherrygrove Silver TPs out
execute as @a[scores={TriggerCommand=94}] unless entity @a[x=-300,y=64,z=-509,distance=..16,tag=Dialogue5,tag=!Dialogue7] run particle cloud -300 64 -509 1 1 1 1 100
execute as @a[scores={TriggerCommand=94}] unless entity @a[x=-300,y=64,z=-509,distance=..16,tag=Dialogue5,tag=!Dialogue7] run tp @e[x=-300,y=64,z=-509,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=94}] run scoreboard players set @s TriggerCommand 0

#Azalea Silver TPs out
execute as @a[scores={TriggerCommand=95}] unless entity @a[x=402,y=64,z=-734,distance=..16,tag=Dialogue16,tag=!Dialogue20] run particle cloud 402 64 -734 1 1 1 1 100
execute as @a[scores={TriggerCommand=95}] unless entity @a[x=402,y=64,z=-734,distance=..16,tag=Dialogue16,tag=!Dialogue20] run tp @e[x=402,y=64,z=-734,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=95}] run scoreboard players set @s TriggerCommand 0

#Goldenrod Silver TP out
execute as @a[scores={TriggerCommand=96}] unless entity @a[x=481,y=47,z=-305,distance=..16,tag=!Dialogue68] run particle cloud 481 47 -305 1 1 1 1 100
execute as @a[scores={TriggerCommand=96}] unless entity @a[x=481,y=47,z=-305,distance=..16,tag=!Dialogue68] run tp @e[x=481,y=47,z=-305,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=96}] run scoreboard players set @s TriggerCommand 0

#Burned Tower Silver TP out
execute as @a[scores={TriggerCommand=97}] unless entity @a[x=441,y=64,z=312,distance=..16,tag=!Dialogue35] run particle cloud 441 64 312 1 1 1 1 100
execute as @a[scores={TriggerCommand=97}] unless entity @a[x=441,y=64,z=312,distance=..16,tag=!Dialogue35] run tp @e[x=441,y=64,z=312,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=97}] run scoreboard players set @s TriggerCommand 0

#Victory Road Silver TP out
execute as @a[scores={TriggerCommand=98}] unless entity @a[x=-1449,y=51,z=528,distance=..16,tag=!Dialogue85] run particle cloud -1449 51 528 1 1 1 1 100
execute as @a[scores={TriggerCommand=98}] unless entity @a[x=-1449,y=51,z=528,distance=..16,tag=!Dialogue85] run tp @e[x=-1449,y=51,z=528,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=98}] run scoreboard players set @s TriggerCommand 0

#Mt. Moon Silver TP out
execute as @a[scores={TriggerCommand=99}] unless entity @a[x=-2201,y=24,z=825,distance=..16,tag=!Dialogue131] run particle cloud -2201 24 825 1 1 1 1 100
execute as @a[scores={TriggerCommand=99}] unless entity @a[x=-2201,y=24,z=825,distance=..16,tag=!Dialogue131] run tp @e[x=-2201,y=24,z=825,dy=3,type=cobblemon:npc] -800 -50000 -280
execute as @a[scores={TriggerCommand=99}] run scoreboard players set @s TriggerCommand 0


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#100-300, shopkeeper based triggers
#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Game Corner Shops

#if player lacks a Coin Case
execute as @a[scores={TriggerCommand=253..255},tag=!CoinCase] run tellraw @s {"text":"You need a Coin Case to store these coins in!","italic":true,"color":"gray"}
execute as @a[scores={TriggerCommand=253..255},tag=!CoinCase] run scoreboard players set @s TriggerCommand 0
#execute as @a[scores={TriggerCommand=253..254},tag=CoinCase] run advancement grant @s only kanto:sidequests/gamecorner

#Game Corner Coins
#50 Coins
execute as @a[scores={TriggerCommand=253,Money=..999}] run tellraw @s {"text":"You don't have enough money for that!","italic":true,"color":"gray"}
execute as @a[scores={TriggerCommand=253,Money=..999}] run scoreboard players set @s TriggerCommand 0

execute as @a[scores={TriggerCommand=253,Money=1000..}] run tellraw @s {"text":"You added the coins to your Coin Case.","italic":true,"color":"gray"}
execute as @a[scores={TriggerCommand=253,Money=1000..}] run scoreboard players add @s Coins 50
execute as @a[scores={TriggerCommand=253,Money=1000..}] run function johto:sound/playlocalsfx {sfx:"transaction"}
execute as @a[scores={TriggerCommand=253,Money=1000..}] run scoreboard players remove @s Money 1000

#250 Coins
execute as @a[scores={TriggerCommand=254,Money=..4999}] run tellraw @s {"text":"You don't have enough money for that!","italic":true,"color":"gray"}
execute as @a[scores={TriggerCommand=254,Money=..4999}] run scoreboard players set @s TriggerCommand 0

execute as @a[scores={TriggerCommand=254,Money=5000..}] run tellraw @s {"text":"You added the coins to your Coin Case.","italic":true,"color":"gray"}
execute as @a[scores={TriggerCommand=254,Money=5000..}] run scoreboard players add @s Coins 250
execute as @a[scores={TriggerCommand=254,Money=5000..}] run function johto:sound/playlocalsfx {sfx:"transaction"}
execute as @a[scores={TriggerCommand=254,Money=5000..}] run scoreboard players remove @s Money 5000


#500 Coins
execute as @a[scores={TriggerCommand=255,Money=..9999}] run tellraw @s {"text":"You don't have enough money for that!","italic":true,"color":"gray"}
execute as @a[scores={TriggerCommand=255,Money=..9999}] run scoreboard players set @s TriggerCommand 0

execute as @a[scores={TriggerCommand=255,Money=10000..}] run tellraw @s {"text":"You added the coins to your Coin Case.","italic":true,"color":"gray"}
execute as @a[scores={TriggerCommand=255,Money=10000..}] run scoreboard players add @s Coins 500
execute as @a[scores={TriggerCommand=255,Money=10000..}] run function johto:sound/playlocalsfx {sfx:"transaction"}
execute as @a[scores={TriggerCommand=255,Money=10000..}] run scoreboard players remove @s Money 10000

#-----------------------------
#280 - Purcahses an Odd Egg
execute as @a[scores={TriggerCommand=280,Money=..1499}] run tellraw @s {"text":"You don't have enough for this!","italic":true,"color":"gray"}

#Rolls a Random Number for player
execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players set @e[x=-867,y=69,z=-207,dy=4,dz=2] rng 0
execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players add @e[x=-867,y=69,z=-207,dy=4,dz=2,sort=random,limit=1] rng 1
execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players add @e[x=-867,y=69,z=-207,dy=4,dz=2,sort=random,limit=1] rng 2
execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players add @e[x=-867,y=69,z=-207,dy=4,dz=2,sort=random,limit=1] rng 4
execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players add @e[x=-867,y=69,z=-207,dy=4,dz=2,sort=random,limit=1] rng 8
execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players add @e[x=-867,y=69,z=-207,dy=4,dz=2,sort=random,limit=1] rng 16
execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players add @e[x=-867,y=69,z=-207,dy=4,dz=2,sort=random,limit=1] rng 32
execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players add @e[x=-867,y=69,z=-207,dy=4,dz=2,sort=random,limit=1] rng 64

execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players operation @s rng = @e[x=-867,y=69,z=-205,dy=3,type=armor_stand] rng

execute as @a[scores={TriggerCommand=280,Money=1500..,rng=0..9}] run pokegive elekid level=5 shiny=yes
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=10..18}] run pokegive elekid level=5 shiny=no
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=19..27}] run pokegive smoochum level=5 shiny=yes
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=28..36}] run pokegive smoochum level=5 shiny=no
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=37..45}] run pokegive igglybuff level=5 shiny=yes
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=46..54}] run pokegive igglybuff level=5 shiny=no
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=55..63}] run pokegive cleffa level=5 shiny=yes
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=64..72}] run pokegive cleffa level=5 shiny=no
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=73..81}] run pokegive tyrogue level=5 shiny=yes
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=82..90}] run pokegive tyrogue level=5 shiny=no
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=91..99}] run pokegive magby level=5 shiny=yes
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=100..108}] run pokegive magby level=5 shiny=no
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=109..117}] run pokegive @s pichu level=5 shiny=yes
execute as @a[scores={TriggerCommand=280,Money=1500..,rng=118..127}] run pokegive @s pichu level=5 shiny=no

execute as @a[scores={TriggerCommand=280,Money=1500..}] run function johto:sound/playlocalsfx {sfx:"transaction"}
execute as @a[scores={TriggerCommand=280,Money=1500..}] run scoreboard players remove @s Money 1500


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#If score is left behind, not to be used for longer store of data.
scoreboard players set @s TriggerCommand 0




#