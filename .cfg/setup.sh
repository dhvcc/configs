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

brew install zsh
pipx install poetry --include-deps
pipx install ansible --include-deps
pipx install git+https://github.com/politeauthority/docker-pretty-ps.git#egg=docker-pretty-ps
pipx install ranger-fm --include-deps
pipx install ipython --include-deps

export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
nvm install 16

./.cfg/scripts/install-omb.sh
./.cfg/scripts/install-omz.sh

./.cfg/scripts/install-neovim.sh
