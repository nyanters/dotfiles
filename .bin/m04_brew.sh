#!usr/bin/env bash
set -euxo pipefail
SCR_DIR=$(cd "$(dirname "$0")"; pwd)
cd "${SCR_DIR}"

function login_check {
  sleep 1; echo "Open the App Store." && open -a App\ Store
  while true; do
    echo -n "$* [Y/n]: (default: n) "
    read ANS
    case $ANS in
      [Yy]*)
        return 0
        ;;
      *)
        open_app_store
        ;;
    esac
  done
}

if login_check "Did you login?"; then
#   brew tap homebrew/cask --force
#   brew tap homebrew/core --force
  brew bundle --global
#   brew untap homebrew/cask --force
#   brew untap homebrew/core --force
fi
return 0
