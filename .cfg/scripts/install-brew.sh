#!/usr/bin/env bash

if test -f "$(which apt)"; then
  CMD=""
  if [ "$(id -u)" != "0" ]; then
    CMD="sudo"
  fi
  ${CMD} apt install -y build-essential
fi

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | env NONINTERACTIVE=1 bash
