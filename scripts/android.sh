#!/usr/bin/env bash
set -euo pipefail

mapfile -t packages < <(grep -Ev '^[[:space:]]*(#|$)' /packages/android.packages)

if (( ${#packages[@]} == 0 )); then
    echo "android.packages is missing or empty" >&2
    exit 1
fi

for attempt in 1 2 3; do
    if pacman -Syu --needed --noconfirm "${packages[@]}"; then
        find /var/cache/pacman/pkg -mindepth 1 -delete
        exit 0
    fi

    if (( attempt < 3 )); then
        echo "pacman failed; retrying (${attempt}/3)" >&2
        sleep $((attempt * 10))
    fi
done

exit 1
