#!usr/bin/env bash
ARRAY=(browser rosetta)
brew bundle dump -f --global
csplit -f ~/temp -n 4 ~/.Brewfile /^mas/ {0}
mv ~/temp0000 ${dotdir}/.Brewfile_basic
mv ~/temp0001 ${dotdir}/.Brewfile_mas
rm -f ~/.Brewfile
for i in "${ARRAY[@]}"; do
  while read line; do
    grep -v "${line}" ${dotdir}/.Brewfile_basic > ${dotdir}/.Brewfile_basic.bak
    rm -f ${dotdir}/.Brewfile_basic
    mv ${dotdir}/.Brewfile_basic.bak ${dotdir}/.Brewfile_basic
  done < ${dotdir}/.Brewfile_${i}
done
exit 0
