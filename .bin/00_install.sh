#!/usr/bin/env bash
set -eoux pipefail
SCR_DIR=$(cd "$(dirname "$0")"; pwd)
cd "${SCR_DIR}"
source 01_os.sh
source 02_link.sh
exit 0
