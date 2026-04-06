# Make sure execution position is set with "at" or "positioned"

$execute at @n[type=cobblemon:pokemon,distance=..$(distance),nbt={Pokemon:{Species:"cobblemon:$(species)",PokemonOriginalTrainerType:"NONE"}}] run playsound common/cries/$(species) neutral @a ~ ~ ~ $(volume)