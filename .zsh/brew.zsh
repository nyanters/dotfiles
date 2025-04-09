#!/usr/bin/env zsh
if [[ "$(uname)" == "Darwin" || "$(uname)" == "Linux" ]]; then
  export HOMEBREW_NO_ANALYTICS=1
fi
