#!usr/bin/env bash
# https://docs.brew.sh/Shell-Completion
if type brew &>/dev/null
then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
  then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
    do
      [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
    done
  fi
fi
# https://qiita.com/G-awa/items/147dfc88513710d5da3c
# developブランチのHEADをPullしてきて、新しく作業ブランチを切り替える
girk() {
  # developブランチに切り替え
  git checkout develop;
  # 最新をpull
  git pull origin develop;
  # 作業ブランチを切る
  read -p "Input feature branch name: " BRANCH
  git checkout -b ${BRANCH}
}
export PATH=~/.rd/bin:$PATH
