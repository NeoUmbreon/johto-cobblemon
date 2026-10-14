execute unless loaded ~ ~ ~ run return fail

execute if score #x1 click >= #x2 click run return 1

scoreboard players add #x1 click 16
$execute if score #x1 click > #x2 click positioned $(x2) ~ ~ run return run function johto:tools/checkregionloaded/scanx {x2:$(x2)}
$execute positioned ~16 ~ ~ run return run function johto:tools/checkregionloaded/scanx {x2:$(x2)}