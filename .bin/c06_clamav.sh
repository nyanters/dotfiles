#!usr/bin/env bash
set -euxo pipefail
case "$(uname)" in
  "Darwin")
    readonly CLAMAV_DIR="/opt/homebrew/etc/clamav";;
  "Linux")
    readonly CLAMAV_DIR="/usr/bin/etc/clamav";;
  *)
    echo "Neither macOS or Linux!"
    exit 1
esac
if [[ ! -f "${CLAMAV_DIR}/clamd.conf" ]]; then
  cp ${CLAMAV_DIR}/clamd.conf.sample ${CLAMAV_DIR}/clamd.conf
  vim ${CLAMAV_DIR}/clamd.conf
else
  :
fi
if [[ ! -f "${CLAMAV_DIR}/freshclam.conf" ]]; then
  cp ${CLAMAV_DIR}/freshclam.conf.sample ${CLAMAV_DIR}/freshclam.conf
  vim ${CLAMAV_DIR}/freshclam.conf
else
  :
fi
sudo mkdir -p /usr/local/var/run/clamav
freshclam -v
if ps ax | grep [c]lamd &> /dev/null; then
  echo "clamd running"
else
  clamd
fi
return 0
