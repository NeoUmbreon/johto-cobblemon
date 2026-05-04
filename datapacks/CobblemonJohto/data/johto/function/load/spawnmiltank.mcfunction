#Summons uncatchable, noAI Miltank
forceload add 779 201
execute unless entity @e[x=779,y=64,z=201,type=cobblemon:pokemon,tag=InitialSetup] run pokespawnat 779 64 201 miltank no_ai=yes uncatchable=yes level=10
execute as @e[x=779,y=64,z=201,tag=!InitialSetup,type=cobblemon:pokemon,nbt={Pokemon:{Species:"cobblemon:miltank",PokemonOriginalTrainerType:"NONE"}}] run tag @s add InitialSetup
execute as @e[x=779,y=64,z=201,type=cobblemon:pokemon,tag=InitialSetup] at @s run tp @s ~ ~ ~ -180 ~
execute as @e[x=779,y=64,z=201,type=cobblemon:pokemon,tag=InitialSetup] run data modify entity @s PersistenceRequired set value 1b
execute as @e[x=779,y=64,z=201,type=cobblemon:pokemon,tag=InitialSetup] run data modify entity @s Unbattleable set value 1b
execute as @e[x=779,y=64,z=201,type=cobblemon:pokemon,tag=InitialSetup] run data modify entity @s Invulnerable set value true
execute as @e[x=779,y=64,z=201,type=cobblemon:pokemon,tag=InitialSetup] run data merge entity @s {Pokemon:{PokemonData:["uncatchable"]}}
