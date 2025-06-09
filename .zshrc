#!/usr/bin/env zsh
ZSH_ARRAY=("${HOME}/.zsh" "${HOME}/.zsh_shared")
for str in ${ZSH_ARRAY[@]}; do
  if [[ -d ${str} && -r ${str} && -x ${str} ]]; then
    for file in ${str}/**/*.zsh; do
      [[ -r ${file} ]] && source ${file}
    done
  fi
done
