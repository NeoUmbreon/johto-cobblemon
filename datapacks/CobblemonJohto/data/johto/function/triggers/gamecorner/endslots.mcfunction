#Diamond - 51
$execute as @s[scores={SlotRNG=51}] run scoreboard players add @a[tag=RolledSlot$(num)] Coins 100
$execute as @s[scores={SlotRNG=51}] run tellraw @a[tag=RolledSlot$(num)] {"text":"You won 100 coins!","italic":true,"color":"gray"}
execute as @s[scores={SlotRNG=51}] positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"present",category:"block"}
execute as @s[scores={SlotRNG=51}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",has_twinkle:0b,has_trail:1b,colors:[I;6719955],fade_colors:[I;15790320]}]}}}}

#Gold - 57
$execute as @s[scores={SlotRNG=57}] run scoreboard players add @a[tag=RolledSlot$(num)] Coins 25
$execute as @s[scores={SlotRNG=57}] run tellraw @a[tag=RolledSlot$(num)] {"text":"You won 25 coins!","italic":true,"color":"gray"}
execute as @s[scores={SlotRNG=57}] positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"present",category:"block"}
#execute as @s[scores={SlotRNG=57}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"small_ball",has_trail:0b,colors:[I;14602026]}]}}}}

#Iron - 61
$execute as @s[scores={SlotRNG=61}] run scoreboard players add @a[tag=RolledSlot$(num)] Coins 10
$execute as @s[scores={SlotRNG=61}] run tellraw @a[tag=RolledSlot$(num)] {"text":"You won 10 coins!","italic":true,"color":"gray"}
execute as @s[scores={SlotRNG=61}] positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"present",category:"block"}

#Darn!
execute unless score @s SlotRNG matches 47 unless score @s SlotRNG matches 51 unless score @s SlotRNG matches 57 unless score @s SlotRNG matches 61 positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"slotmachinelose",category:"block"}

#Return unless Emerald
$execute as @a[tag=RolledSlot$(num)] run function johto:triggers/gamecorner/coinbal
$execute unless score @s SlotRNG matches 47 run tag @a remove RolledSlot$(num)
execute unless score @s SlotRNG matches 47 run tag @s remove SlotRolled
execute unless score @s SlotRNG matches 47 run scoreboard players set @s SlotTimer 0
execute unless score @s SlotRNG matches 47 run return run scoreboard players set @s SlotRNG 0

#Emerald - 47
$execute as @s[scores={SlotTimer=150}] run scoreboard players add @a[tag=RolledSlot$(num)] Coins 700
$execute as @s[scores={SlotTimer=150}] run tellraw @a[tag=RolledSlot$(num)] {"text":"You won 700 coins!","italic":true,"color":"gray"}
execute as @s[scores={SlotTimer=150}] positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"2ndplace",category:"block"}

execute as @s[scores={SlotTimer=150}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",has_trail:1b,colors:[I;4312372],fade_colors:[I;15790320]}]}}}}
execute as @s[scores={SlotTimer=170}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",has_trail:1b,colors:[I;4312372],fade_colors:[I;15790320]}]}}}}
execute as @s[scores={SlotTimer=190}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",has_trail:1b,colors:[I;4312372],fade_colors:[I;15790320]}]}}}}
execute as @s[scores={SlotTimer=210}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:20,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"small_ball",has_twinkle:0b,has_trail:0b,colors:[I;15790320]},{shape:"large_ball",has_twinkle:1b,has_trail:1b,colors:[I;4312372],fade_colors:[I;15790320]}]}}}}

execute as @s[scores={SlotTimer=150}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
execute as @s[scores={SlotTimer=156}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air
execute as @s[scores={SlotTimer=170}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
execute as @s[scores={SlotTimer=176}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air
execute as @s[scores={SlotTimer=190}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
execute as @s[scores={SlotTimer=196}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air
execute as @s[scores={SlotTimer=210}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
execute as @s[scores={SlotTimer=226}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air

$execute as @s[scores={SlotTimer=230}] run tag @a remove RolledSlot$(num)
execute as @s[scores={SlotTimer=230}] run tag @s remove SlotRolled
execute as @s[scores={SlotTimer=230}] run scoreboard players set @s SlotRNG 0
execute as @s[scores={SlotTimer=230}] run scoreboard players set @s SlotTimer 0