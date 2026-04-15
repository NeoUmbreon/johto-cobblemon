# Remove
execute if predicate {condition:"entity_properties",entity:"this",predicate:{effects:{"night_vision":{}}}} run scoreboard players set @s click 0
execute if score @s click matches 0 run effect clear @s night_vision
execute if score @s click matches 0 run return run tellraw @s {"text":"You disabled Flash!","italic":true,"color":"gray"}

# Add
tellraw @s {"text":"You used Flash!","italic":true,"color":"gray"}
effect give @s minecraft:night_vision 900 1 true
function johto:sound/playlocalsfx {sfx:"flash"}
scoreboard players set @s click 0