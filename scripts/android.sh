#!/usr/bin/env bash
set -euo pipefail

# 1. Run base Chaotic-AUR configuration and package installation
/scripts/chaotic.sh

echo "==> Installing Android & Flutter stack from android.packages..."
grep -v '^#' /packages/android.packages | xargs pacman -S --needed --noconfirm
rm -rf /var/cache/pacman/pkg/*

echo "==> Configuring environment variables..."
cat << 'EOF' > /etc/profile.d/android-dev.sh
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export FLUTTER_ROOT=/opt/flutter
export PATH="$PATH:$FLUTTER_ROOT/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/cmdline-tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin"
EOF
chmod 0755 /etc/profile.d/android-dev.sh
cat /etc/profile.d/android-dev.sh >> /etc/bash.bashrc

cat << 'EOF' >> /etc/environment
JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ANDROID_HOME=/opt/android-sdk
ANDROID_SDK_ROOT=/opt/android-sdk
FLUTTER_ROOT=/opt/flutter
EOF

echo "==> Pre-accepting Android SDK licenses..."
mkdir -p /opt/android-sdk/licenses
printf '\n24333f8a63b6825ea9c5514f83c2829b004d1fee' > /opt/android-sdk/licenses/android-sdk-license
printf '\n84831b9409646a256e4447b85098da47fdbdec14' > /opt/android-sdk/licenses/android-sdk-preview-license
printf '\nd9754445763940e28b631cf49e468c816e471415' > /opt/android-sdk/licenses/android-googletv-license
printf '\n33b6a2b64f07f1123f53c43484cca92900996822' > /opt/android-sdk/licenses/google-gdk-license
printf '\ne9acab5b5fbb560a72cfa4f6d0ee0da0df705f65' > /opt/android-sdk/licenses/mips-android-sysimage-license

echo "==> Configuring Flutter integration..."
git config --system --add safe.directory /opt/flutter
/opt/flutter/bin/flutter config --no-analytics
/opt/flutter/bin/flutter config --android-sdk /opt/android-sdk
/opt/flutter/bin/flutter config --android-studio-dir /opt/android-studio
/opt/flutter/bin/flutter precache --android --linux

echo "==> Setting up permissions and application shortcuts..."
chown -R root:wheel /opt/android-sdk /opt/flutter
chmod -R g+w /opt/android-sdk /opt/flutter
ln -sf /usr/bin/android-studio /usr/local/bin/studio
