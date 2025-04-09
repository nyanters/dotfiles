#!usr/bin/env bash
set -euxo pipefail && :<<'USAGE'
Usage: $(basename "$0") [-h | --help] [NAME]

Options:
  -h | --help Display this help
USAGE
function init () {
  readonly local _fn="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")" .bash)"
  readonly local _scr_dir="$(realpath "$(dirname "$0")")"
  cd "${_scr_dir}"
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
exit 0
