#For the different radio stations besides the world music stations
# Timings and logic for GB music loops

# Returns
# Slots 3-7 - No Radio Card
execute as @s[scores={RadioSelect=3..7},tag=!RadioCard] run return fail

# Slot 8 - No EXPN Card
execute as @s[scores={RadioSelect=8},tag=!EXPNCard] run return fail


# Radio Card
# Slot 5 - Unown Station, Ruins of Alph only
execute if score @s RadioSelect matches 5 if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":83}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":203}}]} run return run function johto:sound/playrecord {track:"gb/radio/unown", duration:779}

# Slots 3, 4, 6, 7 - Team Rocket Takeover, Between Dialogue64-Dialogue72
execute if score @s RadioSelect matches 3..7 if entity @s[tag=Dialogue64,tag=!Dialogue72] run return run function johto:sound/playrecord {track:"gb/areas/radiotoweroccupied", duration:804}

# Slot 3 - Oak and Mary's radio station
execute if score @s RadioSelect matches 3 run return run function johto:sound/playrecord {track:"gb/radio/profoakspokemontalk", duration:330}

# Slot 4 - Lucky Number Show
execute if score @s RadioSelect matches 4 run return run function johto:sound/playrecord {track:"gb/areas/gamecorner", duration:1181}

# Slot 6 - Buena's Password
execute if score @s RadioSelect matches 6 run return run function johto:sound/playrecord {track:"gb/radio/buenaspassword", duration:683}

# Slot 7 - Pokemon Music
# Wednesday (3) - Hoenn Sounds
execute if score @s RadioSelect matches 7 run execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=3}] run return run function johto:sound/playrecord {track:"common/radio/route101", duration:674}

# Thursday (4) - Sinnoh Sounds
execute if score @s RadioSelect matches 7 run execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=4}] run return run function johto:sound/playrecord {track:"common/radio/route201", duration:560}

# Tuesday & Saturday (2 & 6) - Pokemon Lullaby
execute if score @s RadioSelect matches 7 run execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=2..6}] unless entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=5}] run return run function johto:sound/playrecord {track:"gb/radio/pokemonlullaby", duration:563}

# Monday, Friday, Sunday (1, 5, 7) - Pokemon March
execute if score @s RadioSelect matches 7 run return run function johto:sound/playrecord {track:"gb/radio/pokemonmarch", duration:434}


# EXPN Card
# Slot 8 - Poke Flute
execute if score @s RadioSelect matches 8 run return run function johto:sound/playrecord {track:"gb/radio/pokeflute", duration:362}


return fail