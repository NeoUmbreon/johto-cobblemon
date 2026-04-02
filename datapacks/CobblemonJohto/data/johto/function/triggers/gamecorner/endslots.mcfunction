#Diamond - 51
$execute as @s[scores={SlotRNG$(num)=51}] run scoreboard players add @s Coins 100
$execute as @s[scores={SlotRNG$(num)=51}] run tellraw @s {"text":"You won 100 coins!","italic":true,"color":"gray"}
$execute as @s[scores={SlotRNG$(num)=51}] positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"present",category:"block"}
$execute as @s[scores={SlotRNG$(num)=51}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",has_twinkle:0,has_trail:1,colors:[I;6719955],fade_colors:[I;15790320]}]}}}}

#Gold - 57
$execute as @s[scores={SlotRNG$(num)=57}] run scoreboard players add @s Coins 25
$execute as @s[scores={SlotRNG$(num)=57}] run tellraw @s {"text":"You won 25 coins!","italic":true,"color":"gray"}
$execute as @s[scores={SlotRNG$(num)=57}] positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"present",category:"block"}
#$execute as @s[scores={SlotRNG$(num)=57}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"small_ball",has_trail:0,colors:[I;14602026]}]}}}}

#Iron - 61
$execute as @s[scores={SlotRNG$(num)=61}] run scoreboard players add @s Coins 10
$execute as @s[scores={SlotRNG$(num)=61}] run tellraw @s {"text":"You won 10 coins!","italic":true,"color":"gray"}
$execute as @s[scores={SlotRNG$(num)=61}] positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"present",category:"block"}

#Darn!
$execute unless score @s SlotRNG$(num) matches 47 unless score @s SlotRNG$(num) matches 51 unless score @s SlotRNG$(num) matches 57 unless score @s SlotRNG$(num) matches 61 positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run playsound minecraft:entity.player.burp block @a

#Return unless Emerald
function johto:triggers/gamecorner/coinbal
$execute unless score @s SlotRNG$(num) matches 47 positioned $(armor_stand_pos) run tag @e[distance=0,limit=1] remove SlotRolled
$execute unless score @s SlotRNG$(num) matches 47 run scoreboard players set @s SlotTimer$(num) 0
$execute unless score @s SlotRNG$(num) matches 47 run return run scoreboard players set @s SlotRNG$(num) 0

#Emerald - 47
$execute as @s[scores={SlotTimer$(num)=150}] run scoreboard players add @s Coins 700
$execute as @s[scores={SlotTimer$(num)=150}] run tellraw @s {"text":"You won 700 coins!","italic":true,"color":"gray"}
$execute as @s[scores={SlotTimer$(num)=150}] positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"2ndplace",category:"block"}

$execute as @s[scores={SlotTimer$(num)=150}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",has_trail:1,colors:[I;4312372],fade_colors:[I;15790320]}]}}}}
$execute as @s[scores={SlotTimer$(num)=170}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",has_trail:1,colors:[I;4312372],fade_colors:[I;15790320]}]}}}}
$execute as @s[scores={SlotTimer$(num)=190}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:10,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"burst",has_trail:1,colors:[I;4312372],fade_colors:[I;15790320]}]}}}}
$execute as @s[scores={SlotTimer$(num)=210}] run summon minecraft:firework_rocket ~ 67 ~1 {LifeTime:20,FireworksItem:{id:firework_rocket,components:{fireworks:{explosions:[{shape:"small_ball",has_twinkle:0,has_trail:0,colors:[I;15790320]},{shape:"large_ball",has_twinkle:1,has_trail:1,colors:[I;4312372],fade_colors:[I;15790320]}]}}}}

$execute as @s[scores={SlotTimer$(num)=150}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
$execute as @s[scores={SlotTimer$(num)=156}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air
$execute as @s[scores={SlotTimer$(num)=170}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
$execute as @s[scores={SlotTimer$(num)=176}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air
$execute as @s[scores={SlotTimer$(num)=190}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
$execute as @s[scores={SlotTimer$(num)=196}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air
$execute as @s[scores={SlotTimer$(num)=210}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
$execute as @s[scores={SlotTimer$(num)=226}] positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air


$execute as @s[scores={SlotTimer$(num)=230}] positioned $(armor_stand_pos) run tag @e[distance=0,limit=1] remove SlotRolled
$execute as @s[scores={SlotTimer$(num)=230}] run scoreboard players set @s SlotRNG$(num) 0
$execute as @s[scores={SlotTimer$(num)=230}] run scoreboard players set @s SlotTimer$(num) 0