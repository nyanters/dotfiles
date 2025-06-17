#!usr/bin/env bash
cd $(cd "$(dirname "$0")"; pwd)
source x00_var.sh
if [[ "$(uname)" == "Darwin" ]]; then
  source m51_save.sh
fi
exit 0
