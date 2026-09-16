# Prevent rerunning this
execute if score #firstrun click matches 2.. run return fail
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

# Summon Moomoo in the paddock
execute positioned 804.0 64 271.0 rotated 180 0 run function johto:load/spawnmiltank
execute positioned 804.0 64 271.0 run summon interaction ~ ~ ~ {width:1,height:1.5,response:1b,Tags:[NPCs]}

# Goldenrod Dept. Store Daily Drawing Corner
fill 434 94 -404 432 97 -407 air
fill 432 95 -403 435 94 -403 white_stained_glass_pane
fill 432 95 -409 435 94 -409 white_stained_glass_pane
fill 435 94 -409 435 95 -403 white_stained_glass_pane
fill 432 95 -403 435 95 -409 lime_carpet replace white_stained_glass_pane
npcspawnat 434 94 -407 goldenrod_lotteryclerk

# Clair interaction boxes
forceload add -856 720

# New Shopkeepers
npcspawnat -2302 77 373 celadon_tmshop
npcspawnat 462 88 -403 goldenrod_tmshop

# New NPCs
npcspawnat 482 64 -267 goldenrod_engineer
npcspawnat -72 64 734 lake_artist
npcspawnat 505 43 -246 radiotower_takeover_beauty
npcspawnat 505 43 -272 radiotower_beauty
npcspawnat 454 88 -417 goldenrod_lass6
npcspawnat -2802 64 291 saffron_mrpsychic
npcspawnat -1096 64 59 route28_lass
npcspawnat -958 64 -507 route27_oldlady
npcspawnat 805 64 271.0 moomoofarm_twin1
npcspawnat 802 64 271.0 moomoofarm_twin2
npcspawnat 781 64 279 moomoofarm_woman
npcspawnat -211 64 192 mahogany_ragecandybarman
npcspawnat -2792 58 347 saffron_ragecandybarmaniac

# New TM Loot
execute positioned -1091 64 -546 run function johto:spawn/itemloot
execute positioned 188 64 -537 run function johto:spawn/itemloot
execute positioned 432 57 328 run function johto:spawn/itemloot
execute positioned -2054 21 -876 run function johto:spawn/itemloot
execute positioned 253 29 -677 run function johto:spawn/itemloot
execute positioned -2647 75 859 run function johto:spawn/itemloot
execute positioned -1429 39 478 run function johto:spawn/itemloot
execute positioned 608 64 -29 run function johto:spawn/itemloot
execute positioned -1166 64 56 run function johto:spawn/itemloot
execute positioned 210 28 -662 run function johto:spawn/itemloot
execute positioned 77 79 445 run function johto:spawn/itemloot
execute positioned -2980 64 343 run function johto:spawn/itemloot
execute positioned -232 64 733 run function johto:spawn/itemloot
execute positioned -163 45 185 run function johto:spawn/itemloot
execute positioned -136 34 204 run function johto:spawn/itemloot
execute positioned -316 64 12 run function johto:spawn/itemloot
execute positioned -2408 64 -683 run function johto:spawn/itemloot
execute positioned -3199 49 575 run function johto:spawn/itemloot
execute positioned 687 64 -11 run function johto:spawn/itemloot
execute positioned 791 64 171 run function johto:spawn/itemloot
execute positioned -2703 64 92 run function johto:spawn/itemloot
execute positioned 444 64 -525 run function johto:spawn/itemloot
execute positioned -10 64 162 run function johto:spawn/itemloot
execute positioned 431 64 -222 run function johto:spawn/itemloot
execute positioned -2491 64 391 run function johto:spawn/itemloot
execute positioned -3273 64 445 run function johto:spawn/itemloot
execute positioned -807 27 382 run function johto:spawn/itemloot
execute positioned -979 64 209 run function johto:spawn/itemloot
execute positioned -1701 64 307 run function johto:spawn/itemloot
execute positioned 518 64 -387 run function johto:spawn/itemloot
execute positioned -1437 39 466 run function johto:spawn/itemloot
execute positioned 421 38 -301 run function johto:spawn/itemloot
execute positioned -3161 64 -16 run function johto:spawn/itemloot
execute positioned 711 108 -46 run function johto:spawn/itemloot
execute positioned 883 64 -85 run function johto:spawn/itemloot
execute positioned -3185 64 773 run function johto:spawn/itemloot
execute positioned -721 49 385 run function johto:spawn/itemloot

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
scoreboard objectives add SlotTimer dummy
scoreboard objectives add SlotRNG dummy