#----------------------------------------------------------------------------------------------------------------------------
#Displays coin balance
$execute as @a[tag=RolledSlot$(num)] run function johto:triggers/gamecorner/coinbal
#Iterate
scoreboard players add @s SlotTimer 1
#----------------------------------------------------------------------------------------------------------------------------
#End if SlotTimer# >= 150
$execute if score @s SlotTimer matches 150.. run return run function johto:triggers/gamecorner/endslots {num:"$(num)"}
#----------------------------------------------------------------------------------------------------------------------------
#Starting SFX/VFX
execute if score @s SlotTimer matches 1 positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"payday",category:"block"}
execute if score @s SlotTimer matches 1 positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
execute if score @s SlotTimer matches 8 positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air
execute if score @s SlotTimer matches 12 positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"slotmachinestart",category:"block"}
execute unless score @s SlotTimer matches 12.. run return 1
#----------------------------------------------------------------------------------------------------------------------------
#At specific SlotTimer# thresholds, iterate y-value
scoreboard players remove @s[scores={SlotTimer=12..81}] SlotRNG 1
#Bigger increments, slows down animation
scoreboard players remove @s[scores={SlotTimer=83}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=85}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=87}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=89}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=91}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=93}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=95}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=97}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=99}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=101}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=103}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=105}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=107}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=109}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=111}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=114}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=117}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=120}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=123}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=126}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=129}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=133}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=137}] SlotRNG 1
scoreboard players remove @s[scores={SlotTimer=141}] SlotRNG 1

#Lower Bounds = 42
scoreboard players set @s[scores={SlotRNG=42}] SlotRNG 62

#Clone Blocks (43-62)
#could write and read from command storage instead to make these a one-liner but eughhghhh
execute if score @s SlotRNG matches 43 run return run clone 481 43 -372 481 43 -374 ~ ~ ~
execute if score @s SlotRNG matches 44 run return run clone 481 44 -372 481 44 -374 ~ ~ ~
execute if score @s SlotRNG matches 45 run return run clone 481 45 -372 481 45 -374 ~ ~ ~
execute if score @s SlotRNG matches 46 run return run clone 481 46 -372 481 46 -374 ~ ~ ~
execute if score @s SlotRNG matches 47 run return run clone 481 47 -372 481 47 -374 ~ ~ ~
execute if score @s SlotRNG matches 48 run return run clone 481 48 -372 481 48 -374 ~ ~ ~
execute if score @s SlotRNG matches 49 run return run clone 481 49 -372 481 49 -374 ~ ~ ~
execute if score @s SlotRNG matches 50 run return run clone 481 50 -372 481 50 -374 ~ ~ ~
execute if score @s SlotRNG matches 51 run return run clone 481 51 -372 481 51 -374 ~ ~ ~
execute if score @s SlotRNG matches 52 run return run clone 481 52 -372 481 52 -374 ~ ~ ~
execute if score @s SlotRNG matches 53 run return run clone 481 53 -372 481 53 -374 ~ ~ ~
execute if score @s SlotRNG matches 54 run return run clone 481 54 -372 481 54 -374 ~ ~ ~
execute if score @s SlotRNG matches 55 run return run clone 481 55 -372 481 55 -374 ~ ~ ~
execute if score @s SlotRNG matches 56 run return run clone 481 56 -372 481 56 -374 ~ ~ ~
execute if score @s SlotRNG matches 57 run return run clone 481 57 -372 481 57 -374 ~ ~ ~
execute if score @s SlotRNG matches 58 run return run clone 481 58 -372 481 58 -374 ~ ~ ~
execute if score @s SlotRNG matches 59 run return run clone 481 59 -372 481 59 -374 ~ ~ ~
execute if score @s SlotRNG matches 60 run return run clone 481 60 -372 481 60 -374 ~ ~ ~
execute if score @s SlotRNG matches 61 run return run clone 481 61 -372 481 61 -374 ~ ~ ~
execute if score @s SlotRNG matches 62 run return run clone 481 62 -372 481 62 -374 ~ ~ ~