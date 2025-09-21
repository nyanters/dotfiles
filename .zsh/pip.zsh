#!/usr/bin/env zsh
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
export PATH=$PATH:${HOME}/.local/bin
export PIP_CONFIG_FILE="${HOME}/.config/pip/pip.conf"
source ~/.venv/bin/activate
