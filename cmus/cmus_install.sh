#!/bin/bash

# install, configure and build cmus from source


set -euo pipefail # exit on any error

CMUS_SRC_URL="https://github.com/cmus/cmus.git"
WORKDIR="$(mktemp -d /tmp/cmus_build.XXXXXX)/"


echo "Cloning '$CMUS_SRC_URL' into '$WORKDIR'..."
git clone "$CMUS_SRC_URL" "$WORKDIR"
cd "$WORKDIR"

echo $'\nConfiguring cmus...'
./configure

echo $'\nBuilding cmus...'
make -j$(nproc) # build using all CPU cores
sudo make install

printf "\nSuccess. Use 'make uninstall' to uninstall cmus.\nRemove '%s' if needed.\n" "$WORKDIR"
exit 0
