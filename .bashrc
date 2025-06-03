#!/usr/bin/env zsh
ZSH_DIR="${HOME}/.bash"
ZSH_LOCAL="${HOME}/.bash_shared"
# .zshがディレクトリで、読み取り、実行、が可能なとき
if [[ -d $ZSH_DIR && -r $ZSH_DIR && -x $ZSH_DIR ]]; then
  # zshディレクトリより下にある、.zshファイルの分、繰り返す
  for file in ${ZSH_DIR}/**/*.bash; do
    # 読み取り可能ならば実行する
    [[ -r $file ]] && source $file
  done
fi
if [[ -d $ZSH_LOCAL && -r $ZSH_LOCAL && -x $ZSH_LOCAL ]]; then
  for file in ${ZSH_LOCAL}/**/*.bash; do
    [[ -r $file ]] && source $file
  done
fi
