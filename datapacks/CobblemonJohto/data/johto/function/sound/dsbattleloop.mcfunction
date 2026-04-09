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

#20.. - Wild Pokemon
#20 / 24 - Johto
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"BattleStart":20}},{condition:"entity_scores",entity:"this",scores:{"BattleStart":24}}]} run return run function johto:sound/playrecord {track:"ds/battle/wildpokemonjohto", duration:1980}

#21 / 25 - Lugia
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"BattleStart":21}},{condition:"entity_scores",entity:"this",scores:{"BattleStart":25}}]} run return run function johto:sound/playrecord {track:"ds/battle/lugia", duration:2640}

#22 / 26 - Ho-Oh
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"BattleStart":22}},{condition:"entity_scores",entity:"this",scores:{"BattleStart":26}}]} run return run function johto:sound/playrecord {track:"ds/battle/hooh", duration:3280}

#23 / 27 - Super-Ancient Pokemon
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"BattleStart":23}},{condition:"entity_scores",entity:"this",scores:{"BattleStart":27}}]} run return run function johto:sound/playrecord {track:"ds/battle/superancientpokemon", duration:1960}

#28 - Kanto
execute if score @s BattleStart matches 28 run return run function johto:sound/playrecord {track:"ds/battle/wildpokemonkanto", duration:2740}

#29..31 - Legendary Beasts
execute if score @s BattleStart matches 29 run return run function johto:sound/playrecord {track:"ds/battle/raikou", duration:4140}
execute if score @s BattleStart matches 30 run return run function johto:sound/playrecord {track:"ds/battle/entei", duration:3500}
execute if score @s BattleStart matches 31 run return run function johto:sound/playrecord {track:"ds/battle/suicune", duration:4140}

return fail