# If location hasn't changed, exit
$execute if score @s MusicTitles matches $(location) run return 0


# Restart music unless surfing, radio off, or music would be the same
$execute as @s[tag=!Surfing] unless score @s RadioSelect matches 3..9 $(includes)run function johto:tools/forceclick


# Restart music if cycling
execute as @s[tag=CyclingMusic] run function johto:tools/forceclick
execute as @s[tag=CyclingMusic] run tag @s remove CyclingMusic


#Grass-legendary specific encounters
tag @s remove GrassCooldown


# Show title
$title @s actionbar {"text":"$(text)"}


# Update score
$scoreboard players set @s MusicTitles $(location)


return 1