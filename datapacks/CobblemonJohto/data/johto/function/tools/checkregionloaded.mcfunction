# returns 1 if ALL chunks in rectangular region are fully loaded; else returns fail
# vars: $(x1) $(x2) $(z1) $(z2)
# y-pos is irrelevant

$scoreboard players set #x1 click $(x1)
$scoreboard players set #x2 click $(x2)
$scoreboard players set #z1 click $(z1)
$scoreboard players set #z2 click $(z2)

# ensure x1 <= x2 and z1 <= z2
$execute if score #x1 click > #x2 click run return run function johto:tools/checkregionloaded {x1:$(x2),x2:$(x1),z1:$(z1),z2:$(z2)}
$execute if score #z1 click > #z2 click run return run function johto:tools/checkregionloaded {x1:$(x1),x2:$(x2),z1:$(z2),z2:$(z1)}

$execute positioned $(x1) 0 $(z1) run return run function johto:tools/checkregionloaded/scanz {x1:$(x1),x2:$(x2),z2:$(z2)}