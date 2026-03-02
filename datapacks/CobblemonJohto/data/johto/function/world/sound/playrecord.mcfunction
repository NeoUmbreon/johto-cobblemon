#stopsound @s record
$playsound $(track) record @s ~ ~ ~ 1 1 1
$scoreboard players set @s MusicCooldown $(duration)
scoreboard players set @s MusicLoop 1