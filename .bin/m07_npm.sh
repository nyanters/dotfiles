#!usr/bin/env bash
set -euo pipefail
cd $(cd "$(dirname "$0")"; pwd)
while read line; do
  npm install ${line}
done < "$(basename ${BASH_SOURCE[0]} .sh).txt"
return 0
