# attach trainer 
$tbcs attach tbcs:$(trainer_id) @n[type=cobblemon:npc,name=$(trainer_id_cap)]

# start battle 
$tbcs battle GEN_9_SINGLES @s vs tbcs:$(trainer_id)