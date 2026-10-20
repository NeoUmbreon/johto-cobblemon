#For the different radio stations besides the world music stations
#Executes radio station effects

tag @s remove HoennSounds
tag @s remove SinnohSounds

# Returns
# Slots 3-7 - No Radio Card
execute as @s[scores={RadioSelect=3..7},tag=!RadioCard] run return run title @s actionbar [{"text":"Station "},{"score":{"name":"@s","objective":"RadioSelect"}},{"text":": This station requires a Radio Card from Goldenrod to listen"}]

# Slot 8 - No EXPN Card
execute as @s[scores={RadioSelect=8},tag=!EXPNCard] run return run title @s actionbar {"text":"Station 8: This station requires an EXPN Card from Lavender to listen"}


# Radio Card
# Slot 5 - Unown Station, Ruins of Alph only
execute as @s[scores={RadioSelect=5}] if predicate {condition:"any_of",terms:[{condition:"entity_scores",entity:"this",scores:{"MusicTitles":83}},{condition:"entity_scores",entity:"this",scores:{"MusicTitles":203}}]} run return run title @s actionbar ["",{"text":"Radio: "},{"text":"Unown Station","obfuscated":true}]
execute as @s[scores={RadioSelect=5}] run return run title @s actionbar {"text":"Station 5: Weak signal. Get closer to the Ruins of Alph."}

# Slots 3, 4, 6, 7 - Team Rocket Takeover, Between Dialogue64-Dialogue72
execute as @s[scores={RadioSelect=3..7},tag=Dialogue64,tag=!Dialogue72] run return run tellraw @s ["",{"text":"<Team Rocket> "},{"text":"...Uh... um. Testing! Testing 1, 2, 3... We’re the amazing Team Rocket! It’s been three years but we’ve rebuilt the team and restructured! We’re proud to announce that we’re back! Giovanni! Can you hear this?! ...We finally did it! Where could the boss be, I wonder? I wonder if he heard this announcement...","italic":true}]

# Slot 3 - Oak and Mary's radio station
execute as @s[scores={RadioSelect=3}] run title @s actionbar {"text":"Radio: Pokemon Talk"}

#Swarms are post-game
execute as @s[scores={RadioSelect=3,IP=0}] run return run tellraw @s {"text":"<Mary> We're reaching out to all you Pokémon fans out there! Here is the leading expert on Pokémon, Professor Oak, and of course myself, Mary!"}

#Rolls for a Swarm species if player tunes into this station
#SwarmActive tag prevents the rolling from happening multiple times a day. Resets with DailyCommands function
execute if entity @s[scores={RadioSelect=3,IP=1..}] as @e[x=-864,y=69,z=-207,dy=3,tag=!SwarmActive] run function johto:triggers/radio/swarmspawns
execute as @s[scores={RadioSelect=3,IP=1..},tag=!PokeTalkCooldown] run tellraw @s ["<Mary> This is breaking news! A bunch of ",{"storage":"johto:swarm","nbt":"Species"}," have decided to make an appearance at ",{"storage":"johto:swarm","nbt":"Zone"},"! If you're a Trainer who's really wanted to find ",{"storage":"johto:swarm","nbt":"Species"},", hurry over to ",{"storage":"johto:swarm","nbt":"Zone"},"!"]
execute as @s[scores={RadioSelect=3,IP=1..}] run tag @s add PokeTalkCooldown


#Slot 4 - Lucky Number Show
execute as @s[scores={RadioSelect=4}] run title @s actionbar {"text":"Radio: Lucky Number Show"}
execute as @s[scores={RadioSelect=4}] run tellraw @s[tag=!LuckyNumberTalk] ["",{"text":"\u266a\u266b\u266c "},{"text":"[Radio: Lucky Number Show] ","color":"aqua"},{"text":"<DJ Reed> "},{"text":"Yeehaw! How y'all doin' now? Whether you're up or way down low, don't you miss the LUCKY NUMBER SHOW! Come check with us at the Goldenrod Radio Tower to see if your Pokemon is a winner! ","italic":true},{"text":"\u266a\u266b\u266c"}]
execute as @s[scores={RadioSelect=4}] run tag @s add LuckyNumberTalk


#Slot 6 - Buena's Password
execute as @s[scores={RadioSelect=6}] run title @s actionbar {"text":"Radio: Buena's Password Show"}
execute as @s[scores={RadioSelect=6}] run tellraw @s[tag=!BuenasPasswordTalk] ["",{"text":"\u266a\u266b\u266c "},{"text":"[Radio: Buena's Password] ","color":"aqua"},{"text":"<DJ Buena> "},{"text":"Buena here! Today's password! Let me think... Here it is! Don't forget it! I'm in Goldenrod's Radio Tower! \u266a\u266b\u266c","italic":true}]
execute as @s[scores={RadioSelect=6}] run tag @s add BuenasPasswordTalk
execute as @s[scores={RadioSelect=6}] run tag @s add BuenasPasswordDaily


#Slot 7 - Pokemon Music

#Monday - Pokemon March
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=1}] as @s[scores={RadioSelect=7}] run title @s actionbar {"text":"Radio: Pokemon Music - Pokemon March"}
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=1}] as @s[scores={RadioSelect=7}] run tellraw @s[tag=!PokemonMusicTalk] ["",{"text":"\u266a\u266b\u266c "},{"text":"[Radio: Pokémon Music] ","color":"aqua"},{"text":"<DJ Ben> It's me, DJ Ben! Today's Monday, so chill out to Pokemon March! ","italic":true},{"text":"\u266a\u266b\u266c"}]

#Friday - Pokemon March
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=5}] as @s[scores={RadioSelect=7}] run title @s actionbar {"text":"Radio: Pokemon Music - Pokemon March"}
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=5}] as @s[scores={RadioSelect=7}] run tellraw @s[tag=!PokemonMusicTalk] ["",{"text":"\u266a\u266b\u266c "},{"text":"[Radio: Pokémon Music] ","color":"aqua"},{"text":"<DJ Ben> It's me, DJ Ben! Today's Friday, so chill out to Pokemon March! ","italic":true},{"text":"\u266a\u266b\u266c"}]

#Sunday - Pokemon March
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=7}] as @s[scores={RadioSelect=7}] run title @s actionbar {"text":"Radio: Pokemon Music - Pokemon March"}
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=7}] as @s[scores={RadioSelect=7}] run tellraw @s[tag=!PokemonMusicTalk] ["",{"text":"\u266a\u266b\u266c "},{"text":"[Radio: Pokémon Music] ","color":"aqua"},{"text":"<DJ Ben> It's me, DJ Ben! Today's Sunday, so chill out to Pokemon March! ","italic":true},{"text":"\u266a\u266b\u266c"}]


#Tuesday - Pokemon Lullaby
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=2}] as @s[scores={RadioSelect=7}] run title @s actionbar {"text":"Radio: Pokemon Music - Pokemon Lullaby"}
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=2}] as @s[scores={RadioSelect=7}] run tellraw @s[tag=!PokemonMusicTalk] ["",{"text":"\u266a\u266b\u266c "},{"text":"[Radio: Pokémon Music] ","color":"aqua"},{"text":"<DJ Ben> It's me, DJ Ben! Today's Tuesday, so chill out to Pokemon Lullaby! ","italic":true},{"text":"\u266a\u266b\u266c"}]
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=2}] as @s[scores={RadioSelect=7}] run tag @s add RepelEffect

#Saturday - Pokemon Lullaby
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=6}] as @s[scores={RadioSelect=7}] run title @s actionbar {"text":"Radio: Pokemon Music - Pokemon Lullaby"}
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=6}] as @s[scores={RadioSelect=7}] run tellraw @s[tag=!PokemonMusicTalk] ["",{"text":"\u266a\u266b\u266c "},{"text":"[Radio: Pokémon Music] ","color":"aqua"},{"text":"<DJ Ben> It's me, DJ Ben! Today's Saturday, so chill out to Pokemon Lullaby! ","italic":true},{"text":"\u266a\u266b\u266c"}]
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=6}] as @s[scores={RadioSelect=7}] run tag @s add RepelEffect


#Wednesday - Hoenn Sounds
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=3}] as @s[scores={RadioSelect=7}] run title @s actionbar {"text":"Radio: Pokemon Music - Hoenn Sounds"}
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=3}] as @s[scores={RadioSelect=7}] run tellraw @s[tag=!PokemonMusicTalk] ["",{"text":"\u266a\u266b\u266c "},{"text":"[Radio: Pokémon Music] ","color":"aqua"},{"text":"<DJ Ben> It's me, DJ Ben! Today's Wednesday, so chill out to Hoenn Sounds! ","italic":true},{"text":"\u266a\u266b\u266c"}]
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=3}] as @s[scores={RadioSelect=7}] run tag @s add HoennSounds


#Thursday - Sinnoh Sounds
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=4}] as @s[scores={RadioSelect=7}] run title @s actionbar {"text":"Radio: Pokemon Music - Sinnoh Sounds"}
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=4}] as @s[scores={RadioSelect=7}] run tellraw @s[tag=!PokemonMusicTalk] ["",{"text":"\u266a\u266b\u266c "},{"text":"[Radio: Pokémon Music] ","color":"aqua"},{"text":"<DJ Ben> It's me, DJ Ben! Today's Thursday, so chill out to Sinnoh Sounds! ","italic":true},{"text":"\u266a\u266b\u266c"}]
execute if entity @e[x=-799,y=64,z=-284,dy=3,type=armor_stand,scores={WeekdayTrack=4}] as @s[scores={RadioSelect=7}] run tag @s add SinnohSounds


execute as @s[scores={RadioSelect=7}] run tag @s add PokemonMusicTalk


#Slot 8 - Poke Flute
execute as @s[scores={RadioSelect=8}] run title @s actionbar {"text":"Radio: Poké Flute"}
execute as @s[scores={RadioSelect=8,TalkTime=0},x=-2902,y=64,z=-48,distance=..35] run scoreboard players set @s[tag=!Dialogue142] DialogueTrigger 142