#!/usr/bin/env bash
cat "$(basename ${BASH_SOURCE[0]} .sh).txt" | xargs Pacman -S --needed
return 0
