# If location hasn't changed, exit
$execute if score @s MusicTitles matches $(location) run return 0

# Big title unless exiting interior
$execute unless score @s MusicTitles matches 201..300 run title @s title {"text":"$(text)","color":"$(color)"}
$execute unless score @s MusicTitles matches 201..300 run title @s subtitle {"text":"$(subtext)","italic":true}

# Small title if exiting interior
$execute if score @s MusicTitles matches 201..300 run title @s actionbar {"text":"$(text)"}

# Update score and/or music
$function johto:world/musictitles/updatelocation {location:"$(location)",includes:"$(includes)"}