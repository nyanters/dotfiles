#!/usr/bin/env zsh
# https://qiita.com/P-man_Brown/items/2b8a6eb67dbdbf7ab1fc
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi
