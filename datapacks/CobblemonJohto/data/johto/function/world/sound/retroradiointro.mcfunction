# Timings and logic for retro music intros
# only call if musiccooldown=0 && musicloop=0
# https://bulbapedia.bulbagarden.net/wiki/List_of_overworld_music_themes#Generation_II


# battle
# TODO

# dialogues
# TODO


# Special (cycling = radio stations > surfing. cyclingmusic and radio station tags should be removed on location change; surfing should not)
# Cycling
execute as @s[tag=CyclingMusic] run return run function johto:world/sound/playrecord {track:"retro/cyclingintro", duration:71}

# Radio Stations
# TODO

# Surfing
execute as @s[tag=Surfing] run return run scoreboard players set @s MusicLoop 1


# tracks that don't have an intro (scoreboard set MusicLoop to 1 and return)
execute if predicate johto:retro_loop_only run return run scoreboard players set @s MusicLoop 1


# everything else
# TEMPLATE 1 (single score/range)
# execute if score @s MusicTitles matches .. run return run function johto:world/sound/playrecord {track:"retro/", duration:}

# TEMPLATE 2 (multiple scores/ranges)
# execute if predicate {condition:"minecraft:any_of",terms:[]}
# {condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":..}}
# {condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":..,"max":..}}}
# run return run function johto:world/sound/playrecord {track:"retro/", duration:}

# TODO: correct bad math; condition optimization (re-do musictitles); full location sanity check; re-cut some tracks; fix audio popping on certain tracks
#-----------------------------------------------Johto-----------------------------------------------
# New Bark Town
execute if score @s MusicTitles matches 314 run return run function johto:world/sound/playrecord {track:"retro/settlements/newbarktownintro", duration:12}

# Elm's Lab
execute if score @s MusicTitles matches 201 run return run function johto:world/sound/playrecord {track:"retro/areas/elmpokemonlabintro", duration:127}

# Route 29
execute if score @s MusicTitles matches 67 run return run function johto:world/sound/playrecord {track:"retro/routes/29intro", duration:5}

# Cherrygrove City (& Mahogany Town)
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":305}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":313}}]} run return run function johto:world/sound/playrecord {track:"retro/settlements/cherrygrovecityintro", duration:39}

# Routes 30-33 and Oak's Welcome
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":68,"max":71}}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":24}}]} run return run function johto:world/sound/playrecord {track:"retro/routes/30intro", duration:95}

# Violet City (& Olivine City)
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":320}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":315}}]} run return run function johto:world/sound/playrecord {track:"retro/settlements/violetcityintro", duration:201}

# Sprout Tower
execute if score @s MusicTitles matches 214 run return run function johto:world/sound/playrecord {track:"retro/areas/sprouttowerintro", duration:89}

# Union Cave (& Ruins of Alph Exterior/Chambers, Ilex Forest, Goldenrod Underground, Mt. Mortar, Whirl Islands (Interior), Tohjo Falls, Embedded Tower)
# Loop Only

# Ruins of Alph (Basement)
execute if score @s MusicTitles matches 203 run return run function johto:world/sound/playrecord {track:"retro/areas/ruinsofalphintro", duration:29}
# TODO: this file could be processed better, it shouldn't need an intro

# Azalea Town (& Blackthorn City)
execute if score @s MusicTitles matches 301..302 run return run function johto:world/sound/playrecord {track:"retro/settlements/azaleatownintro", duration:86}

# Routes 34-37, Routes 40-41, Routes 45-46, Cliff Edge Gate, Whirl Islands (Exterior)
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":72,"max":75}}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":78,"max":79}}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":83,"max":84}}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":100,"max":101}}}]} run return run function johto:world/sound/playrecord {track:"retro/routes/34intro", duration:73}
# TODO: rework musictitles so i don't have to do this nonsense

# Goldenrod City (& Goldenrod Radio Tower)
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":310}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":206}}]} run return run function johto:world/sound/playrecord {track:"retro/settlements/goldenrodcityintro", duration:354}

# Goldenrod Radio Tower (Occupied)
execute if score @s MusicTitles matches 207 run return run function johto:world/sound/playrecord {track:"retro/areas/radiotoweroccupiedintro", duration:37}

# Game Corner (Goldenrod & Celadon)
execute if score @s MusicTitles matches 213 run return run function johto:world/sound/playrecord {track:"retro/areas/gamecornerintro", duration:19}

# National Park
execute if score @s MusicTitles matches 32 run return run function johto:world/sound/playrecord {track:"retro/areas/nationalparkintro", duration:6}

# Ecruteak City (& Cianwood City)
# Loop Only

# Ecruteak Dance Theater
execute if score @s MusicTitles matches 211 run return run function johto:world/sound/playrecord {track:"retro/areas/ecruteakdancetheaterintro", duration:5}

# Burned Tower
execute if score @s MusicTitles matches 215 run return run function johto:world/sound/playrecord {track:"retro/areas/burnedtowerintro", duration:169}

# Routes 38-39
execute if score @s MusicTitles matches 76..77 run return run function johto:world/sound/playrecord {track:"retro/routes/38intro", duration:73}

# Olivine Lighthouse (& Mt. Silver Cave/Summit)
# Loop Only

# Routes 42-44 and Lake of Rage
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":23}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":80,"max":82}}}]} run return run function johto:world/sound/playrecord {track:"retro/routes/42intro", duration:543}

# Team Rocket HQ
execute if score @s MusicTitles matches 39 run return run function johto:world/sound/playrecord {track:"retro/areas/teamrockethqintro", duration:145}

# Tin Tower
# Loop Only

# Dark Cave (& Ice Path, Slowpoke Well, Seafoam Islands)
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":10}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":20}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":91}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":93}}]} run return run function johto:world/sound/playrecord {track:"retro/areas/darkcaveintro", duration:258}

# Dragon's Den
execute if score @s MusicTitles matches 12 run return run function johto:world/sound/playrecord {track:"retro/areas/dragonsdenintro", duration:217}

# Battle Tower
# Loop Only

# Battle Tower Reception Desk
# Loop Only

# Routes 47-48
execute if score @s MusicTitles matches 85..86 run return run function johto:world/sound/playrecord {track:"retro/routes/47intro", duration:24}

# Safari Zone Gate
execute if score @s MusicTitles matches 89 run return run function johto:world/sound/playrecord {track:"retro/areas/safarizonegateintro", duration:70}

# Safari Zone
execute if score @s MusicTitles matches 88 run return run function johto:world/sound/playrecord {track:"retro/areas/safarizoneintro", duration:77}

# Sinjoh Ruins
execute if score @s MusicTitles matches 92 run return run function johto:world/sound/playrecord {track:"retro/areas/sinjohruinsintro", duration:19}


#-----------------------------------------------Kanto-----------------------------------------------
# Routes 26-27
execute if score @s MusicTitles matches 64..65 run return run function johto:world/sound/playrecord {track:"retro/routes/26intro", duration:95}

# S.S. Aqua
execute if score @s MusicTitles matches 94 run return run function johto:world/sound/playrecord {track:"retro/areas/ssaquaintro", duration:121}

# Vermilion City
execute if score @s MusicTitles matches 319 run return run function johto:world/sound/playrecord {track:"retro/settlements/vermilioncityintro", duration:89}

# Lavender Town
execute if score @s MusicTitles matches 312 run return run function johto:world/sound/playrecord {track:"retro/settlements/lavendertownintro", duration:161}

# Rock Tunnel (& Underground Path, Diglett's Cave, Mt. Moon, Cerulean Cave)
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":5}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":11}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":27}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":38}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":219}}]} run return run function johto:world/sound/playrecord {track:"retro/areas/rocktunnelintro", duration:196}

# Mt. Moon Square
# Loop Only

# Celadon City (& Fuchsia City)
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":303}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":309}}]} run return run function johto:world/sound/playrecord {track:"retro/settlements/celadoncityintro", duration:37}

# Routes 11-15
execute if score @s MusicTitles matches 50..54 run return run function johto:world/sound/playrecord {track:"retro/routes/11intro", duration:75}

# Viridian Forest/Route 2
execute if score @s MusicTitles matches 41 run return run function johto:world/sound/playrecord {track:"retro/areas/viridianforestintro", duration:304}

# Pewter City (& Viridian City, Cerulean City, Saffron City, Cinnabar Island, Power Plant) 210 304 307 317 318 321
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":210}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":304}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":307}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":321}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":317,"max":318}}}]} run return run function johto:world/sound/playrecord {track:"retro/settlements/pewtercityintro", duration:158}
# TODO: jesus christ

# Routes 3-10, 16-22, 24-25
execute if predicate {condition:"minecraft:any_of",terms:[{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":42,"max":49}}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":55,"max":61}}},{condition:"minecraft:entity_scores",entity:"this",scores:{"MusicTitles":{"min":62,"max":63}}}]} run return run function johto:world/sound/playrecord {track:"retro/routes/3intro", duration:106}

# Route 1
execute if score @s MusicTitles matches 40 run return run function johto:world/sound/playrecord {track:"retro/routes/1intro", duration:185}

# Pallet Town
# Loop Only

# Victory Road
# Loop Only

# Pokemon League (Reception Gate, Indigo Plateau, Route 28, Mt. Silver Exterior)
# Loop Only

# Hall of Fame
execute if score @s MusicTitles matches 19 run return run function johto:world/sound/playrecord {track:"retro/halloffameintro", duration:113}


#-----------------------------------------------Misc------------------------------------------------
# Pokemon Centers
# Loop Only

# Pokemon Gyms
# Loop Only

# Lobby
# Loop Only

return 0