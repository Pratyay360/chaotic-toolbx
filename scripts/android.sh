#!/usr/bin/env bash
set -euo pipefail

grep -v '^#' /packages/android.packages | xargs pacman -S --needed --noconfirm
