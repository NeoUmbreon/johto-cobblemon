#Activated in radiostations.mcfunction by first person to tune in to Oak and Mary's station
#Not based off decomp logic whatsoever
#SwarmActive and molang data are reset at midnight in dailycommands
execute store result score @s rng run random value 1..22
tag @s add SwarmActive

#Results
#Command storage NBT is simply for tellraw usage; molang data controls actual spawns
execute if score @s rng matches 1 run data merge storage johto:swarm {Species:"Chansey",Zone:"Route 13"}
execute if score @s rng matches 1 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'chansey'; q.server.data.swarm.zone = 'route_13'; q.server.save_data;"

execute if score @s rng matches 2 run data merge storage johto:swarm {Species:"Ditto",Zone:"Route 47"}
execute if score @s rng matches 2 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'ditto'; q.server.data.swarm.zone = 'route_47'; q.server.save_data;"

execute if score @s rng matches 3 run data merge storage johto:swarm {Species:"Marill",Zone:"Mt. Mortar"}
execute if score @s rng matches 3 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'marill'; q.server.data.swarm.zone = 'mount_mortar_1f_entrance'; q.server.save_data;"

execute if score @s rng matches 4 run data merge storage johto:swarm {Species:"Yanma",Zone:"Route 35"}
execute if score @s rng matches 4 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'yanma'; q.server.data.swarm.zone = 'route_35'; q.server.save_data;"

execute if score @s rng matches 5 run data merge storage johto:swarm {Species:"Dunsparce",Zone:"Dark Cave"}
execute if score @s rng matches 5 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'dunsparce'; q.server.data.swarm.zone = 'dark_cave_route_31_side'; q.server.save_data;"

execute if score @s rng matches 6 run data merge storage johto:swarm {Species:"Snubbull",Zone:"Route 38"}
execute if score @s rng matches 6 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'snubbull'; q.server.data.swarm.zone = 'route_38'; q.server.save_data;"

execute if score @s rng matches 7 run data merge storage johto:swarm {Species:"Qwilfish",Zone:"Route 32"}
execute if score @s rng matches 7 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'qwilfish'; q.server.data.swarm.zone = 'route_32'; q.server.save_data;"

execute if score @s rng matches 8 run data merge storage johto:swarm {Species:"Remoraid",Zone:"Route 44"}
execute if score @s rng matches 8 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'remoraid'; q.server.data.swarm.zone = 'route_44'; q.server.save_data;"

execute if score @s rng matches 9 run data merge storage johto:swarm {Species:"Poochyena",Zone:"Route 1"}
execute if score @s rng matches 9 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'poochyena'; q.server.data.swarm.zone = 'route_1'; q.server.save_data;"

execute if score @s rng matches 10 run data merge storage johto:swarm {Species:"Wingull",Zone:"Vermilion City"}
execute if score @s rng matches 10 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'wingull'; q.server.data.swarm.zone = 'vermilion'; q.server.save_data;"

execute if score @s rng matches 11 run data merge storage johto:swarm {Species:"Ralts",Zone:"Route 34"}
execute if score @s rng matches 11 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'ralts'; q.server.data.swarm.zone = 'route_34'; q.server.save_data;"

execute if score @s rng matches 12 run data merge storage johto:swarm {Species:"Sableye",Zone:"Route 9"}
execute if score @s rng matches 12 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'sableye'; q.server.data.swarm.zone = 'route_9'; q.server.save_data;"

execute if score @s rng matches 13 run data merge storage johto:swarm {Species:"Mawile",Zone:"Route 9"}
execute if score @s rng matches 13 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'mawile'; q.server.data.swarm.zone = 'route_9'; q.server.save_data;"

execute if score @s rng matches 14 run data merge storage johto:swarm {Species:"Gulpin",Zone:"Route 3"}
execute if score @s rng matches 14 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'gulpin'; q.server.data.swarm.zone = 'route_3'; q.server.save_data;"

execute if score @s rng matches 15 run data merge storage johto:swarm {Species:"Swablu",Zone:"Route 45"}
execute if score @s rng matches 15 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'swablu'; q.server.data.swarm.zone = 'route_45'; q.server.save_data;"

execute if score @s rng matches 16 run data merge storage johto:swarm {Species:"Whiscash",Zone:"Violet City"}
execute if score @s rng matches 16 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'whiscash'; q.server.data.swarm.zone = 'violet'; q.server.save_data;"

execute if score @s rng matches 17 run data merge storage johto:swarm {Species:"Baltoy",Zone:"Route 3"}
execute if score @s rng matches 17 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'baltoy'; q.server.data.swarm.zone = 'route_3'; q.server.save_data;"

execute if score @s rng matches 18 run data merge storage johto:swarm {Species:"Clamperl",Zone:"Route 19"}
execute if score @s rng matches 18 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'clamperl'; q.server.data.swarm.zone = 'route_19'; q.server.save_data;"

execute if score @s rng matches 19 run data merge storage johto:swarm {Species:"Relicanth",Zone:"Route 12"}
execute if score @s rng matches 19 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'relicanth'; q.server.data.swarm.zone = 'relicanth'; q.server.save_data;"

execute if score @s rng matches 20 run data merge storage johto:swarm {Species:"Luvdisc",Zone:"Route 27"}
execute if score @s rng matches 20 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'luvdisc'; q.server.data.swarm.zone = 'route_27'; q.server.save_data;"

execute if score @s rng matches 21 run data merge storage johto:swarm {Species:"Kricketot",Zone:"Viridian Forest"}
execute if score @s rng matches 21 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'kricketot'; q.server.data.swarm.zone = 'viridian_forest'; q.server.save_data;"

execute if score @s rng matches 22 run data merge storage johto:swarm {Species:"Buneary",Zone:"Route 25"}
execute if score @s rng matches 22 run return run runmolang "q.set_query('server',q.entity.world.server); q.server.data.swarm.species = 'buneary'; q.server.data.swarm.zone = 'route_25'; q.server.save_data;"



return fail

#Legacy fillbiome commands
#Keeping in case biomes are somehow stuck. Purely visual now, but who knows
#R13
#fillbiome -3277 60 -341 -3229 70 -325 minecraft:jungle
#R47
#fillbiome 1412 85 -369 1432 90 -356 minecraft:jungle
#Mt. Mortar
#fillbiome 148 51 245 175 59 294 minecraft:jungle
#R35
#fillbiome 430 62 -210 486 65 -108 minecraft:jungle
#Dark Cave
#fillbiome -295 62 -86 -216 66 -12 minecraft:jungle
#R38
#fillbiome 528 65 205 667 67 265 minecraft:jungle
#R32
#fillbiome 107 60 -506 177 65 -387 minecraft:jungle
#R44
#fillbiome -439 58 145 -220 65 221 minecraft:jungle
#R1
#fillbiome -1748 62 -240 -1636 67 -162 minecraft:jungle
#Vermilion City
#fillbiome -2849 60 -148 -2634 65 11 minecraft:jungle
#R34
#fillbiome 431 62 -672 488 68 -581 minecraft:jungle
#R9
#fillbiome -2957 62 748 -2902 67 773 minecraft:jungle
#R3
#fillbiome -2202 62 593 -2148 68 636 minecraft:jungle
#R45
#fillbiome -642 61 -51 -538 68 85 minecraft:jungle
#Violet City
#fillbiome -5 59 -83 150 65 48 minecraft:jungle
#R19
#fillbiome -2441 59 -775 -2364 64 -707 minecraft:jungle
#R12
#fillbiome -3350 56 -214 -3262 64 4 minecraft:jungle
#R27
#fillbiome -1289 58 -552 -1061 65 -483 minecraft:jungle
#Viridian Forest
#fillbiome -1686 62 301 -1619 66 394 minecraft:jungle
#R25
#fillbiome -2854 62 998 -2814 65 1009 minecraft:jungle
