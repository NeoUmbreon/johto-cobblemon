# ALWAYS invoke this at @s!

$tp @s $(xyz)
$function johto:sound/playglobalsfx {sfx:"$(sfx)",category:"player"}
$execute at @s run function johto:sound/playglobalsfx {sfx:"$(sfx)",category:"player"}

#$playsound gb/sfx/$(sfx) player @a ~ ~ ~
#$playsound gb/sfx/$(sfx) player @a $(xyz)