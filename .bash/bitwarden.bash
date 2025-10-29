#!usr/bin/env bash
if [[ "$(uname)" == "Linux" ]]; then
  export SSH_AUTH_SOCK=${HOME}/.bitwarden-ssh-agent.sock
fi
