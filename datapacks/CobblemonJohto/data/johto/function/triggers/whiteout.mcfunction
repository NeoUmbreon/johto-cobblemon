#Returns the player to their last-visited Pokemon Center if they lose or forefit a battle



effect give @s minecraft:blindness 3 1 true
tellraw @s {"text":"You fled to the last safe place to heal!","italic":true,"color":"gray"}

execute as @s[scores={Whiteout=0}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-679.5 64 -480.5 -41 7"}
execute as @s[scores={Whiteout=1}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-256 64 -489"}
execute as @s[scores={Whiteout=2}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"15 64 -109"}
execute as @s[scores={Whiteout=3}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"330 64 -728"}
execute as @s[scores={Whiteout=4}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"499 64 -424"}
execute as @s[scores={Whiteout=5}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"341 64 183"}
execute as @s[scores={Whiteout=6}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"791 64 -41"}
execute as @s[scores={Whiteout=7}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"1186 64 -469"}
execute as @s[scores={Whiteout=8}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"1617 88 -160"}
execute as @s[scores={Whiteout=9}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-177 64 160"}
execute as @s[scores={Whiteout=10}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-663 64 171"}
execute as @s[scores={Whiteout=11}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-999 64 62"}
execute as @s[scores={Whiteout=12}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1292 84 322"}
execute as @s[scores={Whiteout=13}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1704 64 -899"}
execute as @s[scores={Whiteout=14}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1715 64 -321"}
execute as @s[scores={Whiteout=15}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1701 64 7"}
execute as @s[scores={Whiteout=16}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-1660 64 602"}
execute as @s[scores={Whiteout=17}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2165 64 749"}
execute as @s[scores={Whiteout=18}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2744 64 728"}
execute as @s[scores={Whiteout=19}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2405 64 -608"}
execute as @s[scores={Whiteout=20}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2714 64 8"}
execute as @s[scores={Whiteout=21}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2704 64 279"}
execute as @s[scores={Whiteout=22}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-2460 64 375"}
execute as @s[scores={Whiteout=23}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-3253 64 356"}
execute as @s[scores={Whiteout=24}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"-3287 64 675"}
execute as @s[scores={Whiteout=25}] at @s run function johto:tools/tpwithsfx {sfx:"warpfrom",xyz:"127 64 -582"}


#Heals Player's Pokemon
pokeheal @s

tag @s remove Whiteout

#