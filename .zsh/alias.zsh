#!/usr/bin/env zsh
alias 7za='7z a -mmt=on -mx=9 -sdel'
alias cat='bat --paging=never'
alias clamddl='clamdscan ~/Downloads --infected --remove'
alias clamdl='clamscan ~/Downloads -r --infected --remove'
alias cut4dl='_cut4dl'
alias d2u='dos2unix'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gp='git push'
alias mamew='mame -window'
alias mdt='markdown-toc --bullets "-" -i'
alias mpva='mpv --fs --hwdec=auto-safe --loop-playlist=inf --no-audio-display --no-video --profile=fast'
alias mpvas='mpv --fs --hwdec=auto-safe --loop-playlist=inf --no-audio-display --no-video --profile=fast --shuffle'
alias mpvv='mpv --fs --hwdec=auto-safe --loop-playlist=inf --profile=fast'
alias mpvvs='mpv --fs --hwdec=auto-safe --loop-playlist=inf --profile=fast --shuffle'
alias ls='eza --icons --group-directories-first'
alias vvim='vim -u NONE -N'
alias zrc='source ~/.zshrc'
if [[ "$(uname)" == "Darwin" ]]; then
  alias bbc='brew bundle cleanup -f --global'
  alias bbd='brew bundle dump -f --global'
  alias bucg='brew upgrade --cask -g'
  alias bupd='brew update'
  alias bupg='brew upgrade'
  alias cdock='find 2>/dev/null /private/var/folders/ -type d -name com.apple.dock.launchpad -exec rm -rf {} +; killall Dock'
fi
function _cut4dl () {
  _i=0
  cd ~/Downloads
  cut -d ',' -f 2 "$1" | sed -e '1,2d' > req.txt
  while read LINE; do
    _origname=$(basename ${LINE})
    _ext=${_origname##*.}
    _i=$((_i+1))
    _i4=$(printf "%04d" "${_i}")
    wget -O ${_i4}.${_ext} ${LINE}
  done < req.txt
  rm -f req.txt
  return 0
}
