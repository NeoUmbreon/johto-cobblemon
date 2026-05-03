#Auto-battle scoreboard objectives
scoreboard objectives add TrainerUID dummy
scoreboard objectives add ActiveTrainer dummy
scoreboard objectives add BattleCD dummy

#Whiteout enabled by default
execute as @e[x=-792,y=65,z=-284,dy=3,tag=WhiteoutDisable,tag=!WhiteoutInitialized] run function johto:tools/togglewhiteout
execute as @e[x=-792,y=65,z=-284,dy=3] run tag @s add WhiteoutInitialized

#Clair interaction boxes
forceload add -856 720
execute positioned -856 65 720 unless entity @e[type=interaction,distance=..5] run function johto:spawn/npcboxes
execute positioned -856 65 720 if entity @e[type=interaction,distance=..5] run forceload remove -856 720

#Music scoreboard objectives
scoreboard objectives add RadioSelectTemp dummy
scoreboard objectives add DialogueMusic dummy
scoreboard objectives add MusicLoop dummy

#Surfing scoreboard objective
scoreboard objectives add SurfingCD dummy

#Game Corner scoreboard objectives
scoreboard objectives add SlotTimer1 dummy
scoreboard objectives add SlotTimer2 dummy
scoreboard objectives add SlotTimer3 dummy
scoreboard objectives add SlotTimer4 dummy
scoreboard objectives add SlotTimer5 dummy
scoreboard objectives add SlotTimer6 dummy
scoreboard objectives add SlotTimer7 dummy
scoreboard objectives add SlotTimer8 dummy
scoreboard objectives add SlotTimer9 dummy
scoreboard objectives add SlotTimer10 dummy
scoreboard objectives add SlotTimer11 dummy
scoreboard objectives add SlotTimer12 dummy
scoreboard objectives add SlotRNG1 dummy
scoreboard objectives add SlotRNG2 dummy
scoreboard objectives add SlotRNG3 dummy
scoreboard objectives add SlotRNG4 dummy
scoreboard objectives add SlotRNG5 dummy
scoreboard objectives add SlotRNG6 dummy
scoreboard objectives add SlotRNG7 dummy
scoreboard objectives add SlotRNG8 dummy
scoreboard objectives add SlotRNG9 dummy
scoreboard objectives add SlotRNG10 dummy
scoreboard objectives add SlotRNG11 dummy
scoreboard objectives add SlotRNG12 dummy

#Set max challenge distance
execute as @e[x=-792,y=65,z=-284,dy=3] run runmolang "q.set_query('x',q.entity.world.server);q.is_blank(q.x.data.max_challenge_distance) ? {q.x.data.max_challenge_distance=6;q.x.save_data;};"

#Prevent rerunning this
scoreboard players set #firstrun click 1