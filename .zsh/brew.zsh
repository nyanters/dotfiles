#!/usr/bin/env zsh
if [[ "$(uname)" == "Darwin" || "$(uname)" == "Linux" ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
  export HOMEBREW_NO_ANALYTICS=1
fi
