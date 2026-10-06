#!/usr/bin/env bash
set -euo pipefail

echo "==> Installing build dependencies via dnf..."
if [ -s /packages/brew.packages ]; then
    grep -v '^#' /packages/brew.packages | xargs dnf -y install
    dnf clean all
else
    echo "brew.packages is missing or empty" >&2
    exit 1
fi

echo "==> Creating non-root user for Homebrew..."
useradd -m -s /bin/bash brew
echo 'brew ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/brew
chmod 0440 /etc/sudoers.d/brew

echo "==> Installing Homebrew under the brew user..."
su - brew -c 'NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

echo "==> Making Homebrew reachable for every user..."
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' > /etc/profile.d/brew.sh
chmod 0644 /etc/profile.d/brew.sh

echo "==> Configuring toolbx permissions..."
echo '%wheel ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/toolbox
chmod 0440 /etc/sudoers.d/toolbox