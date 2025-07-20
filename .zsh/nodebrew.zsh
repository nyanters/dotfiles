#!/usr/bin/env zsh
if [[ "$(uname)" == "Darwin" ]]; then
  export PATH=$HOME/.nodebrew/current/bin:$PATH
fi
