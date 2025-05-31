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
if [[ "$(uname)" == "Linux" && -e /etc/arch-release ]]; then
  source p01_pacman.sh
  source p02_yay.sh
fi
if [[ "$(uname)" == "Linux" && -e /etc/debian_version || -e /etc/debian_release ]]; then
  source d01_apt.sh
fi
if [[ "$(uname)" == "Linux" && $(grep "^ID=" /etc/os-release | awk -F= '{print $2}') == "alpine" ]]; then
  source a01_apk.sh
fi
cd "${SCR_DIR}"
source c04_uv_pre.sh
source ~/.venv/bin/activate
cd "${SCR_DIR}"
if [[ "$(uname)" == "Darwin" ]]; then
  source c05_uv_post.sh
  source c06_clamav.sh
fi
exit 0
