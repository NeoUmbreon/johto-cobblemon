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

#19 - Wild Pokemon (umbrella)
#30..32 - Legendary Beasts
execute if score @s BattleStart matches 19 if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:raikou",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 30
execute if score @s BattleStart matches 19 if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:entei",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 31
execute if score @s BattleStart matches 19 if entity @e[type=cobblemon:pokemon,distance=..20,nbt={Pokemon:{Species:"cobblemon:suicune",PokemonOriginalTrainerType:"NONE"}}] run scoreboard players set @s BattleStart 32
execute if score @s BattleStart matches 30..32 run return run function johto:sound/playrecord {track:"gb/battle/raikouenteisuicuneintro", duration:254}

#21 - Johto Day
execute if entity @s[scores={BattleStart=19..},x=-877,y=0,z=-800,dx=3000,dy=256,dz=2000] if predicate {condition:"minecraft:time_check",value:{"min":0,"max":11999},period:24000} run scoreboard players set @s BattleStart 21
execute if score @s BattleStart matches 21 run return run function johto:sound/playrecord {track:"gb/battle/wildpokemonjohtodayintro", duration:262}

#22 - Johto Night
execute if entity @s[scores={BattleStart=19..},x=-877,y=0,z=-800,dx=3000,dy=256,dz=2000] unless predicate {condition:"minecraft:time_check",value:{"min":0,"max":11999},period:24000} run scoreboard players set @s BattleStart 22
execute if score @s BattleStart matches 22 run return run function johto:sound/playrecord {track:"gb/battle/wildpokemonjohtonightintro", duration:269}

#23 - Kanto
execute if entity @s[scores={BattleStart=19..},x=-3552,y=0,z=-1136,dx=2675,dy=256,dz=2185] run scoreboard players set @s BattleStart 23
execute if score @s BattleStart matches 23 run return run function johto:sound/playrecord {track:"gb/battle/wildpokemonkantointro", duration:57}

return fail