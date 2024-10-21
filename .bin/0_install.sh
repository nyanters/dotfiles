#!/usr/bin/env bash
set -eoux pipefail
SCR_DIR=$(cd "$(dirname "$0")"; pwd)
cd "${SCR_DIR}"
source 1_os.sh
source 2_link.sh
exit 0
