#!usr/bin/env bash

brew bundle dump -f --global
csplit -f ~/temp -n 4 ~/.Brewfile /^mas/ {0}
mv ~/temp0000 ${dotdir}/.Brewfile_basic
mv ~/temp0001 ${dotdir}/.Brewfile_mas
exit 0
