# Prevent rerunning this
scoreboard players add #firstrun click 1

# Stage 2 (entity target selectors)
#-------------------------------------
# Remove Clear Weather and Whiteout from the lobby
execute if score #firstrun click matches 2 run function johto:load/removelobbytoggles

# Battle Tower renovation
execute if score #firstrun click matches 2 run kill @e[x=894,y=100,z=56,dx=17,dy=3,dz=22,type=cobblemon:npc]
execute if score #firstrun click matches 2 run forceload remove 875 50 930 108

# Clair interaction boxes
execute if score #firstrun click matches 2 positioned -856 65 720 run function johto:spawn/npcboxes
execute if score #firstrun click matches 2 run forceload remove -856 720

# Done
execute if score #firstrun click matches 2 run return 1
#-------------------------------------

# Battle Tower renovation
forceload add 875 50 930 108
place template johto:battletower 875 63 50
place template johto:battlesalon 890 43 66
npcspawnat 903 45 72 battlesalon_clerk
npcspawnat 901 45 77 buck_salon
npcspawnat 893 45.5 77 marley_salon
npcspawnat 912 45.5 77 cheryl_salon
npcspawnat 895 45.5 73 mira_salon
npcspawnat 910 45.5 75 riley_salon

# Remove Clear Weather and Whiteout from the lobby
forceload add -968 -360 -970 -345

# Whiteout enabled by default
execute as @e[x=-792,y=65,z=-284,dy=3,tag=WhiteoutDisable] run function johto:tools/togglewhiteout

# Summon 4 Miltank on the ranch
execute positioned 792 64 202 rotated 0 0 run function johto:load/spawnmiltank
execute positioned 748 64 216 rotated 90 0 run function johto:load/spawnmiltank
execute positioned 788 64 219 rotated 180 0 run function johto:load/spawnmiltank
execute positioned 774 64 207 rotated 270 0 run function johto:load/spawnmiltank

# Clair interaction boxes
forceload add -856 720

# Auto-battle scoreboard objectives
scoreboard objectives add TrainerUID dummy
scoreboard objectives add ActiveTrainer dummy
scoreboard objectives add BattleCD dummy

# Music scoreboard objectives
scoreboard objectives add RadioSelectTemp dummy
scoreboard objectives add DialogueMusic dummy
scoreboard objectives add MusicLoop dummy

# Surfing scoreboard objective
scoreboard objectives add SurfingCD dummy

# Game Corner scoreboard objectives
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