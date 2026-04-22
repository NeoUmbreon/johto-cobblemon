#Stops all other "record" audio; if duration/MusicCooldown is specified, prevents forceclick until it reaches 0
#Used for SFX/oneshot-type tracks that should play instead of location music
tag @s remove Overwrite
function johto:tools/forceclick
$function johto:sound/playrecord {track:"$(track)",duration:$(duration)}

execute if score @s MusicCooldown matches 1.. run tag @s add Overwrite