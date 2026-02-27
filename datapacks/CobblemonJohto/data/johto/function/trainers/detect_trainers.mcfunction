# return if already defeated
$execute unless entity @a[tag=!defeated.$(trainer_id),distance=..6] run return 1

# open dialogue
tag @s add trainerBusy
$opendialogue $(trainer_id)_interaction @p[tag=!defeated.$(trainer_id),distance=..6]