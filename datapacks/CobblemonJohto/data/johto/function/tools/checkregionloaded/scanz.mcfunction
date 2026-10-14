$scoreboard players set #x1 click $(x1)
$execute store success score #x_loaded click run function johto:tools/checkregionloaded/scanx {x2:$(x2)}
execute unless score #x_loaded click matches 1 run return fail

execute if score #z1 click >= #z2 click run return 1

scoreboard players add #z1 click 16
$execute if score #z1 click > #z2 click positioned ~ ~ $(z2) run return run function johto:tools/checkregionloaded/scanz {x1:$(x1),x2:$(x2),z2:$(z2)}
$execute positioned ~ ~ ~16 run return run function johto:tools/checkregionloaded/scanz {x1:$(x1),x2:$(x2),z2:$(z2)}