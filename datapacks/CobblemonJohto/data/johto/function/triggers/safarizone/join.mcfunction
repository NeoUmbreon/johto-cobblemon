#Skip deducting money and replenishing balls if player was already in Safari
scoreboard players remove @s[tag=!SafariState] Money 500
give @s[tag=!SafariState] cobblemon:safari_ball 64

spawnpoint @s 1591 84 -87
tp @s 1591 84 -87 -180 1
tag @s add SafariState
tellraw @s {"text":"Enjoy your stay in the Safari Zone! Come back to the start when you are ready to leave."}