#Sets carpet values based on if player does or does not have score to fly there
execute as @s[scores={FlySilver=1..}] run setblock 1169 252 619 minecraft:lime_carpet
execute as @s[scores={FlySilver=0}] run setblock 1169 252 619 minecraft:red_carpet

execute as @s[scores={FlyIndigo=1..}] run setblock 1166 252 623 minecraft:lime_carpet
execute as @s[scores={FlyIndigo=0}] run setblock 1166 252 623 minecraft:red_carpet

execute as @s[scores={FlyCinnabar=1..}] run setblock 1163 252 611 minecraft:lime_carpet
execute as @s[scores={FlyCinnabar=0}] run setblock 1163 252 611 minecraft:red_carpet

execute as @s[scores={FlySaffron=1..}] run setblock 1157 252 619 minecraft:lime_carpet
execute as @s[scores={FlySaffron=0}] run setblock 1157 252 619 minecraft:red_carpet

execute as @s[scores={FlyFuchsia=1..}] run setblock 1158 252 613 minecraft:lime_carpet
execute as @s[scores={FlyFuchsia=0}] run setblock 1158 252 613 minecraft:red_carpet

execute as @s[scores={FlyCeladon=1..}] run setblock 1160 252 619 minecraft:lime_carpet
execute as @s[scores={FlyCeladon=0}] run setblock 1160 252 619 minecraft:red_carpet

execute as @s[scores={FlyLavender=1..}] run setblock 1153 252 619 minecraft:lime_carpet
execute as @s[scores={FlyLavender=0}] run setblock 1153 252 619 minecraft:red_carpet

execute as @s[scores={FlyVermilion=1..}] run setblock 1157 252 617 minecraft:lime_carpet
execute as @s[scores={FlyVermilion=0}] run setblock 1157 252 617 minecraft:red_carpet

execute as @s[scores={FlyCerulean=1..}] run setblock 1157 252 621 minecraft:lime_carpet
execute as @s[scores={FlyCerulean=0}] run setblock 1157 252 621 minecraft:red_carpet

execute as @s[scores={FlyPewter=1..}] run setblock 1163 252 621 minecraft:lime_carpet
execute as @s[scores={FlyPewter=0}] run setblock 1163 252 621 minecraft:red_carpet

execute as @s[scores={FlyViridian=1..}] run setblock 1163 252 618 minecraft:lime_carpet
execute as @s[scores={FlyViridian=0}] run setblock 1163 252 618 minecraft:red_carpet

execute as @s[scores={FlyPallet=1..}] run setblock 1163 252 614 minecraft:lime_carpet
execute as @s[scores={FlyPallet=0}] run setblock 1163 252 614 minecraft:red_carpet

execute as @s[scores={FlyVictory=1..}] run setblock 1166 252 621 minecraft:lime_carpet
execute as @s[scores={FlyVictory=0}] run setblock 1166 252 621 minecraft:red_carpet

execute as @s[scores={FlyLake=1..}] run setblock 1174 252 624 minecraft:lime_carpet
execute as @s[scores={FlyLake=0}] run setblock 1174 252 624 minecraft:red_carpet

execute as @s[scores={FlySafari=1..}] run setblock 1187 252 617 minecraft:lime_carpet
execute as @s[scores={FlySafari=0}] run setblock 1187 252 617 minecraft:red_carpet

execute as @s[scores={FlyCherrygrove=1..}] run setblock 1175 252 615 minecraft:lime_carpet
execute as @s[scores={FlyCherrygrove=0}] run setblock 1175 252 615 minecraft:red_carpet

execute as @s[scores={FlyViolet=1..}] run setblock 1177 252 620 minecraft:lime_carpet
execute as @s[scores={FlyViolet=0}] run setblock 1177 252 620 minecraft:red_carpet

execute as @s[scores={FlyAzalea=1..}] run setblock 1179 252 612 minecraft:lime_carpet
execute as @s[scores={FlyAzalea=0}] run setblock 1179 252 612 minecraft:red_carpet

execute as @s[scores={FlyGoldenrod=1..}] run setblock 1181 252 616 minecraft:lime_carpet
execute as @s[scores={FlyGoldenrod=0}] run setblock 1181 252 616 minecraft:red_carpet

execute as @s[scores={FlyEcruteak=1..}] run setblock 1179 252 622 minecraft:lime_carpet
execute as @s[scores={FlyEcruteak=0}] run setblock 1179 252 622 minecraft:red_carpet

execute as @s[scores={FlyOlivine=1..}] run setblock 1183 252 620 minecraft:lime_carpet
execute as @s[scores={FlyOlivine=0}] run setblock 1183 252 620 minecraft:red_carpet

execute as @s[scores={FlyCianwood=1..}] run setblock 1185 252 615 minecraft:lime_carpet
execute as @s[scores={FlyCianwood=0}] run setblock 1185 252 615 minecraft:red_carpet

execute as @s[scores={FlyMahogany=1..}] run setblock 1174 252 622 minecraft:lime_carpet
execute as @s[scores={FlyMahogany=0}] run setblock 1174 252 622 minecraft:red_carpet

execute as @s[scores={FlyBlackthorn=1..}] run setblock 1171 252 622 minecraft:lime_carpet
execute as @s[scores={FlyBlackthorn=0}] run setblock 1171 252 622 minecraft:red_carpet




#Particles displaying where player can fly
execute as @s[scores={FlySilver=1..}] run particle minecraft:firework 1169 252 619 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyIndigo=1..}] run particle minecraft:firework 1166 252 623 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyCinnabar=1..}] run particle minecraft:firework 1163 252 611 0 2 0 0.1 0 normal @s
execute as @s[scores={FlySaffron=1..}] run particle minecraft:firework 1157 252 619 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyFuchsia=1..}] run particle minecraft:firework 1158 252 613 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyCeladon=1..}] run particle minecraft:firework 1160 252 619 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyLavender=1..}] run particle minecraft:firework 1153 252 619 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyVermilion=1..}] run particle minecraft:firework 1157 252 617 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyCerulean=1..}] run particle minecraft:firework 1157 252 621 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyPewter=1..}] run particle minecraft:firework 1163 252 621 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyViridian=1..}] run particle minecraft:firework 1163 252 618 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyPallet=1..}] run particle minecraft:firework 1163 252 614 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyVictory=1..}] run particle minecraft:firework 1166 252 621 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyLake=1..}] run particle minecraft:firework 1174 252 624 0 2 0 0.1 0 normal @s
execute as @s[scores={FlySafari=1..}] run particle minecraft:firework 1187 252 617 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyCherrygrove=1..}] run particle minecraft:firework 1175 252 615 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyViolet=1..}] run particle minecraft:firework 1177 252 620 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyAzalea=1..}] run particle minecraft:firework 1179 252 612 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyGoldenrod=1..}] run particle minecraft:firework 1181 252 616 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyEcruteak=1..}] run particle minecraft:firework 1179 252 622 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyOlivine=1..}] run particle minecraft:firework 1183 252 620 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyCianwood=1..}] run particle minecraft:firework 1185 252 615 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyMahogany=1..}] run particle minecraft:firework 1174 252 622 0 2 0 0.1 0 normal @s
execute as @s[scores={FlyBlackthorn=1..}] run particle minecraft:firework 1171 252 622 0 2 0 0.1 0 normal @s
#New Bark Town
execute as @s run particle minecraft:firework 1170 252 615 0 2 0 0.1 0 normal @s


#Plays arrow sound, sends player to respective towns and cities
execute as @s[x=1169,y=251,z=619,dy=3,scores={FlySilver=1..}] run function johto:hms/flymacro {xyz:"-999 64 62"}

execute as @s[x=1153,y=251,z=619,dy=3,scores={FlyLavender=1..}] run function johto:hms/flymacro {xyz:"-3253 64 356"}

execute as @s[x=1157,y=251,z=617,dy=3,scores={FlyVermilion=1..}] run function johto:hms/flymacro {xyz:"-2714 64 8"}

execute as @s[x=1157,y=251,z=619,dy=3,scores={FlySaffron=1..}] run function johto:hms/flymacro {xyz:"-2704 64 279"}

execute as @s[x=1157,y=251,z=621,dy=3,scores={FlyCerulean=1..}] run function johto:hms/flymacro {xyz:"-2744 64 728"}

execute as @s[x=1158,y=251,z=613,dy=3,scores={FlyFuchsia=1..}] run function johto:hms/flymacro {xyz:"-2405 64 -608"}

execute as @s[x=1160,y=251,z=619,dy=3,scores={FlyCeladon=1..}] run function johto:hms/flymacro {xyz:"-2460 64 375"}

execute as @s[x=1163,y=251,z=611,dy=3,scores={FlyCinnabar=1..}] run function johto:hms/flymacro {xyz:"-1709 64 -896"}

execute as @s[x=1163,y=251,z=614,dy=3,scores={FlyPallet=1..}] run function johto:hms/flymacro {xyz:"-1666 64 -291"}

execute as @s[x=1163,y=251,z=618,dy=3,scores={FlyViridian=1..}] run function johto:hms/flymacro {xyz:"-1701 64 7"}

execute as @s[x=1163,y=251,z=621,dy=3,scores={FlyPewter=1..}] run function johto:hms/flymacro {xyz:"-1660 64 602"}

execute as @s[x=1166,y=251,z=623,dy=3,scores={FlyIndigo=1..}] run function johto:hms/flymacro {xyz:"-1292 84 320"}

execute as @s[x=1171,y=251,z=622,dy=3,scores={FlyBlackthorn=1..}] run function johto:hms/flymacro {xyz:"-662 65 170"}

execute as @s[x=1174,y=251,z=622,dy=3,scores={FlyMahogany=1..}] run function johto:hms/flymacro {xyz:"-177 65 159"}

execute as @s[x=1185,y=251,z=615,dy=3,scores={FlyCianwood=1..}] run function johto:hms/flymacro {xyz:"1186 65 -471"}

execute as @s[x=1183,y=251,z=620,dy=3,scores={FlyOlivine=1..}] run function johto:hms/flymacro {xyz:"791 65 -43"}

execute as @s[x=1179,y=251,z=622,dy=3,scores={FlyEcruteak=1..}] run function johto:hms/flymacro {xyz:"341 65 182"}

execute as @s[x=1181,y=251,z=616,dy=3,scores={FlyGoldenrod=1..}] run function johto:hms/flymacro {xyz:"499 65 -426"}

execute as @s[x=1179,y=251,z=612,dy=3,scores={FlyAzalea=1..}] run function johto:hms/flymacro {xyz:"330 65 -730"}

execute as @s[x=1177,y=251,z=620,dy=3,scores={FlyViolet=1..}] run function johto:hms/flymacro {xyz:"15 65 -111"}

execute as @s[x=1175,y=251,z=615,dy=3,scores={FlyCherrygrove=1..}] run function johto:hms/flymacro {xyz:"-256 65 -493"}

#New Bark Town not requiring any score in case player tps there without unlocking anything
execute as @s[x=1170,y=251,z=615,dy=3] run function johto:hms/flymacro {xyz:"-724 65 -505"}

execute as @s[x=1187,y=251,z=617,dy=3,scores={FlySafari=1..}] run function johto:hms/flymacro {xyz:"1617 88 -161"}

execute as @s[x=1174,y=251,z=624,dy=3,scores={FlyLake=1..}] run function johto:hms/flymacro {xyz:"-143 64 558"}

execute as @s[x=1166,y=251,z=621,dy=3,scores={FlyVictory=1..}] run function johto:hms/flymacro {xyz:"-1258 64 14"}
