# If location hasn't changed, exit
$execute if score @s MusicTitles matches $(location) run return 0

# Small title
$title @s actionbar {"text":"$(text)"}

# Update score and/or music
$function johto:world/musictitles/updatelocation {location:"$(location)",includes:"$(includes)"}