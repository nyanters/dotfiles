#!/usr/bin/env zsh
BASH_ARRAY=("${HOME}/.bash" "${HOME}/.bash_shared")
for str in ${BASH_ARRAY[@]}; do
  if [[ -d ${str} && -r ${str} && -x ${str} ]]; then
    for file in ${str}/**/*.bash; do
      [[ -r ${file} ]] && source ${file}
    done
  fi
done
