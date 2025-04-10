#!usr/bin/env bash
set -euxo pipefail && :<<'USAGE'
Usage: $(basename "$0") [-h | --help] [NAME]

Options:
  -h | --help Display this help
USAGE
function init () {
  readonly local _scr_dir=$(cd "$(dirname "$0")"; pwd)
  cd "${_scr_dir}"
  lporg default -n -y
  return 0
}
function usage () {
  while IFS= read -r line && [ ! "${line#*:}" = "<<'$1'" ]; do :; done
  while IFS= read -r line && [ ! "$line" = "$1" ]; do set "$@" "$line"; done
  shift && [ $# -eq 0 ] || printf '%s\n' "cat<<$line" "$@" "$line"
}
case ${1:-} in (-h | --help)
  eval "$(usage "USAGE" < "$0")"
  exit 0
esac
function main () {
  init
  return 0
}
main "$@"

