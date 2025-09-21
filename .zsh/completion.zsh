#!/usr/bin/env zsh
COMPLETION_ROOT=~/.zsh/Completion
fpath=( ${COMPLETION_ROOT}/* "${fpath[@]}" )
for i in ${COMPLETION_ROOT}/*; do
  autoload -Uz ${i}
done
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''
