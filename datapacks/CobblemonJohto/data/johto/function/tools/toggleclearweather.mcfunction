# Enable
execute if gamerule doWeatherCycle run gamerule doWeatherCycle false
execute if gamerule doWeatherCycle run weather clear
execute if gamerule doWeatherCycle run return run tellraw @a {"text":"Permanent Clear Weather has been turned ","extra":[{"text":"ON","color":"gold"}]}

# Disable
gamerule doWeatherCycle true
tellraw @a {"text":"Permanent Clear Weather has been turned ","extra":[{"text":"OFF","color":"gray"}]}