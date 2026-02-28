# Runs title based on player location
# Determines whether or not to refresh music based on where the player was previously


# High Priority (areas within areas)
execute if entity @s[x=-693,y=63,z=-490,dx=19,dy=5,dz=19] run return run function johto:world/musictitles/small {text:"Professor Elm's Lab", location:201, includes:""}
execute if entity @s[x=174,y=36,z=-163,dx=42,dy=22,dz=75] run return run function johto:world/musictitles/small {text:"Ruins of Alph", location:203, includes:""}
execute if entity @s[x=-992,y=59,z=-172,dx=38,dy=20,dz=50] run return run function johto:world/musictitles/small {text:"Ruins of Alph", location:204, includes:""}
execute if entity @s[x=-987,y=0,z=-492,dx=125,dy=100,dz=75] run return run function johto:world/musictitles/small {text:"Tohjo Falls", location:205, includes:""}
execute if entity @s[x=495,y=30,z=-275,dx=38,dy=22,dz=21] run return run function johto:world/musictitles/small {text:"Goldenrod Radio Tower", location:206, includes:""}
execute if entity @s[x=495,y=31,z=-249,dx=37,dy=29,dz=21] run return run function johto:world/musictitles/small {text:"Goldenrod Radio Tower", location:207, includes:""}
execute if entity @s[x=380,y=0,z=-436,dx=157,dy=62,dz=161] run return run function johto:world/musictitles/small {text:"Goldenrod Underground", location:208, includes:""}
execute if entity @s[x=-1196,y=63,z=-239,dx=46,dy=20,dz=53] run return run function johto:world/musictitles/small {text:"Embedded Tower", location:209, includes:""}
execute if entity @s[x=-3131,y=35,z=561,dx=42,dy=20,dz=36] run return run function johto:world/musictitles/small {text:"Power Plant", location:210, includes:""}
execute if entity @s[x=332,y=63,z=218,dx=22,dy=15,dz=16] run return run function johto:world/musictitles/small {text:"Dance Theater", location:211, includes:""}
execute if entity @s[x=684,y=64,z=-59,dx=43,dy=150,dz=36] run return run function johto:world/musictitles/small {text:"Olivine Lighthouse", location:212, includes:""}
execute if entity @s[x=489,y=64,z=-389,dx=31,dy=10,dz=19] run return run function johto:world/musictitles/small {text:"Game Corner", location:213, includes:""}
execute if entity @s[x=44,y=63,z=4,dx=31,dy=90,dz=31] run return run function johto:world/musictitles/small {text:"Sprout Tower", location:214, includes:""}
execute if entity @s[x=432,y=0,z=309,dx=20,dy=100,dz=20] run return run function johto:world/musictitles/small {text:"Burned Tower", location:215, includes:""}
execute if entity @s[x=240,y=63,z=297,dx=33,dy=240,dz=33] run return run function johto:world/musictitles/small {text:"Tin Tower", location:216, includes:""}
# TODO: 217 Pokemon Centers
execute if entity @s[x=-1707,y=0,z=284,dx=143,dy=256,dz=164] run return run function johto:world/musictitles/small {text:"Viridian Forest", location:218, includes:""}
# why is this here?
execute if entity @s[x=-439,y=0,z=-190,dx=131,dy=240,dz=319] run return run function johto:world/musictitles/small {text:"Dark Cave", location:10, includes:""}
execute if entity @s[x=-307,y=0,z=-94,dx=94,dy=240,dz=223] run return run function johto:world/musictitles/small {text:"Dark Cave", location:10, includes:""}


# Connected Areas with Shared Music
#-----------------------------------------------Johto-----------------------------------------------
# Routes 30-33
execute if entity @s[x=-290,y=0,z=-460,dx=176,dy=240,dz=298] run return run function johto:world/musictitles/small {text:"Route 30", location:68, includes:"unless score @s MusicTitles matches 68..71 "}
execute if entity @s[x=-290,y=0,z=-161,dx=247,dy=240,dz=75] run return run function johto:world/musictitles/small {text:"Route 31", location:69, includes:"unless score @s MusicTitles matches 68..71 "}
execute if entity @s[x=75,y=0,z=-515,dx=154,dy=240,dz=56] run return run function johto:world/musictitles/small {text:"Route 32", location:70, includes:"unless score @s MusicTitles matches 68..71 "}
execute if entity @s[x=75,y=60,z=-393,dx=154,dy=240,dz=94] run return run function johto:world/musictitles/small {text:"Route 32", location:70, includes:"unless score @s MusicTitles matches 68..71 "}
execute if entity @s[x=75,y=60,z=-671,dx=154,dy=240,dz=88] run return run function johto:world/musictitles/small {text:"Route 32", location:70, includes:"unless score @s MusicTitles matches 68..71 "}
execute if entity @s[x=75,y=60,z=-458,dx=154,dy=240,dz=64] run return run function johto:world/musictitles/small {text:"Route 32", location:70, includes:"unless score @s MusicTitles matches 68..71 "}
execute if entity @s[x=75,y=0,z=-582,dx=154,dy=240,dz=66] run return run function johto:world/musictitles/small {text:"Route 32", location:70, includes:"unless score @s MusicTitles matches 68..71 "}
execute if entity @s[x=101,y=60,z=-166,dx=58,dy=240,dz=75] run return run function johto:world/musictitles/small {text:"Route 32", location:70, includes:"unless score @s MusicTitles matches 68..71 "}
execute if entity @s[x=75,y=60,z=-300,dx=84,dy=240,dz=133] run return run function johto:world/musictitles/small {text:"Route 32", location:70, includes:"unless score @s MusicTitles matches 68..71 "}
execute if entity @s[x=50,y=61,z=-793,dx=234,dy=240,dz=121] run return run function johto:world/musictitles/small {text:"Route 33", location:71, includes:"unless score @s MusicTitles matches 68..71 "}

# Routes 34-37
execute if entity @s[x=411,y=0,z=-715,dx=104,dy=240,dz=253] run return run function johto:world/musictitles/small {text:"Route 34", location:72, includes:"unless score @s MusicTitles matches 72..75 "}
execute if entity @s[x=349,y=58,z=-266,dx=239,dy=240,dz=198] run return run function johto:world/musictitles/small {text:"Route 35", location:73, includes:"unless score @s MusicTitles matches 72..75 "}
execute if entity @s[x=191,y=0,z=-89,dx=140,dy=240,dz=100] run return run function johto:world/musictitles/small {text:"Route 36", location:74, includes:"unless score @s MusicTitles matches 72..75 "}
execute if entity @s[x=332,y=0,z=-67,dx=130,dy=240,dz=103] run return run function johto:world/musictitles/small {text:"Route 36", location:74, includes:"unless score @s MusicTitles matches 72..75 "}
execute if entity @s[x=319,y=0,z=37,dx=82,dy=240,dz=126] run return run function johto:world/musictitles/small {text:"Route 37", location:75, includes:"unless score @s MusicTitles matches 72..75 "}

# Routes 38-39
execute if entity @s[x=611,y=0,z=166,dx=86,dy=240,dz=139] run return run function johto:world/musictitles/small {text:"Route 38", location:76, includes:"unless score @s MusicTitles matches 76..77 "}
execute if entity @s[x=698,y=0,z=207,dx=177,dy=240,dz=98] run return run function johto:world/musictitles/small {text:"Route 38", location:76, includes:"unless score @s MusicTitles matches 76..77 "}
execute if entity @s[x=499,y=0,z=166,dx=111,dy=240,dz=139] run return run function johto:world/musictitles/small {text:"Route 38", location:76, includes:"unless score @s MusicTitles matches 76..77 "}
execute if entity @s[x=698,y=0,z=129,dx=177,dy=240,dz=77] run return run function johto:world/musictitles/small {text:"Route 39", location:77, includes:"unless score @s MusicTitles matches 76..77 "}
execute if entity @s[x=639,y=0,z=41,dx=236,dy=240,dz=87] run return run function johto:world/musictitles/small {text:"Route 39", location:77, includes:"unless score @s MusicTitles matches 76..77 "}

# Routes 40-41
execute if entity @s[x=837,y=0,z=-97,dx=147,dy=240,dz=81] run return run function johto:world/musictitles/small {text:"Route 40", location:78, includes:"unless score @s MusicTitles matches 78..79 "}
execute if entity @s[x=870,y=0,z=-280,dx=281,dy=240,dz=182] run return run function johto:world/musictitles/small {text:"Route 40", location:78, includes:"unless score @s MusicTitles matches 78..79 "}
execute if entity @s[x=870,y=0,z=-525,dx=281,dy=240,dz=44] run return run function johto:world/musictitles/small {text:"Route 41", location:79, includes:"unless score @s MusicTitles matches 78..79 "}

# Routes 42-44 and Lake of Rage
execute if entity @s[x=-290,y=0,z=555,dx=295,dy=240,dz=225] run return run function johto:world/musictitles/small {text:"Lake of Rage", location:23, includes:"unless score @s MusicTitles matches 23 unless score @s MusicTitles matches 80..82 "}
execute if entity @s[x=-96,y=63,z=120,dx=329,dy=239,dz=98] run return run function johto:world/musictitles/small {text:"Route 42", location:80, includes:"unless score @s MusicTitles matches 23 unless score @s MusicTitles matches 80..82 "}
execute if entity @s[x=-214,y=0,z=245,dx=130,dy=240,dz=768] run return run function johto:world/musictitles/small {text:"Route 43", location:81, includes:"unless score @s MusicTitles matches 23 unless score @s MusicTitles matches 80..82 "}
execute if entity @s[x=-536,y=63,z=132,dx=321,dy=240,dz=102] run return run function johto:world/musictitles/small {text:"Route 44", location:82, includes:"unless score @s MusicTitles matches 23 unless score @s MusicTitles matches 80..82 "}

# Routes 45-46
execute if entity @s[x=-676,y=0,z=-369,dx=146,dy=240,dz=493] run return run function johto:world/musictitles/small {text:"Route 45", location:83, includes:"unless score @s MusicTitles matches 83..84 "}
execute if entity @s[x=-529,y=0,z=-468,dx=129,dy=240,dz=200] run return run function johto:world/musictitles/small {text:"Route 46", location:84, includes:"unless score @s MusicTitles matches 83..84 "}

# Routes 47-48
execute if entity @s[x=1321,y=0,z=-487,dx=389,dy=256,dz=150] run return run function johto:world/musictitles/small {text:"Route 47", location:85, includes:"unless score @s MusicTitles matches 85..86 "}
execute if entity @s[x=1499,y=64,z=-336,dx=196,dy=256,dz=126] run return run function johto:world/musictitles/small {text:"Route 48", location:86, includes:"unless score @s MusicTitles matches 85..86 "}


#-----------------------------------------------Kanto-----------------------------------------------
# Routes 26-27
execute if entity @s[x=-1343,y=0,z=-459,dx=126,dy=240,dz=473] run return run function johto:world/musictitles/small {text:"Route 26", location:64, includes:"unless score @s MusicTitles matches 64..65 "}
execute if entity @s[x=-1343,y=0,z=-588,dx=190,dy=240,dz=128] run return run function johto:world/musictitles/small {text:"Route 27", location:65, includes:"unless score @s MusicTitles matches 64..65 "}
execute if entity @s[x=-1152,y=0,z=-588,dx=190,dy=240,dz=128] run return run function johto:world/musictitles/small {text:"Route 27", location:65, includes:"unless score @s MusicTitles matches 64..65 "}
execute if entity @s[x=-961,y=0,z=-588,dx=207,dy=240,dz=128] run return run function johto:world/musictitles/small {text:"Route 27", location:65, includes:"unless score @s MusicTitles matches 64..65 "}

# Routes 24-25
execute if entity @s[x=-2777,y=0,z=803,dx=122,dy=240,dz=150] run return run function johto:world/musictitles/small {text:"Route 24", location:62, includes:"unless score @s MusicTitles matches 62..63 "}
execute if entity @s[x=-3114,y=0,z=954,dx=425,dy=240,dz=70] run return run function johto:world/musictitles/small {text:"Route 25", location:63, includes:"unless score @s MusicTitles matches 62..63 "}

# Routes 18-22
execute if entity @s[x=-2287,y=0,z=-607,dx=271,dy=240,dz=77] run return run function johto:world/musictitles/small {text:"Route 18", location:57, includes:"unless score @s MusicTitles matches 57..61 "}
execute if entity @s[x=-2479,y=0,z=-830,dx=225,dy=240,dz=186] run return run function johto:world/musictitles/small {text:"Route 19", location:58, includes:"unless score @s MusicTitles matches 57..61 "}
execute if entity @s[x=-2479,y=60,z=-969,dx=713,dy=180,dz=138] run return run function johto:world/musictitles/small {text:"Route 20", location:59, includes:"unless score @s MusicTitles matches 57..61 "}
execute if entity @s[x=-1765,y=0,z=-824,dx=145,dy=240,dz=419] run return run function johto:world/musictitles/small {text:"Route 21", location:60, includes:"unless score @s MusicTitles matches 57..61 "}
execute if entity @s[x=-1608,y=0,z=-14,dx=263,dy=240,dz=109] run return run function johto:world/musictitles/small {text:"Route 22", location:61, includes:"unless score @s MusicTitles matches 57..61 "}
execute if entity @s[x=148,y=60,z=613,dx=200,dy=30,dz=200] run return run function johto:world/musictitles/small {text:"Route 22", location:61, includes:"unless score @s MusicTitles matches 57..61 "}

# Routes 11-15
execute if entity @s[x=-3261,y=0,z=-118,dx=376,dy=240,dz=118] run return run function johto:world/musictitles/small {text:"Route 11", location:50, includes:"unless score @s MusicTitles matches 50..54 "}
execute if entity @s[x=-3354,y=0,z=-395,dx=92,dy=240,dz=684] run return run function johto:world/musictitles/small {text:"Route 12", location:51, includes:"unless score @s MusicTitles matches 50..54 "}
execute if entity @s[x=-3261,y=0,z=-391,dx=381,dy=240,dz=85] run return run function johto:world/musictitles/small {text:"Route 13", location:52, includes:"unless score @s MusicTitles matches 50..54 "}
execute if entity @s[x=-3000,y=0,z=-600,dx=120,dy=240,dz=208] run return run function johto:world/musictitles/small {text:"Route 14", location:53, includes:"unless score @s MusicTitles matches 50..54 "}
execute if entity @s[x=-2879,y=0,z=-600,dx=365,dy=240,dz=100] run return run function johto:world/musictitles/small {text:"Route 15", location:54, includes:"unless score @s MusicTitles matches 50..54 "}

# Routes 2-10
execute if entity @s[x=-1776,y=0,z=123,dx=252,dy=240,dz=429] run return run function johto:world/musictitles/small {text:"Route 2", location:41, includes:"unless score @s MusicTitles matches 41..49 "}
execute if entity @s[x=-2222,y=0,z=577,dx=436,dy=240,dz=194] run return run function johto:world/musictitles/small {text:"Route 3", location:42, includes:"unless score @s MusicTitles matches 41..49 "}
execute if entity @s[x=-2654,y=0,z=675,dx=403,dy=240,dz=96] run return run function johto:world/musictitles/small {text:"Route 4", location:43, includes:"unless score @s MusicTitles matches 41..49 "}
execute if entity @s[x=-2871,y=0,z=441,dx=211,dy=240,dz=212] run return run function johto:world/musictitles/small {text:"Route 5", location:44, includes:"unless score @s MusicTitles matches 41..49 "}
execute if entity @s[x=-2871,y=0,z=40,dx=252,dy=240,dz=194] run return run function johto:world/musictitles/small {text:"Route 6", location:45, includes:"unless score @s MusicTitles matches 41..49 "}
execute if entity @s[x=-2618,y=0,z=290,dx=118,dy=240,dz=134] run return run function johto:world/musictitles/small {text:"Route 7", location:46, includes:"unless score @s MusicTitles matches 41..49 "}
execute if entity @s[x=-3224,y=0,z=275,dx=352,dy=240,dz=156] run return run function johto:world/musictitles/small {text:"Route 8", location:47, includes:"unless score @s MusicTitles matches 41..49 "}
execute if entity @s[x=-3350,y=60,z=627,dx=513,dy=180,dz=173] run return run function johto:world/musictitles/small {text:"Route 9", location:48, includes:"unless score @s MusicTitles matches 41..49 "}
execute if entity @s[x=-3338,y=60,z=387,dx=116,dy=256,dz=239] run return run function johto:world/musictitles/small {text:"Route 10", location:49, includes:"unless score @s MusicTitles matches 41..49 "}
#---------------------------------------------------------------------------------------------------


# Special Cases (different between GSC/HGSS)


# Major Locations (title & subtitle)
execute if entity @s[x=285,y=60,z=-793,dx=125,dy=240,dz=130] run return run function johto:world/musictitles/big {text:"Azalea Town", color:"dark_green", subtext:"Living Happily with Pokémon", location:301, includes:""}
execute if entity @s[x=409,y=63,z=-740,dx=23,dy=7,dz=14] run return run function johto:world/musictitles/big {text:"Azalea Town", color:"dark_green", subtext:"Living Happily with Pokémon", location:301, includes:""}
execute if entity @s[x=-775,y=59,z=125,dx=202,dy=240,dz=206] run return run function johto:world/musictitles/big {text:"Blackthorn City", color:"dark_gray", subtext:"A Quiet Mountain Retreat", location:302, includes:""}
execute if entity @s[x=-2501,y=0,z=236,dx=278,dy=240,dz=199] run return run function johto:world/musictitles/big {text:"Celadon City", color:"green", subtext:"City of Rainbow Dreams", location:303, includes:""}
execute if entity @s[x=-2836,y=0,z=654,dx=181,dy=240,dz=148] run return run function johto:world/musictitles/big {text:"Cerulean City", color:"dark_aqua", subtext:"The Floral Lagoon City", location:304, includes:""}
execute if entity @s[x=-279,y=0,z=-598,dx=217,dy=240,dz=137] run return run function johto:world/musictitles/big {text:"Cherrygrove City", color:"dark_red", subtext:"The City of Fragrant Flowers", location:305, includes:""}
execute if entity @s[x=1152,y=0,z=-525,dx=168,dy=240,dz=244] run return run function johto:world/musictitles/big {text:"Cianwood City", color:"aqua", subtext:"A Port of Crashing Waves", location:306, includes:""}
execute if entity @s[x=-1746,y=63,z=-913,dx=88,dy=20,dz=83] run return run function johto:world/musictitles/big {text:"Cinnabar Island", color:"dark_red", subtext:"The Ravaged Town of the Past", location:307, includes:""}
execute if entity @s[x=236,y=0,z=164,dx=262,dy=100,dz=204] run return run function johto:world/musictitles/big {text:"Ecruteak City", color:"light_purple", subtext:"A Historical City", location:308, includes:""}
execute if entity @s[x=-2513,y=0,z=-642,dx=225,dy=240,dz=187] run return run function johto:world/musictitles/big {text:"Fuchsia City", color:"light_purple", subtext:"Happening and Passing City", location:309, includes:""}
execute if entity @s[x=349,y=0,z=-461,dx=239,dy=240,dz=194] run return run function johto:world/musictitles/big {text:"Goldenrod City", color:"yellow", subtext:"A Happening Big City", location:310, includes:""}
execute if entity @s[x=-1343,y=64,z=15,dx=99,dy=100,dz=338] run return run function johto:world/musictitles/big {text:"Indigo Plateau", color:"white", subtext:"The Ultimate Goal of Trainers!", location:311, includes:""}
execute if entity @s[x=-3338,y=0,z=290,dx=113,dy=240,dz=96] run return run function johto:world/musictitles/big {text:"Lavender Town", color:"dark_purple", subtext:"The Noble Town", location:312, includes:""}
execute if entity @s[x=-214,y=64,z=125,dx=117,dy=240,dz=119] run return run function johto:world/musictitles/big {text:"Mahogany Town", color:"gray", subtext:"Home of the Ninja", location:313, includes:""}
execute if entity @s[x=-753,y=0,z=-577,dx=103,dy=240,dz=132] run return run function johto:world/musictitles/big {text:"New Bark Town", color:"white", subtext:"Winds of a New Beginning", location:314, includes:""}
execute if entity @s[x=639,y=0,z=-239,dx=197,dy=240,dz=279] run return run function johto:world/musictitles/big {text:"Olivine City", color:"dark_aqua", subtext:"The Port with Sea Breezes", location:315, includes:""}
execute if entity @s[x=-1765,y=0,z=-404,dx=145,dy=240,dz=154] run return run function johto:world/musictitles/big {text:"Pallet Town", color:"yellow", subtext:"Shades of Your Journey Await!", location:316, includes:""}
execute if entity @s[x=-1785,y=0,z=553,dx=261,dy=240,dz=208] run return run function johto:world/musictitles/big {text:"Pewter City", color:"gray", subtext:"Between Rugged Mountains", location:317, includes:""}
execute if entity @s[x=-2871,y=0,z=235,dx=252,dy=240,dz=205] run return run function johto:world/musictitles/big {text:"Saffron City", color:"red", subtext:"Shining Big City", location:318, includes:""}
execute if entity @s[x=-2884,y=0,z=-200,dx=273,dy=240,dz=239] run return run function johto:world/musictitles/big {text:"Vermilion City", color:"red", subtext:"The Port of Exquisite Sunsets", location:319, includes:""}
execute if entity @s[x=-42,y=0,z=-161,dx=141,dy=256,dz=261] run return run function johto:world/musictitles/big {text:"Violet City", color:"dark_purple", subtext:"The City of Nostalgic Scents", location:320, includes:""}
execute if entity @s[x=100,y=0,z=-90,dx=90,dy=256,dz=190] run return run function johto:world/musictitles/big {text:"Violet City", color:"dark_purple", subtext:"The City of Nostalgic Scents", location:320, includes:""}
execute if entity @s[x=-1800,y=0,z=-44,dx=191,dy=240,dz=166] run return run function johto:world/musictitles/big {text:"Viridian City", color:"aqua", subtext:"The City of Evergreen", location:321, includes:""}


# Other Locations (actionbar)
execute if entity @s[x=858,y=75,z=-15,dx=102,dy=100,dz=143] run return run function johto:world/musictitles/small {text:"Battle Tower", location:2, includes:""}
execute if entity @s[x=858,y=60,z=-15,dx=102,dy=10,dz=143] run return run function johto:world/musictitles/small {text:"Battle Tower", location:2, includes:""}
execute if entity @s[x=-2659,y=0,z=828,dx=124,dy=240,dz=68] run return run function johto:world/musictitles/small {text:"Cerulean Cave", location:5, includes:""}
execute if entity @s[x=-3088,y=0,z=80,dx=139,dy=100,dz=136] run return run function johto:world/musictitles/small {text:"Diglett's Cave", location:11, includes:""}
execute if entity @s[x=-744,y=69,z=507,dx=162,dy=70,dz=147] run return run function johto:world/musictitles/small {text:"Dragon's Den", location:12, includes:""}
execute if entity @s[x=-1366,y=63,z=676,dx=110,dy=240,dz=74] run return run function johto:world/musictitles/small {text:"Elite Four", location:14, includes:""}
execute if entity @s[x=-1366,y=63,z=372,dx=110,dy=240,dz=302] run return run function johto:world/musictitles/small {text:"Elite Four", location:14, includes:""}
execute if entity @s[x=1169,y=252,z=619,distance=..40] run return run function johto:world/musictitles/small {text:"Fly Map", location:15, includes:""}
execute if entity @s[x=87,y=50,z=719,dx=44,dy=20,dz=44] run return run function johto:world/musictitles/small {text:"???", location:17, includes:""}
execute if entity @s[x=-1049,y=60,z=-340,dx=41,dy=20,dz=72] run return run function johto:world/musictitles/small {text:"Hall of Fame", location:19, includes:""}
execute if entity @s[x=-1300,y=77,z=751,dx=24,dy=10,dz=34] run return run function johto:world/musictitles/small {text:"Hall of Fame", location:19, includes:""}
execute if entity @s[x=-875,y=0,z=302,dx=280,dy=60,dz=173] run return run function johto:world/musictitles/small {text:"Ice Path", location:20, includes:""}
execute if entity @s[x=513,y=0,z=-793,dx=187,dy=240,dz=228] run return run function johto:world/musictitles/small {text:"Ilex Forest", location:21, includes:""}
execute if entity @s[x=-978,y=64,z=-375,dx=20,dy=20,dz=20] run return run function johto:world/musictitles/small {text:"Lobby", location:25, includes:""}
execute if entity @s[x=-2279,y=18,z=761,dx=113,dy=37,dz=89] run return run function johto:world/musictitles/small {text:"Mt. Moon", location:27, includes:""}
execute if entity @s[x=-83,y=0,z=220,dx=318,dy=240,dz=180] run return run function johto:world/musictitles/small {text:"Mt. Mortar", location:28, includes:""}
execute if entity @s[x=-967,y=174,z=189,dx=50,dy=30,dz=140] run return run function johto:world/musictitles/small {text:"Mt. Silver", location:29, includes:""}
execute if entity @s[x=-1043,y=60,z=102,dx=135,dy=100,dz=270] run return run function johto:world/musictitles/small {text:"Mt. Silver", location:29, includes:""}
execute if entity @s[x=463,y=0,z=-67,dx=175,dy=240,dz=203] run return run function johto:world/musictitles/small {text:"National Park", location:30, includes:""}
execute if entity @s[x=-1222,y=0,z=500,dx=470,dy=240,dz=342] run return run function johto:world/musictitles/small {text:"Pokemon Gym", location:35, includes:""}
execute if entity @s[x=-1574,y=0,z=-895,dx=114,dy=63,dz=73] run return run function johto:world/musictitles/small {text:"Pokemon Mansion", location:36, includes:""}
execute if entity @s[x=-3420,y=0,z=516,dx=257,dy=59,dz=197] run return run function johto:world/musictitles/small {text:"Rock Tunnel", location:38, includes:""}
execute if entity @s[x=-178,y=0,z=152,dx=121,dy=63,dz=73] run return run function johto:world/musictitles/small {text:"Rocket HQ", location:39, includes:""}
execute if entity @s[x=-1765,y=0,z=-249,dx=145,dy=240,dz=204] run return run function johto:world/musictitles/small {text:"Route 1", location:40, includes:""}
execute if entity @s[x=-2222,y=0,z=279,dx=272,dy=240,dz=131] run return run function johto:world/musictitles/small {text:"Route 16", location:55, includes:""}
execute if entity @s[x=-2121,y=0,z=-529,dx=171,dy=240,dz=807] run return run function johto:world/musictitles/small {text:"Route 17", location:56, includes:""}
execute if entity @s[x=-1207,y=0,z=-17,dx=292,dy=240,dz=111] run return run function johto:world/musictitles/small {text:"Route 28", location:66, includes:""}
execute if entity @s[x=-434,y=0,z=-598,dx=51,dy=240,dz=134] run return run function johto:world/musictitles/small {text:"Route 29", location:67, includes:""}
execute if entity @s[x=-525,y=0,z=-598,dx=90,dy=240,dz=129] run return run function johto:world/musictitles/small {text:"Route 29", location:67, includes:""}
execute if entity @s[x=-649,y=0,z=-598,dx=124,dy=240,dz=118] run return run function johto:world/musictitles/small {text:"Route 29", location:67, includes:""}
execute if entity @s[x=-382,y=0,z=-598,dx=102,dy=240,dz=144] run return run function johto:world/musictitles/small {text:"Route 29", location:67, includes:""}
execute if entity @s[x=160,y=0,z=-295,dx=121,dy=240,dz=205] run return run function johto:world/musictitles/small {text:"Ruins of Alph", location:87, includes:""}
execute if entity @s[x=1403,y=0,z=-95,dx=379,dy=240,dz=201] run return run function johto:world/musictitles/small {text:"Safari Zone", location:88, includes:""}
execute if entity @s[x=1499,y=64,z=-209,dx=169,dy=256,dz=112] run return run function johto:world/musictitles/small {text:"Safari Zone Gate", location:89, includes:""}
execute if entity @s[x=-2200,y=0,z=-986,dx=250,dy=59,dz=208] run return run function johto:world/musictitles/small {text:"Seafoam Islands", location:91, includes:""}
execute if entity @s[x=-1099,y=0,z=-252,dx=102,dy=100,dz=189] run return run function johto:world/musictitles/small {text:"Sinjoh Ruins", location:92, includes:""}
execute if entity @s[x=229,y=0,z=-729,dx=92,dy=58,dz=76] run return run function johto:world/musictitles/small {text:"Slowpoke Well", location:93, includes:""}
execute if entity @s[x=530,y=0,z=324,dx=442,dy=240,dz=471] run return run function johto:world/musictitles/small {text:"S.S. Aqua", location:94, includes:""}
execute if entity @s[x=82,y=0,z=-873,dx=140,dy=60,dz=283] run return run function johto:world/musictitles/small {text:"Union Cave", location:95, includes:""}
execute if entity @s[x=-1531,y=0,z=372,dx=204,dy=61,dz=173] run return run function johto:world/musictitles/small {text:"Victory Road", location:96, includes:""}
execute if entity @s[x=1120,y=0,z=120,dx=245,dy=240,dz=280] run return run function johto:world/musictitles/small {text:"Whirl Islands", location:99, includes:""}
execute if entity @s[x=870,y=0,z=-480,dx=281,dy=240,dz=199] run return run function johto:world/musictitles/small {text:"Whirl Islands", location:100, includes:""}

return 0