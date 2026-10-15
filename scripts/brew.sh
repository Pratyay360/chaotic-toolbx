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
if ! id brew >/dev/null 2>&1; then
    useradd -m -s /bin/bash brew
fi

echo "==> Pre-creating Homebrew prefix with correct ownership..."
mkdir -p /home/linuxbrew/.linuxbrew
chown -R 1000:1000 /home/linuxbrew

echo "==> Installing Homebrew under the brew user..."
su - brew -c 'NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'

echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' > /etc/profile.d/brew.sh
