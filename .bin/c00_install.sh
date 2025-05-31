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
fi
source c04_uv_pre.sh
source ~/.venv/bin/activate
cd "${SCR_DIR}"
source c05_uv_post.sh
source c06_clamav.sh
exit 0
