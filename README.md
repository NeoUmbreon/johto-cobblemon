# johto-cobblemon

This modification to [Jond's Cobblemon Johto](https://www.curseforge.com/minecraft/worlds/cobblemon-johto) allows trainers to battle you automatically.

### Necessary mods with Fabric 1.21.1:

- [Cobblemon 1.7.3](https://modrinth.com/mod/cobblemon/versions?g=1.21.1&l=fabric)
- [Cobblemon Trainer Battle Commands 0.13.0-beta](https://modrinth.com/mod/tbcs/versions?g=1.21.1&l=fabric)
- [Radical Cobblemon Trainers API 0.14.8-beta](https://modrinth.com/mod/rctapi/versions?g=1.21.1&l=fabric)
- [ForgeConfigAPIPort-v21.1.6](https://modrinth.com/mod/forge-config-api-port/versions?g=1.21.1&l=fabric)

## Files
### Edited files:

- datapacks/CobblemonJohto/data/johto/function/triggers/relog.mcfunction 
- datapacks/CobblemonJohto/data/minecraft/tags/function/load.json 
- datapacks/CobblemonJohto/data/minecraft/tags/function/tick.json 

### New files:

- generate_trainers.sh 
- datapacks/CobblemonJohto/data/johto/function/trainers/battle_cleanup.mcfunction 

### Filled by script:

- datapacks/CobblemonJohto/data/johto/function/trainers/battles/*.mcfunction 
- trainers/*.json 
- datapacks/CobblemonJohto/data/johto/function/trainers/bootstrap.mcfunction 
- datapacks/CobblemonJohto/data/johto/function/trainers/detect_trainers.mcfunction 
