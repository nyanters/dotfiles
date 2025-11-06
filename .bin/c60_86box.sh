#!usr/bin/env bash
set -euo pipefail && :<<'USAGE'
Usage: $(basename "$0") [-h | --help] [NAME]

Options:
  -h | --help Display this help
USAGE
function init () {
  readonly local _src="${HOME}/GitHub/roms"
  if [[ "$(uname)" == "Darwin" ]]; then
    local _lnk="${HOME}/Library/Application Support/net.86box.86Box/roms"
  fi
  if [[ ! -d "${_src}" ]]; then
    cd "$(dirname "${_src}")"
    git clone https://github.com/86Box/roms.git
  fi
  if [[ -d "${_lnk}" ]]; then
    rm -r "${_lnk}"
  fi
  ln -s "${_src}" "${_lnk}"
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

