#!/usr/bin/env bash

GIT_URL=https://github.com/suchmememanyskill/filament-detect.git
GIT_SHA=9407e942c6ae89275c24a8d31227755c08833873

if [[ -z "$CREATE_FIRMWARE" ]]; then
  echo "Error: This script should be run within the create_firmware.sh environment."
  exit 1
fi

set -eo pipefail

TARGET_DIR="$CACHE_DIR/filament-detect"
cache_git.sh "$TARGET_DIR" "$GIT_URL" "$GIT_SHA"

echo ">> Installing filament-detect..."
cd "$TARGET_DIR" 
make install DESTDIR="$ROOTFS_DIR/usr/local/bin/filament-detect/"
echo ">> filament-detect installation completed successfully."
