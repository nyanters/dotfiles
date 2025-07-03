#!/usr/bin/env zsh
if [[ "$(uname)" == "Darwin" ]]; then
  export SSH_AUTH_SOCK=${HOME}/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
fi
if [[ "$(uname)" == "Linux" ]]; then
  export SSH_AUTH_SOCK=${HOME}/.bitwarden-ssh-agent.sock
fi
