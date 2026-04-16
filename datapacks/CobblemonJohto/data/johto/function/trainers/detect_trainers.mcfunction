# return if already defeated or if match already found for player/npc
$execute unless entity @p[tag=!defeated.$(trainer_id),tag=!InDialogue,distance=0] run return fail
execute unless entity @s[tag=!trainerBusy] run return fail

# open dialogue
tag @s add trainerBusy
$tag @p[tag=!defeated.$(trainer_id),distance=0] add InDialogue
$opendialogue $(trainer_id)_interaction @p[tag=!defeated.$(trainer_id),distance=0]
