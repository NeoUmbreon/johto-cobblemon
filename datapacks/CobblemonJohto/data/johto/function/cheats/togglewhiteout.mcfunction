# Enable
execute if entity @s[tag=WhiteoutDisable] run tellraw @s {"text":"Enabling whiteout...","italic":true,"color":"gray"}
execute if entity @s[tag=WhiteoutDisable] run return run tag @s remove WhiteoutDisable

# Disable
tellraw @s {"text":"Disabling whiteout...","italic":true,"color":"gray"}
tag @s add WhiteoutDisable