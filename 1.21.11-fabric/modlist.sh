#!/usr/bin/bash

set -euo pipefail
shopt -s nullglob

cd "$(dirname "$0")"

pakku ls --name-max-length 114514 \
  | sed 's/^.*mr=/mr=/g' \
  | sed 's/^.*cf=/cf=/g' \
  | sed 's/[\} ].*$//g' \
  | sed 's/\x1b\[[0-9;]*m//g' \
  | grep '=' --color=none \
  | sed 's/mr=/pakku add prj --mr /g'