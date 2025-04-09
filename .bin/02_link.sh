#!usr/bin/env bash
set -euxo pipefail
readonly bak_dir="$HOME/.dotbackup"
readonly script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
readonly dotdir=$(dirname ${script_dir})
function 2homedir () {
  for f in ${dotdir}/${1}/**; do
    ln -snf ${f} $HOME/${1}/$(basename ${f})
  done
}
function check_homedir () {
  if [[ "$HOME" != "$dotdir" ]]; then
    for f in $1/.??*; do
      if [[ "${f}" == "$1/.config" ]]; then
        continue
      fi
      if [[ "${f}" == "$1/.zsh" ]]; then
        continue
      fi
      if [[ -L "$2/`basename $f`" ]];then
        command rm -f "$2/`basename $f`"
      fi
      if [[ -e "$2/`basename $f`" ]];then
        command mv "$2/`basename $f`" "$3"
      fi
    done
  else
    command echo "same install src dest"
  fi
}
function helpmsg () {
  command echo "Usage: $0 [--help | -h]" 0>&2
  command echo ""
}
function mkdir_w_mes () {
  if [ ! -d "$1" ];then
    command echo "$1 not found. Auto Make it"
    command mkdir "$1"
  fi
}
function link2homedir () {
  command echo "backup old dotfiles..."
  for f in $dotdir/.??*; do
    for line in `cat "${script_dir}/2_link.txt"`; do
      if [[ "$f" == "${dotdir}/${line}" ]]; then
        continue 2
      fi
    done
    command ln -snf $f $HOME
  done
}
while [ $# -gt 0 ];do
  case ${1} in
    --debug|-d)
      set -uex
      ;;
    --help|-h)
      helpmsg
      exit 1
      ;;
    *)
      ;;
  esac
  shift
done
function main_func () {
  mkdir_w_mes "${bak_dir}"
  check_homedir ${dotdir} $HOME ${bak_dir}
  mkdir_w_mes "$HOME/.config"
  mkdir_w_mes "$HOME/.zsh"
  link2homedir
  check_homedir ${dotdir}.config $HOME/.config "${bak_dir}/.config"
  check_homedir ${dotdir}.zsh $HOME/.zsh "${bak_dir}/.zsh"
  2homedir .config
  2homedir .zsh
  git config --global include.path "~/.gitconfig_shared"
  command echo -e "Install completed!!!!"
}
function main () {
  main_func
}
main "$@"
