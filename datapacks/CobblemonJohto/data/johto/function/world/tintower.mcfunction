#Combines Sprint to Walk 
execute as @a run scoreboard players operation @s CooldownWalk += @s CooldownSprint
scoreboard players set @a CooldownSprint 0

#Remove tag
tag @s remove TinTowerTP

#A
execute as @s[x=255,y=106,z=298,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"271 133 319"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0

execute as @s[x=271,y=133,z=318,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"255 106 299"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0


#B
execute as @s[x=271,y=133,z=306,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"251 140 323"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0

execute as @s[x=251,y=140,z=322,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"271 133 307"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0


#C
execute as @s[x=243,y=133,z=314,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"272 140 318"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0

execute as @s[x=271,y=140,z=318,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"244 133 315"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0


#D
execute as @s[x=251,y=140,z=315,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"256 133 323"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0

execute as @s[x=255,y=133,z=322,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"252 140 315"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0


#E
execute as @s[x=251,y=106,z=314,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"260 106 323"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0

execute as @s[x=259,y=106,z=322,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"252 106 315"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0


#F
execute as @s[x=243,y=140,z=314,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"264 106 311"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0

execute as @s[x=263,y=106,z=310,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"243 140 314"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0


#G
execute as @s[x=259,y=140,z=302,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"264 133 311"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0

execute as @s[x=263,y=133,z=310,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"259 140 302"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0


#H
execute as @s[x=263,y=140,z=302,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"248 133 298"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0

execute as @s[x=247,y=133,z=298,dx=1,dy=2,dz=1,scores={CooldownWalk=500..}] run tag @s add TinTowerTP
execute as @s[tag=TinTowerTP] at @s run function johto:tools/tpwithsfx {sfx:"warpto",xyz:"263 140 302"}
execute as @s[tag=TinTowerTP] run return run scoreboard players set @s CooldownWalk 0


#