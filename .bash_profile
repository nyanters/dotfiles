#!/usr/bin/env bash
BASH_DIR="${HOME}/.bpr"
# .zshがディレクトリで、読み取り、実行、が可能なとき
if [[ -d $BASH_DIR && -r $BASH_DIR && -x $BASH_DIR ]]; then
  # zshディレクトリより下にある、.zshファイルの分、繰り返す
  for file in ${BASH_DIR}/**/*.bash; do
    # 読み取り可能ならば実行する
    [[ -r $file ]] && source $file
  done
fi
