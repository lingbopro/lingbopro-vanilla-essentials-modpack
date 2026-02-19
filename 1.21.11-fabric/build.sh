#!/usr/bin/bash

set -euo pipefail
shopt -s nullglob

if ! command -v pakku &> /dev/null
then
  echo "pakku is not installed"
  exit 2
fi

cd "$(dirname "$0")"

pakku export

files=(./build/modrinth/*.mrpack)
files+=(./build/serverpack/*.zip)

for file in "${files[@]}"; do
  mv "$file" "$(echo $file | sed 's/ /_/g')"
done