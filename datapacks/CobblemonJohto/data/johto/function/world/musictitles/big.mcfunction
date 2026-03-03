# If location hasn't changed, exit
$execute if score @s MusicTitles matches $(location) run return 0


# Restart music unless surfing, radio off, or music would be the same
$execute as @s[tag=!Surfing] unless score @s RadioSelect matches 3..9 $(includes)run function johto:tools/forceclick


# Restart music if cycling
execute as @s[tag=CyclingMusic] run function johto:tools/forceclick
execute as @s[tag=CyclingMusic] run tag @s remove CyclingMusic


#Grass-legendary specific encounters
tag @s remove GrassCooldown


# Show title unless exiting interior
$execute unless score @s MusicTitles matches 201..300 run title @s title {"text":"$(text)","color":"$(color)"}
$execute unless score @s MusicTitles matches 201..300 run title @s subtitle {"text":"$(subtext)","italic":true}


# Update score
$scoreboard players set @s MusicTitles $(location)


return 1