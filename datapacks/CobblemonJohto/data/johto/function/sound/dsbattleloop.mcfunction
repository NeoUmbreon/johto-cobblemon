# Timings and logic for DS battle music

# Pre-Battle
#1 - Rival
execute if score @s BattleStart matches 1 run return run function johto:sound/playrecord {track:"ds/npc/rival", duration:1160}

#2 - Boy 1 (Default) (Classes Ace Trainer, Blackbelt, Fisherman, Sailor, Swimmer)
execute if score @s BattleStart matches 2 run return run function johto:sound/playrecord {track:"ds/trainerseyesmeet/youngster", duration:740}

#3 - Sage (Sage)
execute if score @s BattleStart matches 3 run return run function johto:sound/playrecord {track:"ds/trainerseyesmeet/sage", duration:1020}

#4 - Girl 1 (Beauty, Lass, Birdkeeper)
execute if score @s BattleStart matches 4 run return run function johto:sound/playrecord {track:"ds/trainerseyesmeet/lass", duration:760}

#5 - Suspicious Figure 1 (Burglar, Biker, Firebreather)
execute if score @s BattleStart matches 5 run return run function johto:sound/playrecord {track:"ds/trainerseyesmeet/hiker", duration:900}

#6 - Suspicious Figure 2 (Medium, Psychic, Policeman)
execute if score @s BattleStart matches 6 run return run function johto:sound/playrecord {track:"ds/trainerseyesmeet/pokemaniac", duration:1100}

#7 - Team Rocket
execute if score @s BattleStart matches 7 run return run function johto:sound/playrecord {track:"ds/trainerseyesmeet/teamrocket", duration:700}

#8 - Boy 2 (Schoolkid, Supernerd, Pokemaniac, Hiker, Camper)
execute if score @s BattleStart matches 8 run return run function johto:sound/playrecord {track:"ds/trainerseyesmeet/officer", duration:720}

#9 - Girl 2 (Picknicker, Twin, Pokefan, Teacher)
execute if score @s BattleStart matches 9 run return run function johto:sound/playrecord {track:"ds/trainerseyesmeet/beauty", duration:760}

#10 - Kimono Girls
execute if score @s BattleStart matches 10 run return run function johto:sound/playrecord {track:"ds/trainerseyesmeet/kimonogirl", duration:580}

# Battle
#11 - Johto Trainer
execute if score @s BattleStart matches 11 run return run function johto:sound/playrecord {track:"ds/battle/trainerjohto", duration:4720}

#12 - Johto Gym Leader
execute if score @s BattleStart matches 12 run return run function johto:sound/playrecord {track:"ds/battle/gymleaderjohto", duration:2900}

#13 - Rival
execute if score @s BattleStart matches 13 run return run function johto:sound/playrecord {track:"ds/battle/rival", duration:2680}

#14 - Team Rocket
execute if score @s BattleStart matches 14 run return run function johto:sound/playrecord {track:"ds/battle/teamrocket", duration:2580}

#15 - Legendary Beasts (UNUSED)

#16 - Champion
execute if score @s BattleStart matches 16 run return run function johto:sound/playrecord {track:"ds/battle/champion", duration:2440}

#17 - Kanto Trainer
execute if score @s BattleStart matches 17 run return run function johto:sound/playrecord {track:"ds/battle/trainerkanto", duration:3680}

#18 - Kanto Gym Leader
execute if score @s BattleStart matches 18 run return run function johto:sound/playrecord {track:"ds/battle/gymleaderkanto", duration:2820}

#19 - Wild Pokemon (umbrella)
#30..32 - Legendary Beasts
execute if score @s BattleStart matches 19 if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:raikou",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 30
execute if score @s BattleStart matches 19 if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:entei",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 31
execute if score @s BattleStart matches 19 if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:suicune",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 32
execute if score @s BattleStart matches 30 run return run function johto:sound/playrecord {track:"ds/battle/raikou", duration:4140}
execute if score @s BattleStart matches 31 run return run function johto:sound/playrecord {track:"ds/battle/entei", duration:3500}
execute if score @s BattleStart matches 32 run return run function johto:sound/playrecord {track:"ds/battle/suicune", duration:4140}

#33 - Lugia
execute if score @s BattleStart matches 19.. if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:lugia",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 33
execute if score @s BattleStart matches 33 run return run function johto:sound/playrecord {track:"ds/battle/lugia", duration:2640}

#34 - Ho-Oh
execute if score @s BattleStart matches 19.. if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:hooh",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 34
execute if score @s BattleStart matches 34 run return run function johto:sound/playrecord {track:"ds/battle/hooh", duration:3280}

#35 - Super-Ancient Pokemon
execute if score @s BattleStart matches 19.. if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:kyogre",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 35
execute if score @s BattleStart matches 19.. if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:groudon",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 35
execute if score @s BattleStart matches 19.. if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:rayquaza",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 35
execute if score @s BattleStart matches 35 run return run function johto:sound/playrecord {track:"ds/battle/superancientpokemon", duration:1960}

#21..22 - Johto Day/Night
execute if entity @s[scores={BattleStart=19..},x=-877,y=0,z=-800,dx=3000,dy=256,dz=2000] if predicate {condition:"minecraft:time_check",value:{"min":0,"max":11999},period:24000} run scoreboard players set @s BattleStart 21
execute if entity @s[scores={BattleStart=19..},x=-877,y=0,z=-800,dx=3000,dy=256,dz=2000] unless predicate {condition:"minecraft:time_check",value:{"min":0,"max":11999},period:24000} run scoreboard players set @s BattleStart 22
execute if score @s BattleStart matches 21..22 run return run function johto:sound/playrecord {track:"ds/battle/wildpokemonjohto", duration:1980}

#23 - Kanto
execute if entity @s[scores={BattleStart=19..},x=-3552,y=0,z=-1136,dx=2675,dy=256,dz=2185] run scoreboard players set @s BattleStart 23
execute if score @s BattleStart matches 23 run return run function johto:sound/playrecord {track:"ds/battle/wildpokemonkanto", duration:2740}

return fail