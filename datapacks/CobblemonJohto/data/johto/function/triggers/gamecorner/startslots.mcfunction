#Odds (want them to be so the player wins not most of the time but comes out on top after a long while of trying)
#1/128    1          - triple emerald, player wins jackpot, +700
#6/128    2-7        - triple diamond, player wins big, +100
#16/128   8-23       - triple gold, player wins medium, +25
#41/128   24-64      - triple iron, player wins roll, +10
#64/128   65-128     - No wins
#comment: these odds are absolutely fucked
#-----------------------------------------------------------------------------------------------------------------------------------------
#Resets button (avoids repeating in case of failure)
$setblock $(button_pos) stone_button[powered=false,facing=$(facing)]

#Returns
#No Coin Case
execute as @s[tag=!CoinCase] run return run tellraw @s {"text":"You need a Coin Case to play the slot machines!","italic":true,"color":"gray"}
#Poor :(
execute unless score @s Coins matches 1.. run return run tellraw @s {"text":"You need a coin to play the slot machines!","italic":true,"color":"gray"}

#Else:
#Insert coin
scoreboard players remove @s Coins 1
#Marks respective armor stand as active to lock slot machine from being restarted and to activate the ticking function
tag @e[distance=0,limit=1] add SlotRolled
#Displays coin balance
function johto:triggers/gamecorner/coinbal

#Just in case
$scoreboard players set @s SlotTimer$(num) 0
#Rolls RNG
$execute store result score @s SlotRNG$(num) run random value 1..128
#For testing
$execute if score @s RigSlots matches 1..128 run scoreboard players operation @s SlotRNG$(num) = @s RigSlots

#Translates RNG Score to y-coordinate roll should start at (43-62)
#Emerald
$execute if score @s SlotRNG$(num) matches 1 run return run scoreboard players set @s SlotRNG$(num) 61
#Diamond
$execute if score @s SlotRNG$(num) matches 2..7 run return run scoreboard players set @s SlotRNG$(num) 45
#Gold
$execute if score @s SlotRNG$(num) matches 8..23 run return run scoreboard players set @s SlotRNG$(num) 51
#Iron
$execute if score @s SlotRNG$(num) matches 24..64 run return run scoreboard players set @s SlotRNG$(num) 55
#L1
$execute if score @s SlotRNG$(num) matches 65..68 run return run scoreboard players set @s SlotRNG$(num) 57
#L2
$execute if score @s SlotRNG$(num) matches 69..72 run return run scoreboard players set @s SlotRNG$(num) 58
#L3
$execute if score @s SlotRNG$(num) matches 73..76 run return run scoreboard players set @s SlotRNG$(num) 59
#L4
$execute if score @s SlotRNG$(num) matches 77..80 run return run scoreboard players set @s SlotRNG$(num) 60
#L5
$execute if score @s SlotRNG$(num) matches 81..84 run return run scoreboard players set @s SlotRNG$(num) 62
#L6
$execute if score @s SlotRNG$(num) matches 85..88 run return run scoreboard players set @s SlotRNG$(num) 43
#L7
$execute if score @s SlotRNG$(num) matches 89..92 run return run scoreboard players set @s SlotRNG$(num) 44
#L8
$execute if score @s SlotRNG$(num) matches 93..96 run return run scoreboard players set @s SlotRNG$(num) 46
#L9
$execute if score @s SlotRNG$(num) matches 97..100 run return run scoreboard players set @s SlotRNG$(num) 47
#L10
$execute if score @s SlotRNG$(num) matches 101..104 run return run scoreboard players set @s SlotRNG$(num) 48
#L11
$execute if score @s SlotRNG$(num) matches 105..108 run return run scoreboard players set @s SlotRNG$(num) 49
#L12
$execute if score @s SlotRNG$(num) matches 109..112 run return run scoreboard players set @s SlotRNG$(num) 50
#L13
$execute if score @s SlotRNG$(num) matches 113..116 run return run scoreboard players set @s SlotRNG$(num) 52
#L14
$execute if score @s SlotRNG$(num) matches 117..120 run return run scoreboard players set @s SlotRNG$(num) 53
#L15
$execute if score @s SlotRNG$(num) matches 121..124 run return run scoreboard players set @s SlotRNG$(num) 54
#L16
$execute if score @s SlotRNG$(num) matches 125..128 run return run scoreboard players set @s SlotRNG$(num) 56