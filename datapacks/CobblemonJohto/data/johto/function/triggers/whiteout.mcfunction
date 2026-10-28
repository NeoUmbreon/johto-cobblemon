tag @s remove Whiteout
scoreboard players set @s BattleStart 0
function johto:tools/forceclick

#Early return
execute if entity @s[tag=WhiteoutDisable] run return 0

#Returns the player to their last-visited Pokemon Center
effect give @s minecraft:blindness 3 1 true
tellraw @s[scores={Whiteout=0}] {"text":"You scurried back home, protecting the exhausted and fainted Pokémon from further harm...","italic":true,"color":"gray"}
tellraw @s[scores={Whiteout=1..}] {"text":"You scurried to a Pokémon Center, protecting the exhausted and fainted Pokémon from further harm...","italic":true,"color":"gray"}

execute as @s[scores={Whiteout=0}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-724 64 -494 0 ~"}
execute as @s[scores={Whiteout=1}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-258.0 64 -482 0 ~"}
execute as @s[scores={Whiteout=2}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"13.0 64 -99 0 ~"}
execute as @s[scores={Whiteout=3}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"328.0 64 -718 0 ~"}
execute as @s[scores={Whiteout=4}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"497.0 64 -414 0 ~"}
execute as @s[scores={Whiteout=5}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"339.0 64 193 0 ~"}
execute as @s[scores={Whiteout=6}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"789.0 64 -31 0 ~"}
execute as @s[scores={Whiteout=7}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"1184.0 64 -459 0 ~"}
execute as @s[scores={Whiteout=8}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"1615.0 88 -150 0 ~"}
execute as @s[scores={Whiteout=9}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-179.0 64 170 0 ~"}
execute as @s[scores={Whiteout=10}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-665.0 64 181 0 ~"}
execute as @s[scores={Whiteout=11}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1001.0 64 72 0 ~"}
execute as @s[scores={Whiteout=12}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1296.0 84 331 0 ~"}
execute as @s[scores={Whiteout=13}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1711.0 64 -886 0 ~"}
execute as @s[scores={Whiteout=15}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1703.0 64 17 0 ~"}
execute as @s[scores={Whiteout=16}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1662.0 64 612 0 ~"}
execute as @s[scores={Whiteout=17}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2167.0 64 759 0 ~"}
execute as @s[scores={Whiteout=18}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2746.0 64 738 0 ~"}
execute as @s[scores={Whiteout=19}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2407.0 64 -598 0 ~"}
execute as @s[scores={Whiteout=20}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2716.0 64 18 0 ~"}
execute as @s[scores={Whiteout=21}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2706.0 64 289 0 ~"}
execute as @s[scores={Whiteout=22}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2462.0 64 385 0 ~"}
execute as @s[scores={Whiteout=23}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-3255.0 64 366 0 ~"}
execute as @s[scores={Whiteout=24}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-3289.0 64 685 0 ~"}
execute as @s[scores={Whiteout=25}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"125.0 64 -572 0 ~"}


#Run dialogue
execute as @s[scores={Whiteout=0}] run opendialogue mom_whiteout @s
execute as @s[scores={Whiteout=1..}] run opendialogue nursejoy_whiteout @s