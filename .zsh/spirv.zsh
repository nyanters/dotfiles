#!/usr/bin/env zsh
if [[ "$(uname)" == "Darwin" ]]; then
  CFLAGS="-I/opt/homebrew/opt/spirv-headers/include"
fi
