#Button Orders
#FLoor 6 (Evolution Items)
#Floor 5 (TM Corner)
#Floor 4 (Medicine Box)
#Floor 3 (Battle Collection)
#Floor 2 (Trainer Market)
#Floor 1 (Service Counter)

#execute as @a[x=438,y=63,z=-395,dx=3,dy=34,dz=3] run function johto:world/departmentelevator

#x=438,y=63,z=-395,dx=3,dy=34,dz=3

#/setblock 433 64 -395 minecraft:redstone_block


#TPs
#Floor 1
execute if block 438 66 -395 stone_button[powered=true] run execute as @a[x=438,y=63,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~30 ~0
execute if block 438 66 -394 stone_button[powered=true] run execute as @a[x=438,y=63,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~24 ~0
execute if block 438 65 -395 stone_button[powered=true] run execute as @a[x=438,y=63,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~18 ~0
execute if block 438 65 -394 stone_button[powered=true] run execute as @a[x=438,y=63,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~12 ~0
execute if block 438 64 -395 stone_button[powered=true] run execute as @a[x=438,y=63,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~6 ~0
execute if block 438 64 -394 stone_button[powered=true] run tellraw @a[x=438,y=63,z=-395,dx=3,dy=4,dz=3] {"text":"You are already on that floor!","italic":true,"color":"gray"}

#Floor 2
execute if block 438 72 -395 stone_button[powered=true] run execute as @a[x=438,y=69,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~24 ~0
execute if block 438 72 -394 stone_button[powered=true] run execute as @a[x=438,y=69,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~18 ~0
execute if block 438 71 -395 stone_button[powered=true] run execute as @a[x=438,y=69,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~12 ~0
execute if block 438 71 -394 stone_button[powered=true] run execute as @a[x=438,y=69,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~6 ~0
execute if block 438 70 -395 stone_button[powered=true] run tellraw @a[x=438,y=69,z=-395,dx=3,dy=4,dz=3] {"text":"You are already on that floor!","italic":true,"color":"gray"}
execute if block 438 70 -394 stone_button[powered=true] run execute as @a[x=438,y=69,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-6 ~0

#Floor 3
execute if block 438 78 -395 stone_button[powered=true] run execute as @a[x=438,y=75,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~18 ~0
execute if block 438 78 -394 stone_button[powered=true] run execute as @a[x=438,y=75,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~12 ~0
execute if block 438 77 -395 stone_button[powered=true] run execute as @a[x=438,y=75,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~6 ~0
execute if block 438 77 -394 stone_button[powered=true] run tellraw @a[x=438,y=75,z=-395,dx=3,dy=4,dz=3] {"text":"You are already on that floor!","italic":true,"color":"gray"}
execute if block 438 76 -395 stone_button[powered=true] run execute as @a[x=438,y=75,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-6 ~0
execute if block 438 76 -394 stone_button[powered=true] run execute as @a[x=438,y=75,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-12 ~0

#Floor 4
execute if block 438 84 -395 stone_button[powered=true] run execute as @a[x=438,y=81,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~12 ~0
execute if block 438 84 -394 stone_button[powered=true] run execute as @a[x=438,y=81,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~6 ~0
execute if block 438 83 -395 stone_button[powered=true] run tellraw @a[x=438,y=81,z=-395,dx=3,dy=4,dz=3] {"text":"You are already on that floor!","italic":true,"color":"gray"}
execute if block 438 83 -394 stone_button[powered=true] run execute as @a[x=438,y=81,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-6 ~0
execute if block 438 82 -395 stone_button[powered=true] run execute as @a[x=438,y=81,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-12 ~0
execute if block 438 82 -394 stone_button[powered=true] run execute as @a[x=438,y=81,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-18 ~0

#Floor 5
execute if block 438 90 -395 stone_button[powered=true] run execute as @a[x=438,y=87,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~6 ~0
execute if block 438 90 -394 stone_button[powered=true] run tellraw @a[x=438,y=87,z=-395,dx=3,dy=4,dz=3] {"text":"You are already on that floor!","italic":true,"color":"gray"}
execute if block 438 89 -395 stone_button[powered=true] run execute as @a[x=438,y=87,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-6 ~0
execute if block 438 89 -394 stone_button[powered=true] run execute as @a[x=438,y=87,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-12 ~0
execute if block 438 88 -395 stone_button[powered=true] run execute as @a[x=438,y=87,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-18 ~0
execute if block 438 88 -394 stone_button[powered=true] run execute as @a[x=438,y=87,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-24 ~0

#Floor 6
execute if block 438 96 -395 stone_button[powered=true] run tellraw @a[x=438,y=93,z=-395,dx=3,dy=4,dz=3] {"text":"You are already on that floor!","italic":true,"color":"gray"}
execute if block 438 96 -394 stone_button[powered=true] run execute as @a[x=438,y=93,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-6 ~0
execute if block 438 95 -395 stone_button[powered=true] run execute as @a[x=438,y=93,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-12 ~0
execute if block 438 95 -394 stone_button[powered=true] run execute as @a[x=438,y=93,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-18 ~0
execute if block 438 94 -395 stone_button[powered=true] run execute as @a[x=438,y=93,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-24 ~0
execute if block 438 94 -394 stone_button[powered=true] run execute as @a[x=438,y=93,z=-395,dx=3,dy=4,dz=3] at @s run tp @s ~0 ~-30 ~0




#Plays sound
#TODO: i would like these to be louder... (ideally 1.5 range) but then i would have to pass a "volume" key
#To Floor 1
execute positioned 438 64 -394 if predicate {"condition":"any_of","terms":[{"condition":"location_check","offsetY":6,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":12,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":18,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":24,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":30,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}}]} if entity @a[x=438,y=63,z=-395,dx=3,dy=4,dz=3] positioned 440.0 67.0 -393.0 run function johto:sound/playglobalsfx {sfx:"elevatorend",category:"block"}
#To Floor 2
execute positioned 438 64 -395 if predicate {"condition":"any_of","terms":[{"condition":"location_check","offsetY":0,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":12,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":18,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":24,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":30,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}}]} if entity @a[x=438,y=69,z=-395,dx=3,dy=4,dz=3] positioned 440.0 73.0 -393.0 run function johto:sound/playglobalsfx {sfx:"elevatorend",category:"block"}
#To Floor 3
execute positioned 438 65 -394 if predicate {"condition":"any_of","terms":[{"condition":"location_check","offsetY":0,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":6,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":18,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":24,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":30,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}}]} if entity @a[x=438,y=75,z=-395,dx=3,dy=4,dz=3] positioned 440.0 79.0 -393.0 run function johto:sound/playglobalsfx {sfx:"elevatorend",category:"block"}
#To Floor 4
execute positioned 438 65 -395 if predicate {"condition":"any_of","terms":[{"condition":"location_check","offsetY":0,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":6,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":12,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":24,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":30,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}}]} if entity @a[x=438,y=81,z=-395,dx=3,dy=4,dz=3] positioned 440.0 85.0 -393.0 run function johto:sound/playglobalsfx {sfx:"elevatorend",category:"block"}
#To Floor 5
execute positioned 438 66 -394 if predicate {"condition":"any_of","terms":[{"condition":"location_check","offsetY":0,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":6,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":12,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":18,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":30,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}}]} if entity @a[x=438,y=87,z=-395,dx=3,dy=4,dz=3] positioned 440.0 91.0 -393.0 run function johto:sound/playglobalsfx {sfx:"elevatorend",category:"block"}
#To Floor 6
execute positioned 438 66 -395 if predicate {"condition":"any_of","terms":[{"condition":"location_check","offsetY":0,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":6,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":12,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":18,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}},{"condition":"location_check","offsetY":24,"predicate":{"block":{"blocks":"stone_button","state":{"powered":"true"}}}}]} if entity @a[x=438,y=93,z=-395,dx=3,dy=4,dz=3] positioned 440.0 97.0 -393.0 run function johto:sound/playglobalsfx {sfx:"elevatorend",category:"block"}
#Floor 1 Fail
execute if block 438 64 -394 stone_button[powered=true] run playsound minecraft:block.anvil.land block @a[x=438,y=63,z=-395,dx=3,dy=4,dz=3] ~ ~ ~ 1 1 1
#Floor 2 Fail
execute if block 438 70 -395 stone_button[powered=true] run playsound minecraft:block.anvil.land block @a[x=438,y=69,z=-395,dx=3,dy=4,dz=3] ~ ~ ~ 1 1 1
#Floor 3 Fail
execute if block 438 77 -394 stone_button[powered=true] run playsound minecraft:block.anvil.land block @a[x=438,y=75,z=-395,dx=3,dy=4,dz=3] ~ ~ ~ 1 1 1
#Floor 4 Fail
execute if block 438 83 -395 stone_button[powered=true] run playsound minecraft:block.anvil.land block @a[x=438,y=81,z=-395,dx=3,dy=4,dz=3] ~ ~ ~ 1 1 1
#Floor 5 Fail
execute if block 438 90 -394 stone_button[powered=true] run playsound minecraft:block.anvil.land block @a[x=438,y=87,z=-395,dx=3,dy=4,dz=3] ~ ~ ~ 1 1 1
#Floor 6 Fail
execute if block 438 96 -395 stone_button[powered=true] run playsound minecraft:block.anvil.land block @a[x=438,y=93,z=-395,dx=3,dy=4,dz=3] ~ ~ ~ 1 1 1






#Reverts buttons to unpowered to not repeat
fill 438 64 -394 438 96 -395 stone_button[powered=false,facing=east] replace stone_button[powered=true]














#
