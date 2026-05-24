# johto-cobblemon

This is a modification of [Jond's Cobblemon Johto](https://www.curseforge.com/minecraft/worlds/cobblemon-johto).

The project is a work in progress, so some features may be broken or missing.

## Installation
> [!IMPORTANT]
> Created for Fabric 1.21.1. NeoForge may work, but is unsupported.  
> Download each mod's dependencies as well.

### Mods

**Required**
- [Cobblemon](https://modrinth.com/mod/cobblemon/versions?g=1.21.1)
- [Cobblemon Trainer Battle Commands](https://modrinth.com/mod/tbcs/versions?g=1.21.1)

**Recommended**
- [Fix Cobblemon Pokemon Experience](https://modrinth.com/mod/fix-cobblemon-pokemon-experience/versions?g=1.21.1)

### Datapack
The datapack can be downloaded from the [Releases](../../releases) page.
1. Download the `johto-cobblemon.zip` file from the Releases section.
2. Copy and paste all files/folders from within the zip file into your world folder. You should be prompted to overwrite files; click yes.

### Music Pack
> [!NOTE]
> The original "Cobblemon Johto Music Pack" is not required.  
> If you have already installed the original, you can unload and/or delete it if you wish.
1. Download the `CobblemonJohtoMusicPack.zip` file from [here](https://www.github.com/spacky1/cobblemon-johto-music-pack/releases/tag/nightly).
3. Copy the zip file to your `resourcepacks` folder.
4. In Minecraft, activate the resource pack named `Cobblemon Johto - Expanded Music Pack`

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
- Trainers are no longer rebattleable
    - Trainers that *should* be rebattleable still are (Pokemon League, Gym Leader rematches, Red)
- Trainer battles prevent you from running away
- Game progression changes
    - Progression of first 3 Gyms is Azalea -> Goldenrod -> Violet
    - Sprout Tower is mandatory

### Challenge Mode
- Optional, heavily inspired by [Lunatic Crystal](https://www.pokecommunity.com/threads/pokemon-lunatic-crystal-v1-7.525483/)
- Level curve has been adjusted to reach level 100
    - Affects both trainers' and wild Pokemon's levels
- Harder trainer battles
    - All trainers have custom teams
    - Gym Leaders and important trainers have custom movesets, held items, and stats

### Other Tweaks
- Reworked Safari Zone:
    - Multiplayer!
    - Faster generation & teardown
- Reworked Battle Tower: (WIP)
    - Multiple battle formats: singles, doubles, triples, multi with NPC or player partners
    - Multiple rooms
    - Accurate-to-cart mechanics
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
