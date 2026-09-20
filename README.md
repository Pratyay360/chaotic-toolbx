# Toolbx Development Containers (Arch Linux + Chaotic-AUR)

Pre-configured, battle-tested [Toolbx](https://containertoolbx.org/) / Distrobox container images based on Arch Linux with [Chaotic-AUR](https://aur.chaotic.cx/) pre-configured for automated, fast binary package management.

---

## Available Images

| Image | Tag | Description | Containerfile |
| :--- | :--- | :--- | :--- |
| **Android & Flutter Stack** | `latest`, `android` | Full Android development environment: Android Studio, Flutter SDK, Android SDK, OpenJDK 17, and build tooling. | [`Containerfile`](./Containerfile) |
| **Chaotic-AUR Base** | `chaotic` | Clean Arch Linux toolbx image with Chaotic-AUR enabled and `paru` AUR helper pre-installed. | [`Containerfile.chaotic`](./Containerfile.chaotic) |

Images are published to:
- `ghcr.io/pratyay360/toolbx-nix:latest` (Android & Flutter stack)
- `ghcr.io/pratyay360/toolbx-nix:chaotic` (Vanilla Chaotic-AUR + paru)

---

## 🚀 Quickstart

### 1. Create and Enter the Android & Flutter Toolbx

```bash
# Create the toolbox container
toolbox create -i ghcr.io/pratyay360/toolbx-nix:latest -c android-dev

# Enter the container
toolbox enter android-dev
```

### 2. Verify Development Stack

Inside the container:

```bash
# Check Flutter setup
flutter doctor

# Check Android SDK command-line tools
sdkmanager --version
adb --version

# Check Java runtime
java -version

# Launch Android Studio
studio
# or: android-studio
```

---

## 📦 What's Included in the Android Stack

- **Android Studio**: Stable release pre-installed at `/opt/android-studio` with launcher symlinked to `studio` and `android-studio`.
- **Flutter SDK**: Pre-cached Flutter SDK with Dart, Android, Linux, and Web target support (`/opt/flutter`). Pre-configured with Android SDK and Android Studio paths.
- **Android SDK & Command-line Tools**:
  - `cmdline-tools` (latest)
  - `platform-tools` (`adb`, `fastboot`)
  - `build-tools`
  - Pre-accepted Android SDK licenses
- **Java**: OpenJDK 17 (`JAVA_HOME=/usr/lib/jvm/java-17-openjdk`)
- **AUR Helper**: `paru` from Chaotic-AUR for fast installation of any additional Arch/AUR packages.
- **Desktop & Native Compilation**: `clang`, `cmake`, `ninja`, `pkgconf`, `gtk3`.
- **Hardware Acceleration & GUI**: `mesa`, `vulkan-icd-loader`, `vulkan-intel`, `vulkan-radeon`, `libglvnd`, `alsa-lib`, `libpulse`, `nss`.
- **Device Support**: `android-udev` rules and `usbutils` for USB phone debugging.

---

## 🛠 Local Build

To build the images locally with Podman or Buildah:

```bash
# Build Android & Flutter container (or use default Containerfile)
podman build -t android-toolbox -f ContainerFiles/android .

# Build vanilla Chaotic-AUR + paru container
podman build -t chaotic-toolbox -f ContainerFiles/chaotic .
```
