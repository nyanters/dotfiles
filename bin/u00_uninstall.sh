#!usr/bin/env bash
source x00_var.sh
if [[ "$(uname)" == "Darwin" ]]; then
  source m51_save.sh
fi
exit 0
