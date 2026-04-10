# Timings and logic for GB dialogue music intros

# Oak's Welcome
execute if score @s DialogueMusic matches 1 run return run function johto:sound/playrecord {track:"gb/routes/30intro", duration:95}

# Mom
execute if score @s DialogueMusic matches 2 run return run function johto:sound/playrecord {track:"gb/npc/hurryalongintro", duration:14}

# Guide Gent
execute if score @s DialogueMusic matches 3 run return run function johto:sound/playrecord {track:"gb/npc/hurryalong2intro", duration:73}

# Prof. Oak
execute if score @s DialogueMusic matches 4 run return run function johto:sound/playrecord {track:"gb/npc/professoroakintro", duration:304}

# Rival (No Battle)
execute if score @s DialogueMusic matches 5 run return run function johto:sound/playrecord {track:"gb/npc/rival2intro", duration:29}

# Clair
execute if score @s DialogueMusic matches 6 run return run function johto:sound/playrecord {track:"gb/npc/clairintro", duration:69}

# Eusine (Unimplemented?)
execute if score @s DialogueMusic matches 7 run return run function johto:sound/playrecord {track:"gb/npc/eusineintro", duration:17}