#!/usr/bin/env bash
cat "$(basename ${BASH_SOURCE[0]} .sh).txt" | xargs apt install -y
return 0
