#Spawns/despawns/runs things in the world that are new between minor versions.

#1.3.0 to 1.3.1
execute positioned 371 64 -698 if entity @a[distance=..50] unless entity @e[x=371,y=64,z=-698,dy=3,type=interaction] run function johto:spawn/npcboxes

scoreboard objectives add TownMapLast dummy
scoreboard objectives setdisplay sidebar.team.green
scoreboard objectives setdisplay sidebar.team.blue

scoreboard objectives add MusicLoop dummy
scoreboard objectives add SurfingCD dummy
scoreboard objectives add RadioSelectTemp dummy

scoreboard objectives add SlotTimer1 dummy
scoreboard objectives add SlotTimer2 dummy
scoreboard objectives add SlotTimer3 dummy
scoreboard objectives add SlotTimer4 dummy
scoreboard objectives add SlotTimer5 dummy
scoreboard objectives add SlotTimer6 dummy
scoreboard objectives add SlotTimer7 dummy
scoreboard objectives add SlotTimer8 dummy
scoreboard objectives add SlotTimer9 dummy
scoreboard objectives add SlotTimer10 dummy
scoreboard objectives add SlotTimer11 dummy
scoreboard objectives add SlotTimer12 dummy

scoreboard objectives add SlotRNG1 dummy
scoreboard objectives add SlotRNG2 dummy
scoreboard objectives add SlotRNG3 dummy
scoreboard objectives add SlotRNG4 dummy
scoreboard objectives add SlotRNG5 dummy
scoreboard objectives add SlotRNG6 dummy
scoreboard objectives add SlotRNG7 dummy
scoreboard objectives add SlotRNG8 dummy
scoreboard objectives add SlotRNG9 dummy
scoreboard objectives add SlotRNG10 dummy
scoreboard objectives add SlotRNG11 dummy
scoreboard objectives add SlotRNG12 dummy

#
