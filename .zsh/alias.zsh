#!/usr/bin/env zsh
alias clamddl='clamdscan ~/Downloads --infected --remove'
alias clamdl='clamscan ~/Downloads -r --infected --remove'
alias gaa='git add -A'
alias mpva='mpv --fs --hwdec=auto-safe --loop-playlist=inf --no-audio-display --no-video --profile=fast'
alias mpvas='mpv --fs --hwdec=auto-safe --loop-playlist=inf --no-audio-display --no-video --profile=fast --shuffle'
alias mpvv='mpv --fs --hwdec=auto-safe --loop-playlist=inf --profile=fast'
alias mpvvs='mpv --fs --hwdec=auto-safe --loop-playlist=inf --profile=fast --shuffle'
if [[ "$(uname)" == "Darwin" ]]; then
  alias bucg='brew upgrade --cask -g'
  alias lporgd='lporg default -n -y'
fi
