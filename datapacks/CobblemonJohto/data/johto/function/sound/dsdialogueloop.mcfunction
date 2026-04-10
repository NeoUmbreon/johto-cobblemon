# Timings and logic for DS dialogue music loops

# Oak's Welcome
execute if score @s DialogueMusic matches 1 run return run function johto:sound/playrecord {track:"ds/routes/30", duration:1540}

# Mom
execute if score @s DialogueMusic matches 2 run return run function johto:sound/playrecord {track:"ds/npc/hurryalong", duration:660}

# Guide Gent
execute if score @s DialogueMusic matches 3 run return run function johto:sound/playrecord {track:"ds/npc/hurryalong2", duration:1620}

# Prof. Oak
execute if score @s DialogueMusic matches 4 run return run function johto:sound/playrecord {track:"ds/npc/professoroak", duration:1920}

# Rival (No Battle)
execute if score @s DialogueMusic matches 5 run return run function johto:sound/playrecord {track:"ds/npc/rival2", duration:1060}

# Clair
execute if score @s DialogueMusic matches 6 run return run function johto:sound/playrecord {track:"ds/npc/clair", duration:820}

# Eusine (Unimplemented?)
execute if score @s DialogueMusic matches 7 run return run function johto:sound/playrecord {track:"ds/npc/eusine", duration:1140}