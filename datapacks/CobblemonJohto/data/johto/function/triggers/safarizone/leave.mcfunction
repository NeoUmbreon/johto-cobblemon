#Player commands
clear @s cobblemon:safari_ball
tag @s remove SafariState
tag @s remove SafariStarter
tp @s 1591 88 -111 180 4
spawnpoint @s 1591 88 -111
tellraw @s {"text":"<Safari Clerk> Thank you for visiting! Come again soon!"}
advancement grant @s only johto:sidequests/safarizone

#If only one player remaining, transfer ownership to last player
execute store result score #safariplayers click if entity @a[tag=SafariState,tag=!SafariStarter]
execute if score #safariplayers click matches 1 run tag @a[tag=SafariState,limit=1] add SafariStarter
execute if score #safariplayers click matches 1 run scoreboard players enable @a[tag=SafariStarter] TriggerCommand
execute if score #safariplayers click matches 1 run tellraw @a[tag=SafariStarter] {"text":"It looks like you are the only player left in the Safari Zone. Would you like to rearrange the areas, free-of-charge?", "extra": [{"text":" [Yes]","color":"green","clickEvent":{"action":"run_command","value":"/trigger TriggerCommand set 22"}}]}

#Clear armor stand if no players in Safari Zone
execute unless entity @a[tag=SafariState] run tag @e[x=-792,y=65,z=-284,dy=3,type=armor_stand] remove SafariActive