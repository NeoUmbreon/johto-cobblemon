$execute positioned $(destination) run fillbiome ~ ~3 ~ ~123 ~20 ~95 badlands

#79 - 81: Base
$execute positioned $(destination) run fill ~ ~ ~ ~123 ~2 ~95 stone
#82 - 92/93: Clone
$execute positioned $(destination) run clone -879 14 -145 -821 24 -240 ~ ~3 ~ replace
$execute positioned $(destination) run clone -879 1 -145 -815 12 -240 ~59 ~3 ~ replace
#93/94 - 105: Clear
$execute positioned $(destination) run fill ~ ~14 ~ ~58 ~26 ~95 air
$execute positioned $(destination) run fill ~59 ~15 ~ ~123 ~26 ~95 air