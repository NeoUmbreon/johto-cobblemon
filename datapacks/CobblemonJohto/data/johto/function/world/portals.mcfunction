tellraw @a[tag=!InitialTags] {"text":"Initial scoreboard values required to run the map not found. TPing to spawn...","italic":true,"color":"gray"}
tp @a[tag=!InitialTags] -780 64 -245

scoreboard players set @a[x=-518,y=65,z=196,distance=..10,scores={ER=1..}] ER 0
scoreboard players set @a[x=-517,y=64,z=193,distance=..5,scores={EscapeRope=1..}] EscapeRope 0
scoreboard players set @a[x=-614,y=50,z=333,distance=..10,scores={ER=5}] ER 5

#Lobby to New Bark Town/Oak Welcome area
execute as @a[x=-958,y=66,z=-366,dy=2,dz=1,tag=!Dialogue1] at @s run function johto:tools/tpwithsfx {xyz:"-970 65 -405",sfx:"exitbuilding"}

execute as @a[x=-958,y=66,z=-366,dy=2,dz=1] at @s run function johto:tools/tpwithsfx {xyz:"-724 69 -491",sfx:"exitbuilding"}




#Goldenrod City Radio Tower Exterior
#Removes Lucky Number Show dialogue if present
tag @a[x=553,y=64,z=-345,dx=3,dy=2,tag=Dialogue25] remove Dialogue25

#Rocket Takeover Area
execute as @a[x=553,y=64,z=-345,dx=3,dy=2,tag=Dialogue64,tag=!Dialogue72] at @s run function johto:tools/tpwithsfx {xyz:"525 31 -248",sfx:"enterdoor"}

#Pre-Takeover
execute as @a[x=553,y=64,z=-345,dx=3,dy=2,tag=!Dialogue64,tag=!Dialogue72] at @s run function johto:tools/tpwithsfx {xyz:"525 31 -274",sfx:"enterdoor"}

#Post-Takeover
execute as @a[x=553,y=64,z=-345,dx=3,dy=2,tag=Dialogue72] at @s run function johto:tools/tpwithsfx {xyz:"525 31 -274",sfx:"enterdoor"}

#Return to Goldenrod
execute as @a[x=524,y=31,z=-275,dx=2,dy=2] run tag @s remove Dialogue178
execute as @a[x=524,y=31,z=-275,dx=2,dy=2] run tag @s remove Dialogue179
execute as @a[x=524,y=31,z=-275,dx=2,dy=2] run tag @s remove Dialogue180
execute as @a[x=524,y=31,z=-275,dx=2,dy=2] run tag @s remove Dialogue181
execute as @a[x=524,y=31,z=-275,dx=2,dy=2] run tag @s remove Dialogue182
execute as @a[x=524,y=31,z=-275,dx=2,dy=2] run tag @s remove Dialogue183
execute as @a[x=524,y=31,z=-275,dx=2,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"555 64 -346",sfx:"exitbuilding"}


execute as @a[x=524,y=31,z=-249,dx=2,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"555 64 -346",sfx:"exitbuilding"}



#Dragon's Den

#Pre-badge
tellraw @a[x=-654,y=64,z=331,dx=3,dy=3,tag=!Dialogue78] {"text":"Only those who have beaten Clair may enter!","italic":true,"color":"gray"}
tp @a[x=-654,y=64,z=331,dx=3,dy=3,tag=!Dialogue78] ~ ~ ~-10

execute as @a[x=-654,y=64,z=331,dx=3,dy=3,tag=Dialogue78] at @s run function johto:tools/tpwithsfx {xyz:"-665 74 629 ~180 ~",sfx:"exitbuilding"}

#Beaten Clair
execute as @a[x=-654,y=64,z=331,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-665 74 629 ~180 ~",sfx:"exitbuilding"}

execute as @a[x=-667,y=74,z=631,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-652 64 329 ~180 ~",sfx:"exitbuilding"}



#Embedded Tower
execute as @a[x=1597,y=87,z=-426,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1173 64 -237",sfx:"exitbuilding"}

#execute as @e[x=-801,y=64,z=-287,dy=3,type=armor_stand,scores={DialogueTrigger=0,TalkTime=0}] run execute at @a[x=-1174,y=64,z=-238,dx=2,dy=2] run fill -1196 63 -231 -1150 63 -186 minecraft:cyan_terracotta
#execute as @e[x=-801,y=64,z=-287,dy=3,type=armor_stand,scores={DialogueTrigger=0,TalkTime=0}] run playsound door ambient @a[x=-1174,y=64,z=-238,dx=2,dy=2] ~ ~ ~ 100 1 1
#execute as @e[x=-801,y=64,z=-287,dy=3,type=armor_stand,scores={DialogueTrigger=0,TalkTime=0}] run execute as @a[x=-1174,y=64,z=-238,dx=2,dy=2] run function johto:tools/forceclick
#execute as @e[x=-801,y=64,z=-287,dy=3,type=armor_stand,scores={DialogueTrigger=0,TalkTime=0}] run tp @a[x=-1174,y=64,z=-238,dx=2,dy=2] 1599 87 -427

execute as @a[x=-1174,y=64,z=-238,dx=2,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"1599 87 -427",sfx:"exitbuilding"}

#Ruins of Alph Main Portal

#to Fake Ruins
execute as @a[x=205,y=64,z=-145,dx=3,dy=3,tag=Dialogue168,tag=!SinnohLegend] run effect give @s minecraft:blindness 1 1
execute as @a[x=205,y=64,z=-145,dx=3,dy=3,tag=Dialogue168,tag=!SinnohLegend] at @s run function johto:tools/tpwithsfx {xyz:"-978 60 -144",sfx:"exitbuilding"}

execute as @a[x=205,y=64,z=-145,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"196 43 -126",sfx:"exitbuilding"}

#Removes any boss bars
execute as @a[x=194,y=43,z=-127,dx=3,dy=3] run bossbar remove johto:kabutoruins
execute as @a[x=194,y=43,z=-127,dx=3,dy=3] run bossbar remove johto:aerodactylruins
execute as @a[x=194,y=43,z=-127,dx=3,dy=3] run bossbar remove johto:hoohruins

#tp out
execute as @a[x=194,y=43,z=-127,dx=3,dy=3,tag=SinnohLegend] run tp @e[x=201,y=37,z=-118,dy=3,nbt=!{cobblemon:npc_chatting}] -699 86 -242
execute as @a[x=194,y=43,z=-127,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"207 64 -146",sfx:"exitbuilding"}




#Pokemon League Elite Four Entrance
tag @a[x=-1283,y=84,z=353,dx=12,dy=5] remove Will
tag @a[x=-1283,y=84,z=353,dx=12,dy=5] remove Koga
tag @a[x=-1283,y=84,z=353,dx=12,dy=5] remove Bruno
tag @a[x=-1283,y=84,z=353,dx=12,dy=5] remove Karen
tag @a[x=-1283,y=84,z=353,dx=12,dy=5] remove Lance
tag @a[x=-1283,y=84,z=353,dx=12,dy=5] remove Dialogue98

tag @a[x=-1283,y=84,z=353,dx=12,dy=5,tag=Clair,tag=Pryce,tag=Jasmine,tag=Chuck,tag=Morty,tag=Whitney,tag=Bugsy,tag=Falkner,tag=Brock,tag=Misty,tag=Surge,tag=Erika,tag=Janine,tag=Sabrina,tag=Blaine,tag=Blue,tag=!AllGyms] add AllGyms

#Non-Rematch Track
execute as @a[x=-1283,y=84,z=353,dx=12,dy=5,tag=!AllGyms] at @s run function johto:tools/tpwithsfx {xyz:"-1288 64 373",sfx:"exitbuilding"}

#Rematch Track
execute as @a[x=-1283,y=84,z=353,dx=12,dy=5,tag=AllGyms] at @s run function johto:tools/tpwithsfx {xyz:"-1341 64 373",sfx:"exitbuilding"}

execute as @a[x=-1289,y=64,z=372,dx=2,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"-1277 84 352",sfx:"exitbuilding"}

execute as @a[x=-1342,y=64,z=372,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"-1277 84 352",sfx:"exitbuilding"}



#National Park
#tellraw @a[x=466,y=64,z=63,dy=2,dz=2,scores={BugContest=1..}] ["",{"text":"You can't leave an active Bug Contest!","color":"white","italic":true}]
#tellraw @a[x=571,y=64,z=-44,dx=2,dy=2,dz=0,scores={BugContest=1..}] ["",{"text":"You can't leave an active Bug Contest!","color":"white","italic":true}]

#tp @a[x=466,y=64,z=63,dy=2,dz=2,scores={BugContest=1..}] ~5 ~ ~
execute as @a[x=466,y=64,z=63,dy=2,dz=2] at @s run function johto:tools/tpwithsfx {xyz:"430 64 -13",sfx:"exitbuilding"}

#tp @a[x=571,y=64,z=-44,dx=2,dy=2,dz=0,scores={BugContest=1..}] ~ ~ ~5
execute as @a[x=571,y=64,z=-44,dx=2,dy=2,dz=0] at @s run function johto:tools/tpwithsfx {xyz:"511 64 -77",sfx:"enterdoor"}

#Tp In
execute as @a[x=431,y=64,z=-14,dy=2,dz=2] at @s run function johto:tools/tpwithsfx {xyz:"467 64 64",sfx:"exitbuilding"}

execute as @a[x=510,y=64,z=-76,dx=2,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"572 64 -43",sfx:"exitbuilding"}



#Mt. Silver

#Moltres Room
execute as @a[x=-967,y=124,z=249,dx=4,dy=5] at @s run function johto:tools/tpwithsfx {xyz:"-976 76 341",sfx:"exitbuilding"}

execute as @a[x=-978,y=76,z=342,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-965 124 250",sfx:"exitbuilding"}


#Tells player a message based on which items they hold
#tellraw @a[x=-1026,y=86,z=349,dx=3,dy=3,scores={PalkiaCD=0},nbt={Inventory:[{id:"pixelmon:lustrous_orb"}]}] ["",{"text":"Your Lustrous Orb is reacting to the alter!","color":"white","italic":true}]
#tellraw @a[x=-1026,y=86,z=349,dx=3,dy=3,scores={GiratinaCD=0},nbt={Inventory:[{id:"pixelmon:griseous_orb"}]}] ["",{"text":"Your Griseous Orb is reacting to the alter!","color":"white","italic":true}]
#tellraw @a[x=-1026,y=86,z=349,dx=3,dy=3,scores={DialgaCD=0},nbt={Inventory:[{id:"pixelmon:adamant_orb"}]}] ["",{"text":"Your Adamant Orb is reacting to the alter!","color":"white","italic":true}]

execute as @a[x=-1026,y=86,z=349,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-944 175 196",sfx:"exitbuilding"}



execute as @a[x=-945,y=175,z=195,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1025 86 348",sfx:"exitbuilding"}



#Magnet Train Goldenrod City
execute as @a[x=526,y=72,z=-339,dy=3,tag=!MagnetPass] run tellraw @s {"text":"A Magnet Pass is required to ride on the Magnet Train!","italic":true,"color":"gray"}
execute as @a[x=526,y=72,z=-339,dy=3,tag=!MagnetPass] run tp @s ~ ~ ~6

execute as @a[x=526,y=72,z=-339,dy=3,tag=MagnetPass,scores={DialogueTrigger=0}] run tag @s remove Dialogue207
execute as @a[x=526,y=72,z=-339,dy=3,tag=MagnetPass,scores={DialogueTrigger=0}] run scoreboard players set @s DialogueTrigger 207


#Magnet Train Saffron City
execute as @a[x=-2673,y=72,z=408,dy=3,tag=!MagnetPass] run tellraw @s {"text":"A Magnet Pass is required to ride on the Magnet Train!","italic":true,"color":"gray"}
execute as @a[x=-2673,y=72,z=408,dy=3,tag=!MagnetPass] run tp @s ~ ~ ~6

execute as @a[x=-2673,y=72,z=408,dy=3,tag=MagnetPass,scores={DialogueTrigger=0}] run tag @s remove Dialogue208
execute as @a[x=-2673,y=72,z=408,dy=3,tag=MagnetPass,scores={DialogueTrigger=0}] run scoreboard players set @s DialogueTrigger 208




#Kanto Power Plant
execute as @a[x=-3260,y=64,z=570,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-3104 44 562",sfx:"enterdoor"}

execute as @a[x=-3105,y=44,z=561,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"-3259 64 569",sfx:"exitbuilding"}



#Gyms

#--------------------------------------------------
#Violet City

tag @a[x=86,y=64,z=-63,dx=4,dy=4] remove GymVictory
execute as @a[x=86,y=64,z=-63,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"-791 65 530",sfx:"enterdoor"}

execute as @a[x=-795,y=65,z=529,dx=9,dy=5] at @s run function johto:tools/tpwithsfx {xyz:"88 64 -64",sfx:"exitbuilding"}



#--------------------------------------------------
#Azalea Town
tellraw @a[x=355,y=64,z=-762,dx=4,dy=4,tag=!Dialogue16] {"text":"Bugsy is away right now! Kurt should be watching the town.","italic":true}
tp @a[x=355,y=64,z=-762,dx=4,dy=4,tag=!Dialogue16] ~ ~ ~-5

tag @a[x=355,y=64,z=-762,dx=4,dy=4,tag=Dialogue16] remove GymVictory
execute as @a[x=355,y=64,z=-762,dx=4,dy=4,tag=Dialogue16] at @s run function johto:tools/tpwithsfx {xyz:"-855 65 530",sfx:"enterdoor"}

execute as @a[x=-859,y=65,z=529,dx=9,dy=5] at @s run function johto:tools/tpwithsfx {xyz:"357 64 -763",sfx:"exitbuilding"}



#--------------------------------------------------
#Goldenrod City
tag @a[x=446,y=64,z=-312,dx=4,dy=4] remove GymVictory
execute as @a[x=446,y=64,z=-312,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"-916 65 530",sfx:"enterdoor"}

execute as @a[x=-920,y=65,z=529,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"448 64 -313",sfx:"exitbuilding"}


#--------------------------------------------------
#Ecruteak City
tag @a[x=435,y=64,z=184,dx=4,dy=3] remove GymVictory
execute as @a[x=435,y=64,z=184,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1060 65 530",sfx:"enterdoor"}

execute as @a[x=-1064,y=65,z=529,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"437 64 183",sfx:"exitbuilding"}


#--------------------------------------------------
#Cianwood City
tag @a[x=1267,y=64,z=-469,dx=4,dy=3] remove GymVictory
execute as @a[x=1267,y=64,z=-469,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1190 65 530",sfx:"enterdoor"}

execute as @a[x=-1194,y=65,z=529,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"1269 64 -470",sfx:"exitbuilding"}


#--------------------------------------------------
#Olivine City
tellraw @a[x=807,y=64,z=16,dx=4,dy=3,tag=!Dialogue42] {"text":"Jasmine is not currently in the gym!","italic":true,"color":"gray"}
tp @a[x=807,y=64,z=16,dx=4,dy=3,tag=!Dialogue42] ~ ~ ~-10

tag @a[x=807,y=64,z=16,dx=4,dy=3,tag=Dialogue42] remove GymVictory
execute as @a[x=807,y=64,z=16,dx=4,dy=3,tag=Dialogue42] at @s run function johto:tools/tpwithsfx {xyz:"-1126 65 530",sfx:"enterdoor"}

tag @a[x=807,y=64,z=16,dx=4,dy=3] remove GymVictory
execute as @a[x=807,y=64,z=16,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1126 65 530",sfx:"enterdoor"}

execute as @a[x=-1130,y=65,z=529,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"809 64 15",sfx:"exitbuilding"}


#--------------------------------------------------
#Mahogany Town

#Rocket HQ portal back to start
execute as @a[x=-80,y=53,z=162,dx=1,dy=5,dz=1] at @s run function johto:tools/tpwithsfx {xyz:"-172 54 215 -90 -25",sfx:"warpto"}

#Pre-Rocket HQ
tellraw @a[x=-128,y=64,z=155,dx=4,dy=3,dz=10,tag=!Dialogue64] {"text":"<Sightseer> Since you came this far take the time to do some sightseeing. You should check out the Lake of Rage right now."}
execute at @a[x=-128,y=64,z=161,dx=4,dy=3,tag=!Dialogue64] run tp @a[x=-128,y=64,z=161,dx=4,dy=3,tag=!Dialogue64] ~ ~ ~-5

#Post-Rocket HQ
tag @a[x=-128,y=64,z=161,dx=4,dy=3,tag=Dialogue64] remove GymVictory
execute as @a[x=-128,y=64,z=161,dx=4,dy=3,tag=Dialogue64] at @s run function johto:tools/tpwithsfx {xyz:"-789 65 642",sfx:"enterdoor"}

tag @a[x=-128,y=64,z=161,dx=4,dy=3] remove GymVictory
execute as @a[x=-128,y=64,z=161,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-789 65 642",sfx:"enterdoor"}

#Exit
execute as @a[x=-793,y=65,z=641,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-126 64 160",sfx:"exitbuilding"}


#--------------------------------------------------
#Blackthorn City

tellraw @a[x=-646,y=64,z=274,dx=4,dy=3,tag=!Dialogue72,scores={Cooldown=0}] {"text":"<Lass> I am sorry. Clair, our Gym Leader, entered the Dragon's Den behind the Gym. I have no idea when our Leader will return."}
scoreboard players add @a[x=-646,y=64,z=274,dx=4,dy=3,tag=!Dialogue72] Cooldown 25
tp @a[x=-646,y=64,z=274,dx=4,dy=3,tag=!Dialogue72] ~ ~ ~-5

tag @a[x=-646,y=64,z=274,dx=4,dy=3,tag=Dialogue72] remove GymVictory
execute as @a[x=-646,y=64,z=274,dx=4,dy=3,tag=Dialogue72] at @s run function johto:tools/tpwithsfx {xyz:"-854 65 642",sfx:"enterdoor"}

tag @a[x=-646,y=64,z=274,dx=4,dy=3] remove GymVictory
execute as @a[x=-646,y=64,z=274,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-854 65 642",sfx:"enterdoor"}


execute as @a[x=-858,y=65,z=641,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-644 64 273",sfx:"exitbuilding"}


#--------------------------------------------------
#Pewter City
tag @a[x=-1654,y=64,z=647,dx=4,dy=3] remove GymVictory
execute as @a[x=-1654,y=64,z=647,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-955 65 642",sfx:"enterdoor"}

execute as @a[x=-959,y=65,z=641,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-1651 64 646",sfx:"exitbuilding"}


#--------------------------------------------------
#Cerulean City

#Cleared Gym
tag @a[x=-2788,y=64,z=722,dx=4,dy=3,tag=!Dialogue113] remove GymVictory
tellraw @a[x=-2788,y=64,z=722,dx=4,dy=3,tag=!Dialogue113] {"text":"A sign reads: \"Since Misty's out, we'll be away too.\" - Gym Trainers","italic":true}
execute as @a[x=-2788,y=64,z=722,dx=4,dy=3,tag=!Dialogue113] at @s run function johto:tools/tpwithsfx {xyz:"-1185 65 738",sfx:"enterdoor"}

#Real Gym
tag @a[x=-2788,y=64,z=722,dx=4,dy=3,tag=Dialogue113] remove GymVictory
execute as @a[x=-2788,y=64,z=722,dx=4,dy=3,tag=Dialogue113] at @s run function johto:tools/tpwithsfx {xyz:"-1004 65 642",sfx:"enterdoor"}


#Exit
execute as @a[x=-1008,y=65,z=641,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-2786 64 721",sfx:"exitbuilding"}

execute as @a[x=-1189,y=65,z=737,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-2786 64 721",sfx:"exitbuilding"}

#--------------------------------------------------
#Vermilion City
tag @a[x=-2707,y=64,z=-83,dx=4,dy=3] remove GymVictory
execute as @a[x=-2707,y=64,z=-83,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1051 64 642",sfx:"enterdoor"}

execute as @a[x=-1055,y=64,z=641,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-2705 64 -84",sfx:"exitbuilding"}

#--------------------------------------------------
#Celadon City
tag @a[x=-2284,y=64,z=290,dx=4,dy=3] remove GymVictory
execute as @a[x=-2284,y=64,z=290,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1099 64 642",sfx:"enterdoor"}


execute as @a[x=-1102,y=64,z=641,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-2282 64 289",sfx:"exitbuilding"}



#--------------------------------------------------
#Fuchsia City
tag @a[x=-2326,y=64,z=-608,dx=4,dy=3] remove GymVictory
execute as @a[x=-2326,y=64,z=-608,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1147 64 642",sfx:"enterdoor"}

execute as @a[x=-1150,y=64,z=641,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-2324 64 -609",sfx:"exitbuilding"}

#--------------------------------------------------
#Saffron City
tag @a[x=-2815,y=64,z=409,dx=4,dy=3] remove GymVictory
execute as @a[x=-2815,y=64,z=409,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-966 64 738",sfx:"enterdoor"}

execute as @a[x=-968,y=64,z=737,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-2813 64 408",sfx:"exitbuilding"}

#--------------------------------------------------
#Cinnabar, also western Seafoam Islands entrance
tag @a[x=-2050,y=64,z=-883,dx=4,dy=3] remove GymVictory
execute as @a[x=-2050,y=64,z=-883,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-854 64 761",sfx:"enterdoor"}

execute as @a[x=-855,y=64,z=760,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2049 64 -884",sfx:"exitbuilding"}


#--------------------------------------------------
#Viridian
tellraw @a[x=-1751,y=64,z=95,dx=4,dy=3,tag=!Dialogue235] {"text":"The gym leader appears to be gone!","italic":true,"color":"gray"}
tp @a[x=-1751,y=64,z=95,dx=4,dy=3,tag=!Dialogue235] ~ ~ ~-10

tag @a[x=-1751,y=64,z=95,dx=4,dy=3] remove GymVictory
execute as @a[x=-1751,y=64,z=95,dx=4,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1131 65 738",sfx:"enterdoor"}

execute as @a[x=-1134,y=65,z=737,dx=9,dy=6] at @s run function johto:tools/tpwithsfx {xyz:"-1749 64 94",sfx:"exitbuilding"}



#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Caves


#Dark Cave (Violet Side)
scoreboard players set @a[x=-227,y=64,z=-97,dx=5,dy=4] EscapeRope 1
execute as @a[x=-227,y=64,z=-97,dx=5,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"-225 64 -86",sfx:"exitbuilding"}

scoreboard players set @a[x=-227,y=64,z=-87,dx=5,dy=5] EscapeRope 0
execute as @a[x=-227,y=64,z=-87,dx=5,dy=5] at @s run function johto:tools/tpwithsfx {xyz:"-225 64 -98",sfx:"exitbuilding"}


#Dark Cave (Blackthorn City side)
scoreboard players set @a[x=-555,y=64,z=105,dx=3,dy=3] EscapeRope 2
execute as @a[x=-555,y=64,z=105,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-400 64 116",sfx:"exitbuilding"}

scoreboard players set @a[x=-402,y=64,z=115,dx=3,dy=3] EscapeRope 0
execute as @a[x=-402,y=64,z=115,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-554 64 104",sfx:"exitbuilding"}


#Dark Cave (Route 45 Side)
scoreboard players set @a[x=-508,y=64,z=-300,dx=3,dy=3] EscapeRope 3
execute as @a[x=-508,y=64,z=-300,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-395 64 -182",sfx:"exitbuilding"}

scoreboard players set @a[x=-396,y=64,z=-183,dx=3,dy=3] EscapeRope 0
execute as @a[x=-396,y=64,z=-183,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-507 64 -301",sfx:"exitbuilding"}

#--------------------------------------------------

#Union Cave
#Route 32 Side
scoreboard players set @a[x=156,y=64,z=-615,dx=3,dy=3] EscapeRope 4
execute as @a[x=156,y=64,z=-615,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"145 44 -608",sfx:"exitbuilding"}

scoreboard players set @a[x=143,y=44,z=-609,dx=3,dy=3] EscapeRope 0
execute as @a[x=143,y=44,z=-609,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"158 64 -617",sfx:"exitbuilding"}


#Route 33 Side
scoreboard players set @a[x=128,y=64,z=-728,dx=3,dy=3] EscapeRope 5
execute as @a[x=128,y=64,z=-728,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"144 44 -733",sfx:"exitbuilding"}

scoreboard players set @a[x=142,y=44,z=-734,dx=3,dy=3] EscapeRope 0
execute as @a[x=142,y=44,z=-734,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"130 64 -730",sfx:"exitbuilding"}


#Ruins of Alph North Cave Exit
scoreboard players set @a[x=232,y=63,z=-176,dx=4,dy=4] EscapeRope 6
execute as @a[x=232,y=63,z=-176,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"206 28 -608",sfx:"exitbuilding"}

scoreboard players set @a[x=205,y=28,z=-609,dx=3,dy=3] EscapeRope 0
execute as @a[x=205,y=28,z=-609,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"234 64 -177",sfx:"exitbuilding"}


#Ruins of Alph South Cave Exit
scoreboard players set @a[x=231,y=63,z=-219,dx=3,dy=3] EscapeRope 7
execute as @a[x=231,y=63,z=-219,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"206 28 -643",sfx:"exitbuilding"}

scoreboard players set @a[x=205,y=28,z=-644,dx=3,dy=3] EscapeRope 0
execute as @a[x=205,y=28,z=-644,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"232 64 -220",sfx:"exitbuilding"}

#--------------------------------------------------

#Ilex Forest Azalea Entrance
scoreboard players set @a[x=431,y=64,z=-735,dy=2,dz=3] EscapeRope 8
execute as @a[x=431,y=64,z=-735,dy=2,dz=3] at @s run function johto:tools/tpwithsfx {xyz:"633 64 -759",sfx:"exitbuilding"}


scoreboard players set @a[x=632,y=64,z=-761,dy=2,dz=3] EscapeRope 0
execute as @a[x=632,y=64,z=-761,dy=2,dz=3] at @s run function johto:tools/tpwithsfx {xyz:"429 64 -734",sfx:"enterdoor"}


#Goldenrod Route Gate
scoreboard players set @a[x=452,y=64,z=-705,dx=3,dy=2] EscapeRope 9
execute as @a[x=452,y=64,z=-705,dx=3,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"640 64 -640",sfx:"exitbuilding"}


#tellraw @a[x=638,y=64,z=-639,dx=3,dy=2,tag=!Bugsy] {"text":"You need to beat Bugsy!","italic":true,"color":"gray"}
#tp @a[x=638,y=64,z=-639,dx=3,dy=2,tag=!Bugsy] ~ ~ ~-5

#playsound door ambient @a[x=638,y=64,z=-639,dx=3,dy=2,tag=Bugsy] ~ ~ ~ 100 1 1
#scoreboard players set @a[x=638,y=64,z=-639,dx=3,dy=2,tag=Bugsy] EscapeRope 0
#tp @a[x=638,y=64,z=-639,dx=3,dy=2,tag=Bugsy] 453 64 -704

scoreboard players set @a[x=638,y=64,z=-639,dx=3,dy=2] EscapeRope 0
execute as @a[x=638,y=64,z=-639,dx=3,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"453 64 -704",sfx:"enterdoor"}

#--------------------------------------------------

#Positions are player facing south perspective, like true game

#Whirl Islands Northwest Entrance
scoreboard players set @a[x=1080,y=64,z=-323,dx=3,dy=3] EscapeRope 10
execute as @a[x=1080,y=64,z=-323,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"1304 105 302",sfx:"exitbuilding"}


scoreboard players set @a[x=1303,y=105,z=301,dx=3,dy=3] EscapeRope 0
execute as @a[x=1303,y=105,z=301,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"1082 64 -324",sfx:"exitbuilding"}


#Whirl Islands Southwest Entrance
scoreboard players set @a[x=1080,y=64,z=-435,dx=3,dy=3] EscapeRope 11
execute as @a[x=1080,y=64,z=-435,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"1255 109 167",sfx:"exitbuilding"}


scoreboard players set @a[x=1255,y=109,z=166,dx=3,dy=3] EscapeRope 0
execute as @a[x=1255,y=109,z=166,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"1082 64 -436",sfx:"exitbuilding"}


#Whirl Islands Northeast Entrance
scoreboard players set @a[x=945,y=64,z=-334,dx=3,dy=3] EscapeRope 12
execute as @a[x=945,y=64,z=-334,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"1208 106 290",sfx:"exitbuilding"}

scoreboard players set @a[x=1207,y=106,z=289,dx=3,dy=3] EscapeRope 0
execute as @a[x=1207,y=106,z=289,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"947 64 -335",sfx:"exitbuilding"}


#Whirl Islands Southeast Entrance
scoreboard players set @a[x=945,y=64,z=-480,dx=3,dy=3] EscapeRope 13
execute as @a[x=945,y=64,z=-480,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"1166 109 151",sfx:"exitbuilding"}


scoreboard players set @a[x=1164,y=109,z=150,dx=3,dy=3] EscapeRope 0
execute as @a[x=1164,y=109,z=150,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"947 64 -481",sfx:"exitbuilding"}


#Lugia Chamber-Mid Cave connection
execute as @a[x=1226,y=31,z=165,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"1240 95 233",sfx:"exitbuilding"}

execute as @a[x=1238,y=95,z=234,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"1229 31 166",sfx:"exitbuilding"}

#--------------------------------------------------

#Mt. Mortar Ecruteak Side
scoreboard players set @a[x=190,y=64,z=207,dx=4,dy=4] EscapeRope 14
execute as @a[x=190,y=64,z=207,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"176 50 229",sfx:"exitbuilding"}

scoreboard players set @a[x=175,y=50,z=228,dx=4,dy=4] EscapeRope 0
execute as @a[x=175,y=50,z=228,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"191 64 206",sfx:"exitbuilding"}


#Mt. Mortar Middle
scoreboard players set @a[x=89,y=64,z=184,dx=4,dy=4] EscapeRope 15
execute as @a[x=89,y=64,z=184,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"102 50 230",sfx:"exitbuilding"}

scoreboard players set @a[x=101,y=50,z=229,dx=4,dy=4] EscapeRope 0
execute as @a[x=101,y=50,z=229,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"90 64 183",sfx:"exitbuilding"}


#Mt. Mortar Mahogany Side
scoreboard players set @a[x=-12,y=64,z=195,dx=4,dy=4] EscapeRope 16
execute as @a[x=-12,y=64,z=195,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"-4 50 230",sfx:"exitbuilding"}

scoreboard players set @a[x=-5,y=50,z=229,dx=4,dy=4] EscapeRope 0
execute as @a[x=-5,y=50,z=229,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"-11 64 194",sfx:"exitbuilding"}

#--------------------------------------------------

#Ice Path Mahogany End
scoreboard players set @a[x=-519,y=64,z=195,dx=3,dy=3] EscapeRope 17
execute as @a[x=-519,y=64,z=195,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-614 49 335",sfx:"exitbuilding"}

scoreboard players set @a[x=-616,y=49,z=334,dx=3,dy=3] EscapeRope 0
execute as @a[x=-616,y=49,z=334,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-517 64 194",sfx:"exitbuilding"}


#Blackthorn Side
scoreboard players set @a[x=-744,y=64,z=285,dx=3,dy=3] EscapeRope 18
execute as @a[x=-744,y=64,z=285,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-743 49 303",sfx:"exitbuilding"}


scoreboard players set @a[x=-744,y=49,z=302,dx=3,dy=3] EscapeRope 0
execute as @a[x=-744,y=49,z=302,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-743 64 284",sfx:"exitbuilding"}

#--------------------------------------------------

#Victory Road Gate Entrance

#Gym Badge check:
tag @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=Falkner,tag=Bugsy,tag=Whitney,tag=Morty,tag=Chuck,tag=Jasmine,tag=Pryce,tag=Clair] add JohtoBadges

tellraw @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!JohtoBadges] {"text":"You still need to beat the following Gym Leaders:","italic":true,"color":"gray"}
tellraw @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!Falkner] {"text":"Falkner","italic":true,"color":"gray"}
tellraw @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!Bugsy] {"text":"Bugsy","italic":true,"color":"gray"}
tellraw @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!Whitney] {"text":"Whitney","italic":true,"color":"gray"}
tellraw @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!Morty] {"text":"Morty","italic":true,"color":"gray"}
tellraw @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!Chuck] {"text":"Chuck","italic":true,"color":"gray"}
tellraw @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!Jasmine] {"text":"Jasmine","italic":true,"color":"gray"}
tellraw @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!Pryce] {"text":"Pryce","italic":true,"color":"gray"}
tellraw @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!Clair] {"text":"Clair","italic":true,"color":"gray"}
tp @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=!JohtoBadges] ~ ~ ~-7

scoreboard players set @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=JohtoBadges] EscapeRope 19
execute as @a[x=-1260,y=64,z=118,dx=3,dy=3,tag=JohtoBadges] at @s run function johto:tools/tpwithsfx {xyz:"-1432 19 377",sfx:"exitbuilding"}

scoreboard players set @a[x=-1260,y=64,z=118,dx=3,dy=3] EscapeRope 19
execute as @a[x=-1260,y=64,z=118,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1432 19 377",sfx:"exitbuilding"}

scoreboard players set @a[x=-1434,y=19,z=376,dx=3,dy=3] EscapeRope 0
execute as @a[x=-1434,y=19,z=376,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1258 64 117",sfx:"exitbuilding"}



#Pokemon League Side
scoreboard players set @a[x=-1328,y=64,z=115,dx=3,dy=3] EscapeRope 20
execute as @a[x=-1328,y=64,z=115,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1448 51 533 ~180 ~0",sfx:"exitbuilding"}


#Before Silver is defeated
#tellraw @a[x=-1450,y=51,z=534,dx=3,dy=3,tag=!Dialogue85] ["",{"text":"<"},{"text":"Silver","color":"red"},{"text":"> Come on, "},{"selector":"@p[x=-1450,y=51,z=534,dx=3,dy=3,tag=!Dialogue85]"},{"text":"! Let's battle!"}]
#tp @a[x=-1450,y=51,z=534,dx=3,dy=3,tag=!Dialogue85] ~ ~ ~-5

scoreboard players set @a[x=-1450,y=51,z=534,dx=3,dy=3] EscapeRope 0
execute as @a[x=-1450,y=51,z=534,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1326 64 114 ~180 ~0",sfx:"exitbuilding"}

#--------------------------------------------------

#Seafoam Islands Left Island (turned into Blaine's Gym cave)
#playsound door ambient @a[x=-2050,y=64,z=-883,dx=3,dy=3] ~ ~ ~ 100 1 1
#scoreboard players set @a[x=-2050,y=64,z=-883,dx=3,dy=3] EscapeRope 21
#tp @a[x=-2050,y=64,z=-883,dx=3,dy=3] -2048 51 -878

scoreboard players set @a[x=-2050,y=51,z=-879,dx=3,dy=3] EscapeRope 0
execute as @a[x=-2050,y=51,z=-879,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-860 64 771 0 9",sfx:"exitbuilding"}


#Seafoam Islands Right Island
scoreboard players set @a[x=-2109,y=64,z=-913,dx=3,dy=3] EscapeRope 22
execute as @a[x=-2109,y=64,z=-913,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2109 51 -878",sfx:"exitbuilding"}

scoreboard players set @a[x=-2110,y=51,z=-879,dx=3,dy=3] EscapeRope 0
execute as @a[x=-2110,y=51,z=-879,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2108 64 -914",sfx:"exitbuilding"}

#--------------------------------------------------

#Diglett Cave Vermilion City

#Snorlax blocking the path
execute as @a[x=-2903,y=64,z=-45,dx=3,dy=3,tag=!Dialogue142] run tellraw @s {"text":"A sleeping Snorlax is blocking your path.","italic":true,"color":"gray"}
execute as @a[x=-2903,y=64,z=-45,dx=3,dy=3,tag=!Dialogue142] at @s run tp @s ~ ~ ~-7

scoreboard players set @a[x=-2903,y=64,z=-45,dx=3,dy=3] EscapeRope 23
execute as @a[x=-2903,y=64,z=-45,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-3050 59 87",sfx:"exitbuilding"}


scoreboard players set @a[x=-3051,y=59,z=86,dx=3,dy=4] EscapeRope 0
execute as @a[x=-3051,y=59,z=86,dx=3,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"-2901 64 -46",sfx:"exitbuilding"}


#Pewter City Side
scoreboard players set @a[x=-1720,y=64,z=477,dx=3,dy=3] EscapeRope 24
execute as @a[x=-1720,y=64,z=477,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2988 59 189",sfx:"exitbuilding"}


scoreboard players set @a[x=-2989,y=59,z=188,dx=3,dy=3] EscapeRope 0
execute as @a[x=-2989,y=59,z=188,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-1718 64 476",sfx:"exitbuilding"}

#--------------------------------------------------

#Mt. Moon Pewter City Side
scoreboard players set @a[x=-2201,y=64,z=750,dx=3,dy=3] EscapeRope 25
execute as @a[x=-2201,y=64,z=750,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2188 24 820",sfx:"exitbuilding"}

scoreboard players set @a[x=-2189,y=24,z=819,dx=3,dy=3] EscapeRope 0
execute as @a[x=-2189,y=24,z=819,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2200 64 749",sfx:"exitbuilding"}


#Mt. Moon Cerulean City Side
scoreboard players set @a[x=-2264,y=64,z=750,dx=3,dy=3] EscapeRope 26
execute as @a[x=-2264,y=64,z=750,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2247 24 774",sfx:"exitbuilding"}

scoreboard players set @a[x=-2249,y=24,z=773,dx=3,dy=3] EscapeRope 0
execute as @a[x=-2249,y=24,z=773,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2263 64 749",sfx:"exitbuilding"}

#Mt. Moon Square
#North Gate
execute as @a[x=-2403,y=60,z=878,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2230 40 815",sfx:"exitbuilding"}

execute as @a[x=-2232,y=40,z=814,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2401 60 877",sfx:"exitbuilding"}

#South Gate
execute as @a[x=-2417,y=60,z=847,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2247 40 790",sfx:"exitbuilding"}

execute as @a[x=-2249,y=40,z=789,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-2415 60 846",sfx:"exitbuilding"}

#--------------------------------------------------

#Rock Tunnel Power Plant Side
scoreboard players set @a[x=-3265,y=64,z=681,dx=3,dy=3] EscapeRope 27
execute as @a[x=-3265,y=64,z=681,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-3264 49 685 180 ~",sfx:"exitbuilding"}

scoreboard players set @a[x=-3265,y=49,z=686,dx=3,dy=3] EscapeRope 0
execute as @a[x=-3265,y=49,z=686,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-3264 64 680 180 ~",sfx:"exitbuilding"}


#Lavendar Town Side
scoreboard players set @a[x=-3270,y=64,z=495,dx=3,dy=3] EscapeRope 28
execute as @a[x=-3270,y=64,z=495,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-3269 49 543",sfx:"exitbuilding"}

scoreboard players set @a[x=-3270,y=49,z=542,dx=3,dy=3] EscapeRope 0
execute as @a[x=-3270,y=49,z=542,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"-3269 64 494",sfx:"exitbuilding"}

#--------------------------------------------------

#Hall of Fame Statue Hall Room
tp @a[x=-1289,y=84,z=341,dy=4,dz=5] -1029 65.06 -339 ~-90 ~

execute as @a[x=-1032,y=65,z=-342,dx=4,dy=4] at @s run function johto:tools/tpwithsfx {xyz:"-1286 84 343 ~90 ~",sfx:"exitbuilding"}


#Ruins of Alph Aerodactyl Chamber
tp @a[x=182,y=63,z=-251,dx=3,dy=3] 184.5 50 -148 ~0 ~0

execute as @a[x=182,y=64,z=-251,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"184 50 -147",sfx:"exitbuilding"}

#Aerodactyl Room Exit

#execute as @a[x=179,y=49,z=-149,dx=11,dy=5,dz=16] run tag @e[x=-867,y=69,z=-212,dy=3,type=armor_stand] add Skip
execute as @e[x=-867,y=69,z=-212,dy=3,type=armor_stand,tag=!Skip] run bossbar remove johto:aerodactylruins

execute as @a[x=183,y=49,z=-150,dx=3,dy=3] run bossbar remove johto:aerodactylruins

execute as @a[x=183,y=49,z=-150,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"183 64 -252",sfx:"exitbuilding"}



#Ruins Kabuto Chamber
execute as @a[x=189,y=53,z=-111,dx=3,dy=3] run bossbar remove johto:kabutoruins
execute as @a[x=189,y=53,z=-111,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"191 64 -113",sfx:"exitbuilding"}



#execute as @a[x=185,y=52,z=-110,dx=11,dy=5,dz=16] run tag @e[x=-867,y=69,z=-210,dy=3,type=armor_stand] add Skip
#execute as @e[x=-867,y=69,z=-210,dy=3,type=armor_stand,tag=!Skip] run bossbar remove johto:kabutoruins

execute as @a[x=189,y=64,z=-112,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"191 53 -110",sfx:"exitbuilding"}



#Ruins Four Loot Chamber
execute as @a[x=251,y=63,z=-229,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"202 51 -157 ~0 ~0",sfx:"exitbuilding"}

execute as @a[x=200,y=51,z=-159,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"253 64 -230",sfx:"exitbuilding"}



#Ruins Ho-Oh Chamber
execute as @a[x=207,y=49,z=-135,dx=3,dy=3] run bossbar remove johto:hoohruins
execute as @a[x=207,y=49,z=-135,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"254 64 -166 ~0 ~0",sfx:"exitbuilding"}

#execute as @a[x=203,y=50,z=-134,dx=11,dy=5,dz=16] run tag @e[x=-867,y=69,z=-214,dy=3,type=armor_stand] add Skip
#execute as @e[x=-867,y=69,z=-214,dy=3,type=armor_stand,tag=!Skip] run bossbar remove johto:hoohruins

execute as @a[x=253,y=63,z=-165,dx=3,dy=3] at @s run function johto:tools/tpwithsfx {xyz:"209 50 -133",sfx:"exitbuilding"}



#Ruins North Gate
execute as @a[x=224,y=64,z=-101,dx=2,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"262 64 -63",sfx:"enterdoor"}

execute as @a[x=261,y=64,z=-64,dx=2,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"225 64 -102",sfx:"exitbuilding"}





#Battle Tower Observation Deck Right
execute as @a[x=881,y=104,z=80,dx=2,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"891 64 78",sfx:"exitbuilding"}

execute as @a[x=890,y=64,z=79,dx=1,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"882 104 82",sfx:"exitbuilding"}



#Battle Tower Observation Left
execute as @a[x=922,y=104,z=80,dx=2,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"915 64 78",sfx:"exitbuilding"}

execute as @a[x=914,y=64,z=79,dx=1,dy=2] at @s run function johto:tools/tpwithsfx {xyz:"923 104 82",sfx:"exitbuilding"}
