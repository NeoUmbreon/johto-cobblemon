# return if already defeated
#$execute unless entity @p[tag=!defeated.$(trainer_id),distance=0] run return 1

# open dialogue
#tag @s add trainerBusy
$opendialogue $(trainer_id)_interaction @p[tag=!defeated.$(trainer_id),distance=0]
