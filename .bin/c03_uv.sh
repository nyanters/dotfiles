#!usr/bin/env bash
set -euxo pipefail && :<<'USAGE'
Usage: $(basename "$0") [-h | --help] [NAME]

Options:
  -h | --help Display this help
USAGE
function usage () {
  while IFS= read -r line && [ ! "${line#*:}" = "<<'$1'" ]; do :; done
  while IFS= read -r line && [ ! "$line" = "$1" ]; do set "$@" "$line"; done
  shift && [ $# -eq 0 ] || printf '%s\n' "cat<<$line" "$@" "$line"
}
function uv_pip () {
  local _fn="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")" .sh)"
  if [[ "$(uname)" == "Linux" ]] ; then
    curl -LsSf https://astral.sh/uv/install.sh | sh
  fi
  cd
  uv venv
  source ~/.venv/bin/activate
  cd "$(cd "$(dirname "$0")"; pwd)"
  uv pip install -r c03_uv.txt
}
case ${1:-} in (-h | --help)
  eval "$(usage "USAGE" < "$0")"
  exit 0
esac
function main () {
  uv_pip
  return 0
}
main "$@"
exit 0

