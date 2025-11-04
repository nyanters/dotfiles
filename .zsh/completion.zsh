#!/usr/bin/env zsh
COMPLETION_ROOT=(~/.zsh/Completion ~/.zsh_shared/Completion)
for i in ${COMPLETION_ROOT[@]}; do
  fpath=( ${i}/* "${fpath[@]}" )
  for j in ${i}/*; do
    autoload -Uz ${j}
  done
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
