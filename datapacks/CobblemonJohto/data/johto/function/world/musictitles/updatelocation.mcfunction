# Refresh music (unless surfing, in battle, not on world radio, or music would be the same)
$execute as @s[tag=!Surfing,scores={BattleStart=0,RadioSelect=2}] $(includes)run function johto:tools/forceclick


# Refresh music if cycling (unless surfing, in battle, not on world radio, or on Cycling Road with DSSound tag)
execute as @s[tag=CyclingMusic,tag=!Surfing,scores={BattleStart=0,RadioSelect=2}] unless entity @s[scores={MusicTitles=55..57},tag=DSSound] run function johto:tools/forceclick
execute as @s[tag=CyclingMusic] run tag @s remove CyclingMusic


# Enables grass legendary encounters
tag @s remove GrassCooldown


# Update score
$scoreboard players set @s MusicTitles $(location)