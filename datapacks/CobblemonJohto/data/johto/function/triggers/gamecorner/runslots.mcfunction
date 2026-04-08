#----------------------------------------------------------------------------------------------------------------------------
#Displays coin balance
function johto:triggers/gamecorner/coinbal
#Iterate
$scoreboard players add @s SlotTimer$(num) 1
#----------------------------------------------------------------------------------------------------------------------------
#End if SlotTimer# >= 150
$execute if score @s SlotTimer$(num) matches 150.. run return run function johto:triggers/gamecorner/endslots {num:"$(num)",armor_stand_pos:"$(armor_stand_pos)"}
#----------------------------------------------------------------------------------------------------------------------------
#Starting SFX/VFX
$execute if score @s SlotTimer$(num) matches 1 positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"payday",category:"block"}
$execute if score @s SlotTimer$(num) matches 1 positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 redstone_block
$execute if score @s SlotTimer$(num) matches 8 positioned ^ ^-2 ^1 run fill ~ ~ ~ ~ ~ ~2 air
$execute if score @s SlotTimer$(num) matches 12 positioned ~ ~0.5 ~1 positioned ^ ^ ^0.5 run function johto:sound/playglobalsfx {sfx:"slotmachinestart",category:"block"}
$execute unless score @s SlotTimer$(num) matches 12.. run return 1
#----------------------------------------------------------------------------------------------------------------------------
#At specific SlotTimer# thresholds, iterate y-value
$scoreboard players remove @s[scores={SlotTimer$(num)=12..81}] SlotRNG$(num) 1
#Bigger increments, slows down animation
$scoreboard players remove @s[scores={SlotTimer$(num)=83}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=85}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=87}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=89}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=91}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=93}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=95}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=97}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=99}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=101}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=103}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=105}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=107}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=109}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=111}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=114}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=117}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=120}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=123}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=126}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=129}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=133}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=137}] SlotRNG$(num) 1
$scoreboard players remove @s[scores={SlotTimer$(num)=141}] SlotRNG$(num) 1

#Lower Bounds = 42
$scoreboard players set @s[scores={SlotRNG$(num)=42}] SlotRNG$(num) 62

#Clone Blocks (43-62)
#could write and read from command storage instead to make these a one-liner but eughhghhh
$execute if score @s SlotRNG$(num) matches 43 run return run function johto:triggers/gamecorner/spin {y:43}
$execute if score @s SlotRNG$(num) matches 44 run return run function johto:triggers/gamecorner/spin {y:44}
$execute if score @s SlotRNG$(num) matches 45 run return run function johto:triggers/gamecorner/spin {y:45}
$execute if score @s SlotRNG$(num) matches 46 run return run function johto:triggers/gamecorner/spin {y:46}
$execute if score @s SlotRNG$(num) matches 47 run return run function johto:triggers/gamecorner/spin {y:47}
$execute if score @s SlotRNG$(num) matches 48 run return run function johto:triggers/gamecorner/spin {y:48}
$execute if score @s SlotRNG$(num) matches 49 run return run function johto:triggers/gamecorner/spin {y:49}
$execute if score @s SlotRNG$(num) matches 50 run return run function johto:triggers/gamecorner/spin {y:50}
$execute if score @s SlotRNG$(num) matches 51 run return run function johto:triggers/gamecorner/spin {y:51}
$execute if score @s SlotRNG$(num) matches 52 run return run function johto:triggers/gamecorner/spin {y:52}
$execute if score @s SlotRNG$(num) matches 53 run return run function johto:triggers/gamecorner/spin {y:53}
$execute if score @s SlotRNG$(num) matches 54 run return run function johto:triggers/gamecorner/spin {y:54}
$execute if score @s SlotRNG$(num) matches 55 run return run function johto:triggers/gamecorner/spin {y:55}
$execute if score @s SlotRNG$(num) matches 56 run return run function johto:triggers/gamecorner/spin {y:56}
$execute if score @s SlotRNG$(num) matches 57 run return run function johto:triggers/gamecorner/spin {y:57}
$execute if score @s SlotRNG$(num) matches 58 run return run function johto:triggers/gamecorner/spin {y:58}
$execute if score @s SlotRNG$(num) matches 59 run return run function johto:triggers/gamecorner/spin {y:59}
$execute if score @s SlotRNG$(num) matches 60 run return run function johto:triggers/gamecorner/spin {y:60}
$execute if score @s SlotRNG$(num) matches 61 run return run function johto:triggers/gamecorner/spin {y:61}
$execute if score @s SlotRNG$(num) matches 62 run return run function johto:triggers/gamecorner/spin {y:62}