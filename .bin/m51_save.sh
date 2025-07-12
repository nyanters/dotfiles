#!usr/bin/env bash
brew bundle dump -f --global
csplit -f ~/temp -n 4 ~/.Brewfile /^mas/ {0}
mv ~/temp0000 ${dotdir}/.Brewfile_basic.bak
mv ~/temp0001 ${dotdir}/.Brewfile_mas
rm -f ~/.Brewfile
while read line; do
  grep -v "${line}" ${dotdir}/.Brewfile_basic.bak > ${dotdir}/.Brewfile_basic
  rm -f ${dotdir}/.Brewfile_basic.bak
  mv ${dotdir}/.Brewfile_basic ${dotdir}/.Brewfile_basic.bak
done < ${dotdir}/.Brewfile_rosetta
mv ${dotdir}/.Brewfile_basic.bak ${dotdir}/.Brewfile_basic
exit 0
