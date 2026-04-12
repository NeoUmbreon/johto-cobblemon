execute as @s[scores={BattleCD=-1}] run tellraw @s {"text":"Enabling auto-battle...","italic":true,"color":"gray"}
execute as @s[scores={BattleCD=-1}] run return run scoreboard players set @s BattleCD 0

tellraw @s {"text":"Disabling auto-battle...","italic":true,"color":"gray"}
scoreboard players set @s BattleCD -1