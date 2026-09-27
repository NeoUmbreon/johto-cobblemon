# Remove Clear Weather and Whiteout from the lobby
function johto:updates/v1/removelobbytoggles

# Battle Tower renovation
kill @e[x=894,y=100,z=56,dx=17,dy=3,dz=22,type=cobblemon:npc]
forceload remove 875 50 930 108

# Summon 4 Miltank on the ranch
execute positioned 792 64 202 rotated 0 0 run function johto:spawn/staticpokemon {species:"miltank",level:10}
execute positioned 748 64 216 rotated 90 0 run function johto:spawn/staticpokemon {species:"miltank",level:10}
execute positioned 788 64 219 rotated 180 0 run function johto:spawn/staticpokemon {species:"miltank",level:10}
execute positioned 774 64 207 rotated 270 0 run function johto:spawn/staticpokemon {species:"miltank",level:10}

# Summon Moomoo in the paddock
execute positioned 804.0 64 271.0 run summon interaction ~ ~ ~ {width:1,height:1.5,response:1b,Tags:[NPCs]}
execute positioned 804.0 64 271.0 rotated 180 0 run function johto:spawn/staticpokemon {species:"miltank",level:10}

# Goldenrod North Gate
setblock 482 64 -267 air
execute positioned 482 64 -267 run kill @e[distance=..1,type=interaction]
forceload remove 482 -267