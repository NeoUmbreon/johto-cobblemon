# Timings and logic for GB battle music loops

# Pre-Battle
#1 - Rival
execute if score @s BattleStart matches 1 run return run function johto:sound/playrecord {track:"gb/npc/rival", duration:450}

#2 - Boy 1 (Bug Catcher, Bird Keeper, Camper, Psychic, School Kid, Youngster)
execute if score @s BattleStart matches 2 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/boy1", duration:237}

#3 - Sage (Medium, Sage)
execute if score @s BattleStart matches 3 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/sage", duration:181}

#4 - Girl 1 (Ace Trainer F, Beauty, PokéFan F, Skier, Swimmer F, Teacher, Young Couple)
execute if score @s BattleStart matches 4 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/girl1", duration:257}

#5 - Suspicious Figure 1 (Burglar, Juggler, Poké Maniac, Super Nerd)
execute if score @s BattleStart matches 5 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/suspiciousfigure1", duration:434}

#6 - Suspicious Figure 2 (Ace Trainer M, Biker, Black Belt, Boarder, Fisherman, Firebreather, Gentleman, Guitarist, Hiker, PokéFan M, Sailor, Swimmer M)
execute if score @s BattleStart matches 6 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/suspiciousfigure2", duration:265}

#7 - Team Rocket (Grunts, Executives, Scientists)
execute if score @s BattleStart matches 7 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/teamrocket", duration:247}

#8 - Boy 2 (Double Team, Policeman)
execute if score @s BattleStart matches 8 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/boy2", duration:233}

#9 - Girl 2 (Lass, Picnicker, Twins)
execute if score @s BattleStart matches 9 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/girl2", duration:265}

#10 - Kimono Girls
execute if score @s BattleStart matches 10 run return run function johto:sound/playrecord {track:"gb/trainerseyesmeet/kimonogirl", duration:321}

# Battle
#11 - Johto Trainer
execute if score @s BattleStart matches 11 run return run function johto:sound/playrecord {track:"gb/battle/trainerjohto", duration:1985}

#12 - Johto Gym Leader
execute if score @s BattleStart matches 12 run return run function johto:sound/playrecord {track:"gb/battle/gymleaderjohto", duration:1192}

#13 - Rival
execute if score @s BattleStart matches 13 run return run function johto:sound/playrecord {track:"gb/battle/rival", duration:1076}

#14 - Team Rocket
execute if score @s BattleStart matches 14 run return run function johto:sound/playrecord {track:"gb/battle/teamrocket", duration:1015}

#15 - Frontier Brain
execute if score @s BattleStart matches 15 run return run function johto:sound/playrecord {track:"gb/battle/trainerjohto", duration:1985}

#16 - Champion
execute if score @s BattleStart matches 16 run return run function johto:sound/playrecord {track:"gb/battle/champion", duration:837}

#17 - Kanto Trainer
execute if score @s BattleStart matches 17 run return run function johto:sound/playrecord {track:"gb/battle/trainerkanto", duration:873}

#18 - Kanto Gym Leader
execute if score @s BattleStart matches 18 run return run function johto:sound/playrecord {track:"gb/battle/gymleaderkanto", duration:596}

#20.. - Wild Pokemon
#20..23 - Johto Day
execute if score @s BattleStart matches 20..23 run return run function johto:sound/playrecord {track:"gb/battle/wildpokemonjohtoday", duration:731}

#24..27 - Johto Night
execute if score @s BattleStart matches 24..27 run return run function johto:sound/playrecord {track:"gb/battle/wildpokemonjohtonight", duration:752}

#28 - Kanto
execute if score @s BattleStart matches 28 run return run function johto:sound/playrecord {track:"gb/battle/wildpokemonkanto", duration:1238}

#29..31 - Legendary Beasts
execute if score @s BattleStart matches 29..31 run return run function johto:sound/playrecord {track:"gb/battle/raikouenteisuicune", duration:1839}

return fail