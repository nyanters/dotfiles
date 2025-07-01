#!usr/bin/env bash
set -euo pipefail
function login_check {
  sleep 1; echo "Open the App Store." && open -a App\ Store
  while true; do
    echo -n "$* [Y/n]: (default: n) "
    read ANS
    case $ANS in
      [Yy]*)
        return 0
        ;;
      [Nn]*)
        return 1
        ;;
      *)
        open_app_store
        ;;
    esac
  done
}

if login_check "Did you login?"; then
  if [[ -f ~/.Brewfile ]]; then
    rm ~/.Brewfile
  elif [[ -L ~/.Brewfile ]]; then
    unlink -- ~/.Brewfile
  fi
  cat ~/.Brewfile_* >> ~/.Brewfile
  brew bundle --global
  rm ~/.Brewfile
else
  brew bundle --file ~/.Brewfile_basic
fi
return 0
