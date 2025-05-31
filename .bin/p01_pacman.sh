#!/usr/bin/env bash
pacman -S --needed < "$(basename ${BASH_SOURCE[0]} .sh).txt"
return 0
