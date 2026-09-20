# johto-cobblemon
![Minecraft](https://img.shields.io/badge/Minecraft-1.21.1-green)
![Cobblemon](https://img.shields.io/badge/Cobblemon-Modrinth-red?logo=modrinth)

> WIP. Report any bugs you encounter!

This is an overhaul of Jond's [Cobblemon Johto](https://www.curseforge.com/minecraft/worlds/cobblemon-johto) adventure map.

![image](.github/images/ssaqua.jpg)


## Features

### Audio
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

### Battle
- Trainers spot you for battle from a distance!
    - Boss trainers like Gym Leaders do not
- Double battles
- Trainers are no longer rebattleable
    - Trainers that *should* be rebattleable still are (Pokemon League, Gym Leader rematches, Red)
- Trainer battles prevent you from running away
- Game progression changes
    - Progression of first 3 Gyms is Azalea -> Goldenrod -> Violet
    - Sprout Tower is mandatory

### Challenge Mode
- Optional; heavily inspired by [Lunatic Crystal](https://www.pokecommunity.com/threads/pokemon-lunatic-crystal-v1-7.525483/)
- Level curve has been adjusted to reach level 100
    - Affects both trainers' and wild Pokemon's levels
- Harder trainer battles
    - All trainers have custom teams
    - Gym Leaders and important trainers have custom movesets, held items, and stats

### Other Features
- TMs
- Enhanced Safari Zone:
    - Multiplayer!
    - Faster generation & teardown
- Reworked Battle Tower:
    - Multiple battle formats: singles, doubles, triples, multi with NPC or player partners
    - Multiple rooms
    - Accurate-to-cart mechanics
- Updated Trainer skins, courtesy of [Skycrafts](https://www.planetminecraft.com/member/skycrafts/)
- Updated Trainer dialogue
- Re-implemented missing quests/events
- Dynamic Surfing music
    - Instead of playing by area, it plays whenever you are riding a Pokemon that is in water
- Bicycle music no longer overwrites all other music
- Whiteout enabled by default
- Reworked Game Corner slot machines
- Particles are displayed above uncollected item pickups

### Fixes
- Many minor bugfixes, optimizations, and consistency improvements
    - Like a lot, too many to list
        - No really


## Prerequisites

### Mods
> [!IMPORTANT]
> Created for Fabric 1.21.1. NeoForge is untested.  
> Install each mod's required dependencies as well.  

**Required**
- [Cobblemon](https://modrinth.com/mod/cobblemon/versions?g=1.21.1)
- [Cobblemon Trainer Battle Commands](https://modrinth.com/mod/tbcs/versions?g=1.21.1)

**Recommended**
- [AllTheMons](https://modrinth.com/datapack/allthemons/versions?g=1.21.1)
    - Adds many models that are missing from Cobblemon.
    - **Delete these folders**: `data/special_spawn`, `data/cobblemon/spawn_pool_world`
- A Backpack or TM case mod
    - Without one, you will struggle with inventory space.

### World
> [!IMPORTANT]
> Use a fresh install of the map for the best experience.  

1. Download the map from [CurseForge](https://www.curseforge.com/minecraft/worlds/cobblemon-johto/files/7507302).
2. From the downloaded `.zip` file:
    - Copy/move the `Johto` folder into your `minecraft/saves` folder. **Do not rename it.**


## Installation

### Files
1. Download `johto-cobblemon.zip` from the [Releases](../../releases) page.
2. From the downloaded `.zip` file:
    - Copy/move the `config` folder into your `minecraft` folder.
    - Copy/move the `Johto` folder into your `minecraft/saves` folder, overwriting files when asked.

**You're done. Enjoy!**


## Optional Configuration

#### Music Pack
> [!NOTE]
> This replaces the original "Cobblemon Johto Music Pack".  
> The original is not required, and will not function with this datapack loaded.  

1. Download `CobblemonJohtoMusicPack.zip` from [here](https://www.github.com/spacky1/cobblemon-johto-music-pack/releases/tag/nightly).
2. Copy/move the `.zip` file into your `resourcepacks` folder.
3. In Minecraft, enable the resource pack named `CobblemonJohtoMusicPack`.

#### Map-specific settings (e.g. challenge mode)
- Edit this file: `Johto/data/molang/config.json`

#### Running this on a dedicated server?
- Ensure these values are set in your `server.properties`
```properties
enable-command-block=true
difficulty=peaceful
gamemode=adventure
level-name=Johto
resource-pack=https://github.com/NeoUmbreon/johto-cobblemon/releases/download/nightly/CobblemonJohtoResourcePack.zip
```
- Clients will need to install the optional Music Pack themselves.


## Credits & Thanks
- [Jond](https://www.curseforge.com/members/jondgames/projects) for the original map & datapack
- [Skycrafts](https://www.planetminecraft.com/member/skycrafts/) for providing the trainer skins

![image](.github/images/ludicolo.jpg)

> Ludicolo not included. Use only as directed. Contains small parts - not suitable for children under 1 year of age. Subject to change without notice. User assumes full responsibility. Do not drive or operate machinery while playing. If rash, irritation, redness, or swelling occurs, discontinue usage. Warranty void if seal is broken. Pokémon only available while supplies last.
