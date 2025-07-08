#!usr/bin/env bash
set -euo pipefail
MENU="minimal mas rosetta full"
PS3="Choose your option (1-4):"
if [[ -f ~/.Brewfile ]]; then
  rm ~/.Brewfile
elif [[ -L ~/.Brewfile ]]; then
  unlink -- ~/.Brewfile
fi
select val in ${MENU}; do
  case ${val} in
    minimal)
      brew bundle --file ~/.Brewfile_basic
      break
      ;;
    mas | rosetta)
      cat ~/.Brewfile_basic ~/.Brewfile_${val} >> ~/.Brewfile
      brew bundle --global
      rm ~/.Brewfile
      break
      ;;
    full)
      cat ~/.Brewfile_* >> ~/.Brewfile
      brew bundle --global
      rm ~/.Brewfile
      break
      ;;
    *)
      echo "Please enter valid number again!"
      ;;
  esac
done
return 0
