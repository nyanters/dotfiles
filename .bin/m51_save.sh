#!usr/bin/env bash
brew bundle dump -f --global
csplit -f ~/temp -n 4 ~/.Brewfile /^mas/ {0}
mv ~/temp0000 ${dotdir}/.Brewfile_basic
mv ~/temp0001 ${dotdir}/.Brewfile_mas
rm -f ~/.Brewfile
for line in ~/.Brewfile_rosetta; do
  grep -v ${line} ~/.Brewfile_basic >> ${dotdir}/.Brewfile_basic
done
exit 0
