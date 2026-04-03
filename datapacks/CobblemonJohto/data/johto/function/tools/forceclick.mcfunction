execute as @s[tag=Skip] run return run tag @s remove Skip


stopsound @s record
scoreboard players set @s MusicCooldown 0
scoreboard players set @s MusicLoop 0
scoreboard players set @s click 0