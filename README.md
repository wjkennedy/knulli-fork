[![Activity](https://img.shields.io/github/commit-activity/m/knulli-cfw/distribution)](https://github.com/knulli-cfw/distribution)
[![PR](https://img.shields.io/github/issues-pr-closed/knulli-cfw/distribution)](https://github.com/knulli-cfw/distribution)
[![Stars](https://img.shields.io/github/stars/knulli-cfw?style=social)](https://github.com/knulli-cfw/distribution)
[![Forks](https://img.shields.io/github/forks/knulli-cfw/distribution?style=social)](https://github.com/knulli-cfw/distribution)
[![Website](https://img.shields.io/website?down_color=red&down_message=down&up_color=green&up_message=up&url=https%3A%2F%2Fwww.knulli.org)](https://knulli.org)
[![Discord Server](https://img.shields.io/discord/357518249883205632.svg)](https://discord.gg/HXPS3DAeeB)

## :video_game::penguin: Knulli CFW :video_game::penguin:
Knulli CFW is a fork of the open-source and completely free retro-gaming distribution batocera that can be copied to an SD card with the aim of improving many of the emulation handhelds on the market that usually ship with incomplete and often non GPL compliant software. It supports [many emulators and game engines](https://www.batocera.org/compatibility.php) out of the box. 

## Get information on the project

 - :globe_with_meridians: Browse our [website](https://knulli.org) for general information (Downloads coming soon)
 - :memo: Documentation is available on our [wiki](https://knulli.org) and frequently updated
 - :speech_balloon: Discuss any topic with the community on our [Discord Server](https://discord.gg/HXPS3DAeeB)

## Do you need help with KNULLI?

 - :sos: The most effective way is to join our [Discord Server](https://discord.gg/HXPS3DAeeB) and go to the \#questions channel

## How can you help Knulli?

 - :wrench: If you want to help with development, [we accept PRs](https://makeapullrequest.com/) -- anyone is welcome, we embrace the [Bazaar development principles](https://en.wikipedia.org/wiki/The_Cathedral_and_the_Bazaar)

## Build instructions (local Docker + GitHub Actions)

### Local builds with Docker
1. Build the Knulli build container:
   ```sh
   make build-docker-image
   ```
2. Build a firmware image for a target (use the suffix from `configs/knulli-*.board`):
   ```sh
   make h700-build
   ```
   Replace `h700` with another supported target (for example: `rk3566`, `rk3326`, or `sm8250`).

Build artifacts will be created under:
```
output/<target>/images/knulli/images/<target>/
```

### GitHub Actions builds
1. Open the **Actions** tab and select the **Prepare builds** workflow.
2. Click **Run workflow** and provide the `target` input (defaults to `h700`).
3. After the workflow completes, download the uploaded artifact named:
   ```
   knulli-<target>-images
   ```

## Directory navigation

 - `board` Platform-specific build configuration. This is where to include special patches/configuration files needed to have particular components work on a particular platform. It is instead encouraged to apply patches at the location of the package itself, but this may not always be possible.
 - `buildroot` Buildroot, the tool used to create the final compiled images. For newcomers, you can safely ignore this folder. Compilation instructions can be found [on the wiki](https://wiki.batocera.org/compile_batocera.linux).
 - `configs` Build flags, which define what components will be built with your image depending on your chose architecture. If you're trying to port Batocera to a new architecture (device, platform, new bit mode, etc.) this is the file you'll need to edit. More information on [the build configuration section on the buildroot compiling page](https://wiki.batocera.org/batocera.linux_buildroot_modifications#define_your_configuration).
 - `package` The "meat and potatoes" of Batocera. This is where the majority of emulator data, config generators, core packages, system utilities, etc. all go into. This is the friendliest place to start dev-work for new devs, as most of it is handled by Python and Makefile.
 - `scripts` Various miscellanous scripts that handle aspects external to Batocera, such as the report data sent to the [compatibility page](https://batocera.org/compatibility.php) or info about the Bezel Project.

A cheatsheet of notable files/folders can be found [on the wiki](https://wiki.batocera.org/notable_files).
