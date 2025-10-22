#!usr/bin/env bash
set -euo pipefail
MENU="minimal mas rosetta full manager"
PS3="Choose your option (1-5):"
if [[ -f ~/.Brewfile ]]; then
  rm ~/.Brewfile
elif [[ -L ~/.Brewfile ]]; then
  unlink -- ~/.Brewfile
fi
select val in ${MENU}; do
  case ${val} in
    minimal)
      brew bundle --file ~/.Brewfile_basic
      brew bundle cleanup -f --file ~/.Brewfile_basic
      break
      ;;
    mas)
      cat ~/.Brewfile_{basic,${val}} >> ~/.Brewfile
      brew bundle --global
      brew bundle cleanup -f --global
      rm ~/.Brewfile
      break
      ;;
    rosetta)
      cat ~/.Brewfile_{basic,rosetta,wine} >> ~/.Brewfile
      brew bundle --global
      brew bundle cleanup -f --global
      rm ~/.Brewfile
      break
      ;;
    full)
      cat ~/.Brewfile_{basic,mas,rosetta,wine} >> ~/.Brewfile
      brew bundle --global
      brew bundle cleanup -f --global
      rm ~/.Brewfile
      break
      ;;
    manager)
      cat ~/.Brewfile_* >> ~/.Brewfile
      brew bundle --global
      brew bundle cleanup -f --global
      rm ~/.Brewfile
      break
      ;;
    *)
      echo "Please enter valid number again!"
      ;;
  esac
done
return 0
