#!/usr/bin/env bash

if test -f "$(which apt)"; then
  sudo apt install -y build-essential curl git
fi

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | env NONINTERACTIVE=1 bash
