#!/bin/sh

if test -f "$(which apt)"; then
  CMD=""
  if [ "$(id -u)" != "0" ]; then
    CMD="sudo"
  fi
  ${CMD} apt install -y zsh
fi

export PATH="/home/linuxbrew/.linuxbrew/bin:/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

./.cfg/scripts/install-brew.sh
./.cfg/scripts/install-packages.sh

pipx install poetry --include-deps
pipx install ansible --include-deps
pipx install git+https://github.com/politeauthority/docker-pretty-ps.git#egg=docker-pretty-ps

export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
nvm install 16

# Install rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

./.cfg/scripts/install-omb.sh
./.cfg/scripts/install-omz.sh

./.cfg/scripts/install-neovim.sh
