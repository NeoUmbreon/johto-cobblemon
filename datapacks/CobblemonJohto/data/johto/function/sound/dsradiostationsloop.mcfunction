#For the different radio stations besides the world music stations
# Timings and logic for DS radio station music

# Returns
# Slots 3-7 - No Radio Card
execute as @s[scores={RadioSelect=3..7},tag=!RadioCard] run return fail

# Slot 8 - No EXPN Card
execute as @s[scores={RadioSelect=8},tag=!EXPNCard] run return fail


# Radio Card
# Slot 5 - Unown Station, Ruins of Alph only
execute if score @s RadioSelect matches 5 if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":83}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":203}}]} run return run function johto:sound/playrecord {track:"ds/radio/unown", duration:700}

# Slots 3, 4, 6, 7 - Team Rocket Takeover, Between Dialogue64-Dialogue72
execute if score @s RadioSelect matches 3..7 if entity @s[tag=Dialogue64,tag=!Dialogue72] run return run function johto:sound/playrecord {track:"ds/areas/radiotoweroccupied", duration:1700}

# Slot 3 - Oak and Mary's radio station
execute if score @s RadioSelect matches 3 run return run function johto:sound/playrecord {track:"ds/radio/profoakspokemontalk", duration:1680}

# Slot 4 - Lucky Number Show
execute if score @s RadioSelect matches 4 run return run function johto:sound/playrecord {track:"ds/areas/gamecorner", duration:3020}

# Slot 6 - Buena's Password
execute if score @s RadioSelect matches 6 run return run function johto:sound/playrecord {track:"ds/radio/buenaspassword", duration:1940}

# Slot 7 - Pokemon Music
# Wednesday (3) - Hoenn Sounds
execute if score @s RadioSelect matches 7 run execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=3}] run return run function johto:sound/playrecord {track:"ds/radio/route101", duration:1540}

# Thursday (4) - Sinnoh Sounds
execute if score @s RadioSelect matches 7 run execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=4}] run return run function johto:sound/playrecord {track:"ds/radio/route201", duration:1340}

# Tuesday & Saturday (2 & 6) - Pokemon Lullaby
execute if score @s RadioSelect matches 7 run execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=2..6}] unless entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=5}] run return run function johto:sound/playrecord {track:"ds/radio/pokemonlullaby", duration:1500}

# Monday, Friday, Sunday (1, 5, 7) - Pokemon March
execute if score @s RadioSelect matches 7 run return run function johto:sound/playrecord {track:"ds/radio/pokemonmarch", duration:1100}


# EXPN Card
# Slot 8 - Poke Flute
execute if score @s RadioSelect matches 8 run return run function johto:sound/playrecord {track:"ds/radio/pokeflute", duration:1200}


return fail