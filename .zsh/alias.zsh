#!/usr/bin/env zsh
alias 7za='7z a -mmt=on -mx=9 -sdel'
alias clamddl='clamdscan ~/Downloads --infected --remove'
alias clamdl='clamscan ~/Downloads -r --infected --remove'
alias d2u='dos2unix'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gp='git push'
alias mdt='markdown-toc --bullets "-" -i'
alias mpva='mpv --fs --hwdec=auto-safe --loop-playlist=inf --no-audio-display --no-video --profile=fast'
alias mpvas='mpv --fs --hwdec=auto-safe --loop-playlist=inf --no-audio-display --no-video --profile=fast --shuffle'
alias mpvv='mpv --fs --hwdec=auto-safe --loop-playlist=inf --profile=fast'
alias mpvvs='mpv --fs --hwdec=auto-safe --loop-playlist=inf --profile=fast --shuffle'
if [[ "$(uname)" == "Darwin" ]]; then
  alias bbdfg='brew bundle dump -f --global'
  alias bucg='brew upgrade --cask -g'
  alias lporgd='lporg default -n -y'
fi
