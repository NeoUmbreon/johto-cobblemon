#Activated by when a player defeats an NPC.
#Scores highly depend on which NPC to activate to continue story beats

scoreboard players set @s BattleStart 0
execute as @s[tag=!RadioOff] run function johto:tools/forceclick

#Tells player their money count after each battle
execute as @s[scores={BattleEnd=1..3}] unless entity @s[x=858,y=75,z=-15,dx=102,dy=100,dz=143] run tellraw @s ["",{"text":"You now have $","italic":true,"color":"gray"},{"score":{"name":"*","objective":"Money"},"italic":true,"color":"gray"}]

#Lets players know their battle streaks if they're in the tower
execute as @a[scores={BattleEnd=1..3}] if entity @s[x=858,y=75,z=-15,dx=102,dy=100,dz=143] run tellraw @s ["",{"text":"Your battle streak increased to ","italic":true,"color":"gray"},{"score":{"name":"*","objective":"BattleStreak"},"italic":true,"color":"gray"},{"text":"!","italic":true,"color":"gray"}]


#1 - Generic battle ending, majority of trainers especially without a story beat.
execute as @s[tag=!RadioOff,scores={BattleEnd=1},tag=!DSSound] run function johto:sound/playrecord {track:"gb/victory/trainer",duration:282}
execute as @s[tag=!RadioOff,scores={BattleEnd=1},tag=DSSound] run function johto:sound/playrecord {track:"ds/victory/trainer",duration:280}


#2..3 - Gym Leader/Elite Four ending
execute as @s[tag=!RadioOff,scores={BattleEnd=2..3},tag=!DSSound] run function johto:sound/playrecord {track:"gb/victory/gymleader",duration:764}
execute as @s[tag=!RadioOff,scores={BattleEnd=2..3},tag=DSSound] run function johto:sound/playrecord {track:"ds/victory/gymleader",duration:763}


#4 - Wild Pokemon Victory
execute as @s[tag=!RadioOff,scores={BattleEnd=4},tag=!DSSound] run function johto:sound/playrecord {track:"gb/victory/wildpokemon",duration:287}
execute as @s[tag=!RadioOff,scores={BattleEnd=4},tag=DSSound] run function johto:sound/playrecord {track:"ds/victory/wildpokemon",duration:286}


#Gives player AllGyms tag and achievement
#advancement grant @s[tag=Clair,tag=Pryce,tag=Jasmine,tag=Chuck,tag=Morty,tag=Whitney,tag=Bugsy,tag=Falkner,tag=Brock,tag=Misty,tag=Surge,tag=Erika,tag=Janine,tag=Sabrina,tag=Blaine,tag=Blue,tag=!AllGyms] only johto:event11
tag @s[tag=Clair,tag=Pryce,tag=Jasmine,tag=Chuck,tag=Morty,tag=Whitney,tag=Bugsy,tag=Falkner,tag=Brock,tag=Misty,tag=Surge,tag=Erika,tag=Janine,tag=Sabrina,tag=Blaine,tag=Blue,tag=!AllGyms] add AllGyms

#AllGyms Advancement
advancement grant @a[tag=AllGyms] only johto:badges/allbadges


scoreboard players set @s BattleEnd 0

#