# Timings and logic for GB battle music intros

# Pre-Battle
#1 - Rival
execute if score @s BattleStart matches 1 run return run function johto:sound/playrecord {track:"gb/npc/rivalintro", duration:99}

#2 - Boy 1 (Default) (Classes Ace Trainer, Blackbelt, Fisherman, Sailor, Swimmer)
execute if score @s BattleStart matches 2 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/youngsterintro", duration:67}

#3 - Sage (Sage)
execute if score @s BattleStart matches 3 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/sageintro", duration:258}

#4 - Girl 1 (Beauty, Lass, Birdkeeper)
execute if score @s BattleStart matches 4 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/lassintro", duration:34}

#5 - Suspicious Figure 1 (Burglar, Biker, Firebreather)
execute if score @s BattleStart matches 5 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/hikerintro", duration:42}

#6 - Suspicious Figure 2 (Medium, Psychic, Policeman)
execute if score @s BattleStart matches 6 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/pokemaniacintro", duration:19}

#7 - Team Rocket
execute if score @s BattleStart matches 7 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/teamrocketintro", duration:35}

#8 - Boy 2 (Schoolkid, Supernerd, Pokemaniac, Hiker, Camper)
execute if score @s BattleStart matches 8 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/officerintro", duration:59}

#9 - Girl 2 (Picknicker, Twin, Pokefan, Teacher)
execute if score @s BattleStart matches 9 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/beautyintro", duration:65}

#10 - Kimono Girls
execute if score @s BattleStart matches 10 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/kimonogirlintro", duration:62}

# Battle
#11 - Johto Trainer
execute if score @s BattleStart matches 11 run return run function johto:sound/playrecord {track:"gb/battle/trainerjohtointro", duration:257}

#12 - Johto Gym Leader
execute if score @s BattleStart matches 12 run return run function johto:sound/playrecord {track:"gb/battle/gymleaderjohtointro", duration:254}

#13 - Rival
execute if score @s BattleStart matches 13 run return run function johto:sound/playrecord {track:"gb/battle/rivalintro", duration:257}

#14 - Team Rocket
execute if score @s BattleStart matches 14 run return run function johto:sound/playrecord {track:"gb/battle/teamrocketintro", duration:964}

#15 - Legendary Beasts (UNUSED)

#16 - Champion
execute if score @s BattleStart matches 16 run return run function johto:sound/playrecord {track:"gb/battle/championintro", duration:443}

#17 - Kanto Trainer
execute if score @s BattleStart matches 17 run return run function johto:sound/playrecord {track:"gb/battle/trainerkantointro", duration:229}

#18 - Kanto Gym Leader
execute if score @s BattleStart matches 18 run return run function johto:sound/playrecord {track:"gb/battle/gymleaderkantointro", duration:422}

#20.. - Wild Pokemon
#20..23 - Johto Day
execute if score @s BattleStart matches 20..23 run return run function johto:sound/playrecord {track:"gb/battle/wildpokemonjohtodayintro", duration:262}

#24..27 - Johto Night
execute if score @s BattleStart matches 24..27 run return run function johto:sound/playrecord {track:"gb/battle/wildpokemonjohtonightintro", duration:269}

#28 - Kanto
execute if score @s BattleStart matches 28 run return run function johto:sound/playrecord {track:"gb/battle/wildpokemonkantointro", duration:57}

#29..31 - Legendary Beasts
execute if score @s BattleStart matches 29..31 run return run function johto:sound/playrecord {track:"gb/battle/raikouenteisuicuneintro", duration:254}

return fail