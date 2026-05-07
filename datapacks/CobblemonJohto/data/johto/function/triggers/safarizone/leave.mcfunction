#If player has Safari Zone tags
spawnpoint @s[tag=SafariState] 1591 88 -111
advancement grant @s[tag=SafariState] only johto:sidequests/safarizone

#Unconditional player commands
clear @s cobblemon:safari_ball
tag @s remove SafariState
tag @s remove SafariStarter
tellraw @s {"text":"<Safari Clerk> Thank you for visiting! Come again soon!"}

#If coming from waiting room, tp back and skip everything below this
execute if entity @s[x=1590,y=74,z=-129,dx=10,dy=5,dz=10] run return run tp @s 1591 88 -111 180 4

#If only one player remaining, transfer ownership to them
execute store result score #safariplayers click if entity @a[tag=SafariState,tag=!SafariStarter]
execute if score #safariplayers click matches 1 run tag @a[tag=SafariState,limit=1] add SafariStarter
execute if score #safariplayers click matches 1 run scoreboard players enable @a[tag=SafariStarter] TriggerCommand
execute if score #safariplayers click matches 1 run tellraw @a[tag=SafariStarter] {"text":"It looks like you are the only player left in the Safari Zone. Would you like to rearrange the areas, free of charge?", "extra": [{"text":" [Yes]","color":"green","clickEvent":{"action":"run_command","value":"/trigger TriggerCommand set 22"}}]}

#If no remaining players in Safari Zone, mark as inactive
execute unless entity @a[tag=SafariState] run tag @e[x=-792,y=65,z=-284,dy=3,type=armor_stand] remove SafariActive

#Unconditional tp
tp @s 1591 88 -111 180 4