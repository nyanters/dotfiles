#!/usr/bin/env bash
set -eoux pipefail
SCR_DIR=$(cd "$(dirname "$0")"; pwd)
cd "${SCR_DIR}"
# source c01_os.sh
source c02_link.sh
if [[ "$(uname)" == "Darwin" ]]; then
  source m01_init.sh
  source m02_defaults.sh
  source m03_finder.sh
  source m04_brew.sh
  source m05_lporg.sh
fi
# source c03_uv.sh
exit 0
