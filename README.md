<p align="center">
  <img alt="Toolbx Development Containers" src="https://shieldcn.dev/header/surface.svg?title=Toolbx+Development+Containers&amp;subtitle=Chaotic-AUR+and+Homebrew+Toolbx+images&amp;mode=dark" />
</p>

![badge group](https://shieldcn.dev/group/github/stars/Pratyay360/chaotic-toolbx+github/forks/Pratyay360/chaotic-toolbx.svg?variant=secondary)

# Toolbx Development Containers

- `chaotic-toolbox` — Arch Linux based Toolbox image with the Chaotic-AUR repo and `paru` preinstalled.
- `brew-toolbox` — Alma Linux based Toolbox container with Homebrew configured.
- `android-toolbox` — Arch Linux based Toolbox image with the Android SDK, NDK, Android CLI, Flutter.

## Images

| Image | Purpose | Base |
| --- | --- | --- |
| `chaotic-toolbox` | Arch Linux with Chaotic-AUR repo and `paru` AUR helper | Arch Linux |
| `brew-toolbox` | Vanilla AlmaLinux with Homebrew | AlmaLinux |
| `android-toolbox` | Android development with SDK, NDK, Android CLI, Flutter | Arch Linux |
| `waydroid-toolbox` | Waydroid development with SDK, NDK, Android CLI, Flutter | Arch Linux |

## Registries

| Image | GHCR | Quay.io | Docker Hub |
| --- | --- | --- | --- |
| `chaotic-toolbox` | [ghcr.io/pratyay360/chaotic-toolbox](https://github.com/pratyay360/chaotic-toolbx/pkgs/container/chaotic-toolbox) | [quay.io/pratyay360/chaotic-toolbox](https://quay.io/repository/pratyay360/chaotic-toolbox) | [docker.io/pratyay360/chaotic-toolbox](https://hub.docker.com/r/pratyay360/chaotic-toolbox) |
| `brew-toolbox` | [ghcr.io/pratyay360/brew-toolbox](https://github.com/pratyay360/chaotic-toolbx/pkgs/container/brew-toolbox) | [quay.io/pratyay360/brew-toolbox](https://quay.io/repository/pratyay360/brew-toolbox) | [docker.io/pratyay360/brew-toolbox](https://hub.docker.com/r/pratyay360/brew-toolbox) |
| `android-toolbox` | [ghcr.io/pratyay360/android-toolbox](https://github.com/pratyay360/chaotic-toolbx/pkgs/container/android-toolbox) | [quay.io/pratyay360/android-toolbox](https://quay.io/repository/pratyay360/android-toolbox) | [docker.io/pratyay360/android-toolbox](https://hub.docker.com/r/pratyay360/android-toolbox) |
| `waydroid-toolbox` | [ghcr.io/pratyay360/waydroid-toolbox](https://github.com/pratyay360/chaotic-toolbx/pkgs/container/waydroid-toolbox) | [quay.io/pratyay360/waydroid-toolbox](https://quay.io/repository/pratyay360/waydroid-toolbox) | [docker.io/pratyay360/waydroid-toolbox](https://hub.docker.com/r/pratyay360/waydroid-toolbox) |

## Usage

```bash
# Arch based toolbox container with preconfigured sensible defaults like Paru and chaotic-aur.
toolbox create -c chaotic-toolbox -i ghcr.io/pratyay360/chaotic-toolbox:latest 
toolbox enter chaotic-toolbox

# image for debugging homebrew formulas
toolbox create -c brew-toolbox -i ghcr.io/pratyay360/brew-toolbox:latest 
toolbox enter brew-toolbox

# image for android development
toolbox create -c android-toolbox -i ghcr.io/pratyay360/android-toolbox:latest 
toolbox enter android-toolbox

# image for waydroid development
toolbox create -c waydroid-toolbox -i ghcr.io/pratyay360/waydroid-toolbox:latest 
toolbox enter waydroid-toolbox
```

<p align="center">
  <a href="https://github.com/pratyay360/chaotic-toolbx/graphs/contributors"><img alt="contributors" src="https://shieldcn.dev/contributors/pratyay360/chaotic-toolbx.svg?mode=dark" /></a>
</p>
