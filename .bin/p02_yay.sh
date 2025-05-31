#!/usr/bin/env bash
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
return 0
