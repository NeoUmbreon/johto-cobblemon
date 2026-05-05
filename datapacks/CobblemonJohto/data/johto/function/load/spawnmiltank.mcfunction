#Summons uncatchable, noAI Miltank
forceload add ~ ~
pokespawnat ~ ~ ~ miltank no_ai=yes uncatchable=yes level=10
data modify entity @n[type=cobblemon:pokemon,distance=0] PersistenceRequired set value 1b
data modify entity @n[type=cobblemon:pokemon,distance=0] Unbattleable set value 1b
data modify entity @n[type=cobblemon:pokemon,distance=0] Invulnerable set value true
data merge entity @n[type=cobblemon:pokemon,distance=0] {Pokemon:{PokemonData:["uncatchable"]}}
tp @n[type=cobblemon:pokemon,distance=0] ~ ~ ~ ~ ~
forceload remove ~ ~