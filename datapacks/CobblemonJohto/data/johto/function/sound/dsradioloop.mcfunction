# Timings and logic for DS music
# only call if musiccooldown=0 && tag=DSSound
# https://bulbapedia.bulbagarden.net/wiki/List_of_overworld_music_themes#Generation_IV

# might be used in the future?
#scoreboard players add @s MusicLoop 1

# Always Play
# Battle & Pre-Battle
execute if score @s BattleStart matches 1.. run return run function johto:sound/dsbattleloop


# Return
execute unless score @s RadioSelect matches 2..8 run return fail


# Overrides
# Dialogue
execute if score @s DialogueMusic matches 1.. run return run function johto:sound/dsdialogueloop

# Radio Stations
execute unless score @s RadioSelect matches 2 run return run function johto:sound/dsradiostationsloop

# Surfing
execute as @s[tag=Surfing] run return run function johto:sound/playrecord {track:"ds/misc/surf", duration:3060}

# Cycling
execute as @s[tag=CyclingMusic] run return run function johto:sound/playrecord {track:"ds/misc/cycling", duration:1520}

# Route 17
execute if score @s MusicTitles matches 56 run return run function johto:sound/playrecord {track:"ds/misc/cycling", duration:1520}



# Everything Else
# TEMPLATE 1 (single score/range)
# execute if score @s MusicTitles matches .. run return run function johto:sound/playrecord {track:"ds/", duration:}

# TEMPLATE 2 (multiple scores/ranges)
# execute if predicate {condition:"any_of",terms:[]}
# {condition:"entity_scores",entity:"this",scores:{"MusicTitles":..}}
# {condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":..,"max":..}}}
# run return run function johto:sound/playrecord {track:"ds/", duration:}


#-----------------------------------------------Johto-----------------------------------------------
# New Bark Town
execute if score @s MusicTitles matches 314 run return run function johto:sound/playrecord {track:"ds/settlements/newbarktown", duration:2440}

# Elm's Lab
execute if score @s MusicTitles matches 201 run return run function johto:sound/playrecord {track:"ds/areas/elmpokemonlab", duration:1640}

# Route 29
execute if score @s MusicTitles matches 67 run return run function johto:sound/playrecord {track:"ds/routes/29", duration:2360}

# Cherrygrove City (& Mahogany Town)
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":305}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":313}}]} run return run function johto:sound/playrecord {track:"ds/settlements/cherrygrovecity", duration:2140}

# Routes 30-33
execute if score @s MusicTitles matches 68..71 run return run function johto:sound/playrecord {track:"ds/routes/30", duration:1540}

# Violet City (& Olivine City)
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":320}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":315}}]} run return run function johto:sound/playrecord {track:"ds/settlements/violetcity", duration:2720}

# Sprout Tower
execute if score @s MusicTitles matches 214 run return run function johto:sound/playrecord {track:"ds/areas/sprouttower", duration:1680}

# Union Cave (& Ruins of Alph Exterior/Chambers, Ilex Forest, Mt. Moon, Mt. Moon Square, Mt. Mortar, Whirl Islands, Tohjo Falls, Embedded Tower, Giovanni, Slowpoke Well) 17 21 26 27 28 87 93 95 100 205 209
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":17}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":21}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":26,"max":28}}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":87}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":93}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":95}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":99}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":205}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":209}}]} run return run function johto:sound/playrecord {track:"ds/areas/unioncave", duration:2740}

# Ruins of Alph (Basement)
execute if score @s MusicTitles matches 203 run return run function johto:sound/playrecord {track:"ds/areas/ruinsofalph", duration:1660}

# Azalea Town (& Blackthorn City)
execute if score @s MusicTitles matches 301..302 run return run function johto:sound/playrecord {track:"ds/settlements/azaleatown", duration:2520}

# Routes 34-37, Routes 40-41, Routes 45-46, Cliff Edge Gate
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":72,"max":75}}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":78,"max":79}}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":83,"max":84}}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":101}}]} run return run function johto:sound/playrecord {track:"ds/routes/34", duration:2000}

# Goldenrod City (& Goldenrod Radio Tower, Goldenrod Underground)
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":310}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":206}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":208}}]} run return run function johto:sound/playrecord {track:"ds/settlements/goldenrodcity", duration:1740}

# Goldenrod Radio Tower (Occupied)
execute if score @s MusicTitles matches 207 run return run function johto:sound/playrecord {track:"ds/areas/radiotoweroccupied", duration:1700}

# Game Corner (Goldenrod & Celadon)
execute if score @s MusicTitles matches 213 run return run function johto:sound/playrecord {track:"ds/areas/gamecorner", duration:3020}

# National Park
execute if score @s MusicTitles matches 32 run return run function johto:sound/playrecord {track:"ds/areas/nationalpark", duration:4300}

# Ecruteak City
execute if score @s MusicTitles matches 308 run return run function johto:sound/playrecord {track:"ds/settlements/ecruteakcity", duration:3380}

# Ecruteak Dance Theater
execute if score @s MusicTitles matches 211 run return run function johto:sound/playrecord {track:"ds/areas/ecruteakdancetheater", duration:1140}

# Burned Tower
execute if score @s MusicTitles matches 215 run return run function johto:sound/playrecord {track:"ds/areas/burnedtower", duration:1840}

# Routes 38-39
execute if score @s MusicTitles matches 76..77 run return run function johto:sound/playrecord {track:"ds/routes/38", duration:2220}

# Olivine Lighthouse (& Mt. Silver Cave)
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":212}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":30}}]} run return run function johto:sound/playrecord {track:"ds/areas/olivinelighthouse", duration:1560}

# Cianwood City
execute if score @s MusicTitles matches 306 run return run function johto:sound/playrecord {track:"ds/settlements/cianwoodcity", duration:3140}

# Routes 42-44 and Lake of Rage
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":23}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":80,"max":82}}}]} run return run function johto:sound/playrecord {track:"ds/routes/42", duration:1540}

# Team Rocket HQ
execute if score @s MusicTitles matches 39 run return run function johto:sound/playrecord {track:"ds/areas/teamrockethq", duration:2020}

# Bell Tower
execute if score @s MusicTitles matches 216 run return run function johto:sound/playrecord {track:"ds/areas/belltower", duration:2100}

# Ice Path (& Dark Cave, Seafoam Islands) 10 20 91
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":10}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":20}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":91}}]} run return run function johto:sound/playrecord {track:"ds/areas/icepath", duration:3120}

# Dragon's Den
execute if score @s MusicTitles matches 12 run return run function johto:sound/playrecord {track:"ds/areas/dragonsden", duration:2820}

# Battle Tower
execute if score @s MusicTitles matches 2 run return run function johto:sound/playrecord {track:"ds/areas/battletower", duration:3060}

# Battle Tower Reception Desk
execute if score @s MusicTitles matches 3 run return run function johto:sound/playrecord {track:"ds/areas/battletowerreceptiondesk", duration:1440}

# Routes 47-48
execute if score @s MusicTitles matches 85..86 run return run function johto:sound/playrecord {track:"ds/routes/47", duration:2940}

# Safari Zone Gate
execute if score @s MusicTitles matches 89 run return run function johto:sound/playrecord {track:"ds/areas/safarizonegate", duration:2180}

# Safari Zone
execute if score @s MusicTitles matches 88 run return run function johto:sound/playrecord {track:"ds/areas/safarizone", duration:2660}

# Sinjoh Ruins
execute if score @s MusicTitles matches 92 run return run function johto:sound/playrecord {track:"ds/areas/sinjohruins", duration:3660}


#-----------------------------------------------Kanto-----------------------------------------------
# Routes 26-27 and Pokemon League Reception Gate
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":64,"max":65}}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":102}}]} run return run function johto:sound/playrecord {track:"ds/routes/26", duration:1480}

# S.S. Aqua
execute if score @s MusicTitles matches 94 run return run function johto:sound/playrecord {track:"ds/areas/ssaqua", duration:2500}

# Vermilion City
execute if score @s MusicTitles matches 319 run return run function johto:sound/playrecord {track:"ds/settlements/vermilioncity", duration:2120}

# Lavender Town
execute if score @s MusicTitles matches 312 run return run function johto:sound/playrecord {track:"ds/settlements/lavendertown", duration:2360}

# Mt. Moon Square (Monday Nights Only)
#execute if score @s MusicTitles matches 26 run return run function johto:sound/playrecord {track:"ds/areas/mtmoonsquare", duration:}

# Rock Tunnel (& Underground Path, Diglett's Cave, Cerulean Cave) 5 11 38 219
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":5}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":11}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":38}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":219}}]} run return run function johto:sound/playrecord {track:"ds/areas/rocktunnel", duration:4560}

# Cerulean City (& Fuchsia City)
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":304}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":309}}]} run return run function johto:sound/playrecord {track:"ds/settlements/ceruleancity", duration:1480}

# Routes 24-25
execute if score @s MusicTitles matches 62..63 run return run function johto:sound/playrecord {track:"ds/routes/24", duration:1500}

# Celadon City
execute if score @s MusicTitles matches 303 run return run function johto:sound/playrecord {track:"ds/settlements/celadoncity", duration:1480}

# Routes 11-15
execute if score @s MusicTitles matches 50..54 run return run function johto:sound/playrecord {track:"ds/routes/11", duration:1640}

# Viridian Forest
execute if score @s MusicTitles matches 218 run return run function johto:sound/playrecord {track:"ds/areas/viridianforest", duration:2440}

# Pewter City (& Viridian City, Saffron City, Power Plant) 210 317 318 321
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":210}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":321}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":317,"max":318}}}]} run return run function johto:sound/playrecord {track:"ds/settlements/pewtercity", duration:2900}

# Routes 2-10, 16, 18-22   41..49 55 57..61
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":41,"max":49}}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":55}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":57,"max":61}}}]} run return run function johto:sound/playrecord {track:"ds/routes/3", duration:1660}

# Route 1
execute if score @s MusicTitles matches 40 run return run function johto:sound/playrecord {track:"ds/routes/1", duration:1480}

# Pallet Town
execute if score @s MusicTitles matches 316 run return run function johto:sound/playrecord {track:"ds/settlements/pallettown", duration:2260}

# Cinnabar Island
execute if score @s MusicTitles matches 307 run return run function johto:sound/playrecord {track:"ds/settlements/cinnabarisland", duration:1840}

# Victory Road
execute if score @s MusicTitles matches 96 run return run function johto:sound/playrecord {track:"ds/areas/victoryroad", duration:1960}

# Pokemon League (Indigo Plateau, Route 28, Mt. Silver Exterior, Elite Four) 
execute if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":14}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":{"min":103,"max":104}}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":311}}]} run return run function johto:sound/playrecord {track:"ds/areas/pokemonleague", duration:1800}

# Hall of Fame
execute if score @s MusicTitles matches 19 run return run function johto:sound/playrecord {track:"ds/misc/halloffame", duration:1440}


#-----------------------------------------------Misc------------------------------------------------
# Pokemon Centers
execute if score @s MusicTitles matches 217 run return run function johto:sound/playrecord {track:"ds/areas/pokemoncenter", duration:1540}

# Poke Marts & Department Stores
execute if score @s MusicTitles matches 220 run return run function johto:sound/playrecord {track:"ds/areas/pokemart", duration:2220}

# Pokemon Gyms
execute if score @s MusicTitles matches 35 run return run function johto:sound/playrecord {track:"ds/areas/pokemongym", duration:1840}

# Lobby
execute if score @s MusicTitles matches 25 run return run function johto:sound/playrecord {track:"ds/misc/titlescreen", duration:1518}

# Oak's Welcome
execute if score @s MusicTitles matches 24 run return run function johto:sound/playrecord {track:"ds/misc/anadventurebegins", duration:860}

# Mt. Silver Summit
execute if score @s MusicTitles matches 31 run return run function johto:sound/playrecord {track:"ds/misc/wind", duration:600}

# ???
execute if score @s MusicTitles matches 15 run return run function johto:sound/playrecord {track:"ds/misc/pokewalker", duration:1600}

return 0