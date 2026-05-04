# Enable
execute if entity @e[x=-792,y=65,z=-284,dy=3,tag=WhiteoutDisable] run tellraw @a {"text":"Whiteout enabled! Players will be brought back to Pokemon Centers upon loss to trainers."}
execute if entity @e[x=-792,y=65,z=-284,dy=3,tag=WhiteoutDisable] run return run tag @e[x=-792,y=65,z=-284,dy=3] remove WhiteoutDisable

# Disable
tellraw @a {"text":"Whiteout has been disabled!"}
tag @e[x=-792,y=65,z=-284,dy=3] add WhiteoutDisable