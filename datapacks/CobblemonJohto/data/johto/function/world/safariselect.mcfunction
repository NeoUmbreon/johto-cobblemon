#function custom:safariselect if @a[x=1590,y=74,z=-129,dx=10,dy=5,dz=20]
#

#North
#1    4    5
#2    3    6
#South (Safari Gate)

#Biome ID Numbers

#1 - Desert
#2 - Marshland
#3 - Peak
#4 - Plains
#5 - Forest
#6 - Meadow
#7 - Mountain
#8 - Rocky Beach
#9 - Swamp
#10 - Wetland
#11 - Savannah
#12 - Wasteland


#Item Frame Zone Reference Armor Stands
#1 - @e[x=-879,y=64,z=-170,dy=3,type=armor_stand]
#2 - @e[x=-879,y=64,z=-172,dy=3,type=armor_stand]
#3 - @e[x=-879,y=64,z=-174,dy=3,type=armor_stand]
#4 - @e[x=-879,y=64,z=-176,dy=3,type=armor_stand]
#5 - @e[x=-879,y=64,z=-178,dy=3,type=armor_stand]
#6 - @e[x=-879,y=64,z=-180,dy=3,type=armor_stand]



#Custom biomes for Cobblemon spawn conditions
#1 - minecraft:desert
#2 - minecraft:mangrove_swamp
#3 - minecraft:jagged_peaks
#4 - minecraft:plains
#5 - minecraft:forest
#6 - minecraft:sunflower_plains
#7 - minecraft:windswept_hills
#8 - minecraft:stony_shore
#9 - minecraft:swamp
#10 - minecraft:river
#11 - minecraft:savanna
#12 - minecraft:badlands




#------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#Mirrors the scores of the item frames to the reference armor stands to execute during dialogue

#execute as @e[x=210,y=53,z=-120,dz=2,nbt={Item:{components:{"minecraft:map_id":37}}}] run scoreboard players add @e[x=-867,y=69,z=-214,dy=3,type=armor_stand] PuzzleTrack 1

#Zone 1
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":238}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 1
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":240}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 2
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":243}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 3
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":244}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 4
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":239}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 5
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":241}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 6
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":242}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 7
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":245}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 8
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":247}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 9
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":249}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 10
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":246}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 11
execute if entity @e[x=1596,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":248}}}] run scoreboard players set @e[x=-879,y=64,z=-170,dy=3,type=armor_stand] BiomeID 12


#Zone 2
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":238}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 1
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":240}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 2
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":243}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 3
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":244}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 4
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":239}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 5
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":241}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 6
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":242}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 7
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":245}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 8
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":247}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 9
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":249}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 10
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":246}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 11
execute if entity @e[x=1596,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":248}}}] run scoreboard players set @e[x=-879,y=64,z=-172,dy=3,type=armor_stand] BiomeID 12


#Zone 3
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":238}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 1
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":240}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 2
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":243}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 3
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":244}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 4
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":239}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 5
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":241}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 6
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":242}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 7
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":245}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 8
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":247}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 9
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":249}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 10
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":246}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 11
execute if entity @e[x=1595,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":248}}}] run scoreboard players set @e[x=-879,y=64,z=-174,dy=3,type=armor_stand] BiomeID 12


#Zone 4
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":238}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 1
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":240}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 2
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":243}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 3
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":244}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 4
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":239}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 5
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":241}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 6
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":242}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 7
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":245}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 8
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":247}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 9
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":249}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 10
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":246}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 11
execute if entity @e[x=1595,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":248}}}] run scoreboard players set @e[x=-879,y=64,z=-176,dy=3,type=armor_stand] BiomeID 12


#Zone 5
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":238}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 1
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":240}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 2
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":243}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 3
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":244}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 4
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":239}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 5
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":241}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 6
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":242}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 7
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":245}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 8
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":247}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 9
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":249}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 10
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":246}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 11
execute if entity @e[x=1594,y=77,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":248}}}] run scoreboard players set @e[x=-879,y=64,z=-178,dy=3,type=armor_stand] BiomeID 12


#Zone 6
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":238}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 1
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":240}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 2
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":243}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 3
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":244}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 4
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":239}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 5
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":241}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 6
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":242}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 7
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":245}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 8
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":247}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 9
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":249}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 10
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":246}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 11
execute if entity @e[x=1594,y=76,z=-122,dz=2,type=minecraft:item_frame,nbt={Item:{components:{"minecraft:map_id":248}}}] run scoreboard players set @e[x=-879,y=64,z=-180,dy=3,type=armor_stand] BiomeID 12



#When a number is assigned to all armor stands, prompt player to begin Safari
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=1..}] run scoreboard players enable @a[tag=SafariStarter,scores={Cooldown=0}] TriggerCommand
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=1..}] run tellraw @a[tag=SafariStarter,scores={Cooldown=0}] ["",{"text":"It looks like your biomes are chosen. Begin session?","color":"white"}]
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=1..}] run tellraw @a[tag=SafariStarter,scores={Cooldown=0}] ["",{"text":"[Yes]","color":"green","clickEvent":{"action":"run_command","value":"/trigger TriggerCommand set 23"}}]
execute if entity @e[x=-879,y=64,z=-170,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-172,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-174,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-176,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-178,dy=3,type=armor_stand,scores={BiomeID=1..}] if entity @e[x=-879,y=64,z=-180,dy=3,type=armor_stand,scores={BiomeID=1..}] run scoreboard players set @a[tag=SafariStarter,scores={Cooldown=0}] Cooldown 45








#
