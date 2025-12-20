#!/usr/bin/env zsh
if [[ "$(uname)" == "Darwin" && "$(uname -m)" == "arm64" ]]; then
  eval $(/opt/homebrew/bin/brew shellenv)
fi
if [[ "$(uname)" == "Darwin" || "$(uname)" == "Linux" ]]; then
  export HOMEBREW_NO_ANALYTICS=1
fi
