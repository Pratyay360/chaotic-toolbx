#!/usr/bin/env bash
set -euo pipefail

echo "==> Configuring Chaotic-AUR repository..."
pacman-key --init
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
pacman-key --lsign-key 3056513887B78AEB
pacman -U --noconfirm 'https://geo-mirror.chaotic.cx/chaotic-aur/x86_64/chaotic-keyring.pkg.tar.zst'
pacman -U --noconfirm 'https://geo-mirror.chaotic.cx/chaotic-aur/x86_64/chaotic-mirrorlist.pkg.tar.zst'
sed -i 's|^Server = https://cdn-mirror.chaotic.cx|# Server = https://cdn-mirror.chaotic.cx|' /etc/pacman.d/chaotic-mirrorlist
printf '\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n' >> /etc/pacman.conf

echo "==> Installing packages from chaotic.packages..."
grep -v '^#' /packages/chaotic.packages | xargs pacman -Syu --needed --noconfirm
rm -rf /var/cache/pacman/pkg/*

echo "==> Configuring toolbx permissions..."
echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/toolbox
chmod 0440 /etc/sudoers.d/toolbox
