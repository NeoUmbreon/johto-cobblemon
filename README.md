# johto-cobblemon

This is a modification of [Jond's Cobblemon Johto](https://www.curseforge.com/minecraft/worlds/cobblemon-johto).

The broad goal of this overhaul is to create an experience that is more consistent with the original games.

The project is a work in progress, so some features may be broken or missing.

## Features

## Audio
- Includes both Game Boy and DS sound modes
    - Sound preference is per-player and can be toggled at any time
- Game Boy music is edited to loop seamlessly* instead of fading out
    - Seamlessness not guaranteed; Minecraft audio is finicky :(
- Replaced the audio resource pack with higher-quality files
- Reworked many sound events to be global
    - You can now hear other players enter/exit buildings, use escape ropes, cut trees, etc
- Added new sound events/music tracks
    - Music examples: Pokemon Center, evolving a Pokemon, key dialogues
    - SFX examples: field moves like Fly and Rock Smash, leveling up, receiving items

## Battle
- Trainers spot you for battle from a distance!
    - Boss trainers like Gym Leaders do not
- Trainers are no longer rebattleable
    - Trainers that *should* be rebattleable still are (Pokemon League, Gym Leader rematches, Red)
- Trainer battles prevent you from running away

## Challenge Mode
- Optional, heavily inspired by [Lunatic Crystal](https://www.pokecommunity.com/threads/pokemon-lunatic-crystal-v1-7.525483/)
- Level curve has been adjusted to reach level 100
    - Affects both trainers' and wild Pokemon's levels
- Harder trainer battles
    - All trainers have custom teams
    - Gym Leaders and important trainers have custom movesets, held items, and stats
- Game progression changes
    - Progression of first 3 Gyms is now Azalea -> Goldenrod -> Violet
    - Sprout Tower is now mandatory
 
## Other
### Small Tweaks
- Surfing music is now dynamic
    - Instead of playing by area, it plays whenever you are riding a Pokemon that is in water
- Bicycle music behaves more like the source games and no longer overwrites all other music
- Whiteout is enabled by default
- Reworked the Game Corner slot machines

### Fixes
- Many minor bugfixes, optimizations, and consistency improvements
    - Like a lot, too many to list
        - No really

## Required Mods

Created for Minecraft Fabric 1.21.1.

- [Cobblemon 1.7.3](https://modrinth.com/mod/cobblemon/versions?g=1.21.1&l=fabric)
    - [Fabric API](https://modrinth.com/mod/fabric-api/versions?g=1.21.1)
- [Cobblemon Trainer Battle Commands 0.14.1-beta](https://modrinth.com/mod/tbcs/versions?g=1.21.1&l=fabric)
    - [Radical Cobblemon Trainers API 0.15.2-beta](https://modrinth.com/mod/rctapi/versions?g=1.21.1&l=fabric)
    - [Architectury API 13.0.8](https://modrinth.com/mod/architectury-api/versions?g=1.21.1&l=fabric)
    - [ForgeConfigAPIPort-v21.1.6](https://modrinth.com/mod/forge-config-api-port/versions?g=1.21.1&l=fabric)
- [Fix Cobblemon Pokemon Experience 1.1.1](https://modrinth.com/mod/fix-cobblemon-pokemon-experience/versions?l=fabric)
    - [Fabric Language Kotlin 1.13.10](https://modrinth.com/mod/fabric-language-kotlin/versions?g=1.21.1)
