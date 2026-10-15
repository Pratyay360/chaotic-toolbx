#!/usr/bin/env bash
set -euo pipefail


pacman -Syyu
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

sudo pacman -Syyu

sudo  pacman -Sy git base-devel paru


# echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/toolbox
# chmod 0440 /etc/sudoers.d/toolbox
