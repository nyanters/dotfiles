#!/usr/bin/env bash
cat "$(basename ${BASH_SOURCE[0]} .sh).txt" | xargs pacman -S --needed --noconfirm
return 0
