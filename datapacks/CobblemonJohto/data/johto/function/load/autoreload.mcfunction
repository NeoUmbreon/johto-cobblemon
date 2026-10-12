scoreboard players set #check_reload click 0
execute store success score #check_reload click run function johto:load/checknpcsloaded
execute if score #check_reload click matches 0 run say Auto-reloading...
execute if score #check_reload click matches 0 run reload