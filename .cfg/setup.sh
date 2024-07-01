#!/bin/sh

if test -f "$(which apt)"; then
  CMD=""
  if [ "$(id -u)" != "0" ]; then
    CMD="sudo"
  fi
  ${CMD} apt install -y zsh
fi

./.cfg/scripts/install-brew.sh
./.cfg/scripts/install-packages.sh

nvm install 16

./.cfg/scripts/install-omb.sh
./.cfg/scripts/install-omz.sh

./.cfg/scripts/install-neovim.sh
