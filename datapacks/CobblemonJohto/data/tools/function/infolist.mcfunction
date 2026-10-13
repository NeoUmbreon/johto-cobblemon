# Map Version
# injected by process_files.py. Do not remove this line!

#Spawn chunks load check
execute if entity @e[x=-880,y=64,z=-336,dy=3,type=armor_stand] if entity @e[x=-689,y=64,z=-336,dy=3,type=armor_stand] if entity @e[x=-689,y=95,z=-145,dy=3,type=armor_stand] if entity @e[x=-880,y=80,z=-145,dy=3,type=armor_stand] run tag @s add success

execute as @s[tag=success] run tellraw @s ["",{"text":"1) "},{"text":"All spawn chunk corners confirmed loaded.","color":"green"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"These 4 corners must be loaded for the map to fully function. These are spawn chunks the world keeps loaded at all times, and runs most functions of the map."}},{"text":"]"}]
execute as @s[tag=!success] run tellraw @s ["",{"text":"1) "},{"text":"One or more spawn chunks failed to load.","color":"red"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"These 4 corners must be loaded for the map to fully function. These are spawn chunks the world keeps loaded at all times, and runs most functions of the map. The command \"/setworldspawn -780 64 -245\" may help this issue (click to copy)"},"clickEvent":{"action": "copy_to_clipboard", "value":"/setworldspawn -780 64 -245"}},{"text":"]"}]
execute as @s[tag=!success] run setworldspawn -780 64 -245
execute as @s[tag=!success] run tag @s add verify2

tag @s remove success


#Cobblemon entity existence check
execute if entity @e[x=-753,y=65,z=-243,distance=0..3,type=cobblemon:npc] run tag @s add success

execute as @s[tag=success] run tellraw @s ["",{"text":"2) "},{"text":"Cobblemon entity found.","color":"green"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"Ensures the Cobblemon mod is being used with the map."}},{"text":"]"}]
execute as @s[tag=!success] run tellraw @s[tag=!verify2] ["",{"text":"2) "},{"text":"Cobblemon entity NOT found.","color":"red"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"This map requires Cobblemon. Please ensure this is in your mods folder when you open the world. If condition #2 is green, this save must be DELETED if loaded without the mod even once. It may be possible to port player data to another save."}},{"text":"]"}]
execute as @s[tag=!success] run tellraw @s[tag=verify2] ["",{"text":"2) "},{"text":"Cobblemon entity NOT found.","color":"yellow"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"This map requires Cobblemon. Please ensure this is in your mods folder when you open the world. If condition #2 is red, this may be the result of not being able to find the test entity within spawn. See #2 info."}},{"text":"]"}]

tag @s remove success
tag @s remove verify2


#Detects if a player is stuck or currently in a dialogue
tellraw @s[scores={TalkTime=1..}] ["",{"text":"3a) "},{"text":"Score of TalkTime=1.. found.","color":"yellow"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"TalkTime is a Minecraft scoreboard objective that handles the timing of most of the map's dialogue and events. If stuck on for long and nothing around you or in chat is happening, the map may try to correct for this automatically. You can also do this manually with the command \"/scoreboard players set @s TalkTime 0\" (click to copy)"},"clickEvent":{"action": "copy_to_clipboard", "value":"/scoreboard players set @s TalkTime 0"}},{"text":"]"}]
tellraw @s[scores={DialogueTrigger=1..}] ["",{"text":"3b) "},{"text":"Score of DialogueTrigger=1.. found.","color":"yellow"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"DialogueTrigger is a Minecraft scoreboard objective that which dialogue or event the player is currently interacting with."}},{"text":"]"}]
tellraw @s[tag=InDialogue] ["",{"text":"3c) "},{"text":"Player has a dialogue tag, try relogging","color":"yellow"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"Tags granted by Cobblemon NPCs keep dialogue boxes from popping up over and over. If present, prevents some commands."}},{"text":"]"}]
tellraw @s[scores={TalkTime=0,DialogueTrigger=0},tag=!InDialogue] ["",{"text":"3) "},{"text":"Player confirmed not in dialogue.","color":"green"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"Ensures the player is not currently in a map event or dialogue that may affect some functions such as portals or fly map functions."}},{"text":"]"}]

tag @s[scores={TalkTime=0..,DialogueTrigger=0..}] add success
execute as @s[tag=success] run tellraw @s ["",{"text":"4) "},{"text":"Player has initial scores.","color":"green"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"When a player first spawns in, many values are applied to your character that make the map function."}},{"text":"]"}]
execute as @s[tag=!success] run tellraw @s ["",{"text":"4) "},{"text":"Player does not have initial scores.","color":"red"},{"text":" ["},{"text":"Info","hoverEvent":{"action":"show_text","value":"When a player first spawns in, many values are applied to your character that make the map function. To fix, try returning to the very start with \"/tp @s -780 64 -245\" (click to copy)"},"clickEvent":{"action": "copy_to_clipboard", "value":"/tp @s -780 64 -245"}},{"text":"]"}]

tag @s remove success


#Activates command block to confirm they're enabled
#Scheduled function checks if infoverify tag is still present, meaning command blocks aren't enabled
setblock -771 64 -242 minecraft:redstone_block
tag @s add infoverify
schedule function tools:commandblocksdisabled 2t


#Resets score if player used triggers to activate
scoreboard players set @s info 0
scoreboard players set @s Info 0