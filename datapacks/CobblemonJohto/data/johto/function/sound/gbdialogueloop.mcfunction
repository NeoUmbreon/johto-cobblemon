# Timings and logic for GB dialogue music loops

# Oak's Welcome
execute if score @s DialogueMusic matches 1 run return run function johto:sound/playrecord {track:"gb/routes/30", duration:579}

# Mom
execute if score @s DialogueMusic matches 2 run return run function johto:sound/playrecord {track:"gb/npc/hurryalong", duration:145}

# Guide Gent
execute if score @s DialogueMusic matches 3 run return run function johto:sound/playrecord {track:"gb/npc/hurryalong2", duration:434}

# Prof. Oak
execute if score @s DialogueMusic matches 4 run return run function johto:sound/playrecord {track:"gb/npc/professoroak", duration:237}

# Rival (No Battle)
execute if score @s DialogueMusic matches 5 run return run function johto:sound/playrecord {track:"gb/npc/rival2", duration:450}

# Clair
execute if score @s DialogueMusic matches 6 run return run function johto:sound/playrecord {track:"gb/npc/clair", duration:273}

# Eusine (Unimplemented?)
execute if score @s DialogueMusic matches 7 run return run function johto:sound/playrecord {track:"gb/npc/eusine", duration:547}