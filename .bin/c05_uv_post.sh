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
  cd "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  uv pip install -r "$(basename "${BASH_SOURCE[0]}" .sh)".txt
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

