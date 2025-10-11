#!usr/bin/env bash
export PATH=$PATH:~/.rd/bin
export PATH=$PATH:~/.nodebrew/src/v22.2.0/node-v22.2.0-darwin-arm64.tar.gz
export PATH="~/.rd/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"
# https://qiita.com/nmrmsys/items/03f97f5eabec18a3a18b
if [[ ${SHLVL} = 1 ]]; then
  tmux
fi
