#!usr/bin/env bash
set -euxo pipefail
SCR_DIR=$(cd "$(dirname "$0")"; pwd)
cd "${SCR_DIR}"
# Check operating system
if [[ "$(uname)" != "Darwin" &&  "$(uname)" != "Linux" ]] ; then
  echo "Neither macOS nor Linux!"
  exit 1
fi
