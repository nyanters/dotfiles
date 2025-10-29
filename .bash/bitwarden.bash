#!usr/bin/env bash
if [[ "$(uname)" == "Linux" ]]; then
  export SSH_AUTH_SOCK=${HOME}/.bitwarden-ssh-agent.sock
  export SSH_AUTH_SOCK=${HOME}/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
fi
