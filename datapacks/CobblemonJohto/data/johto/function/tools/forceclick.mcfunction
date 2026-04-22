execute as @s[tag=Overwrite] run return fail


stopsound @s record
scoreboard players set @s MusicCooldown 0
scoreboard players set @s MusicLoop 0
scoreboard players set @s click 0