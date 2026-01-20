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

# Reload brew environment to ensure all installed binaries are in PATH
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

uv tool install poetry
uv tool install ansible

export NVM_DIR="$HOME/.nvm"
if [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ]; then
  \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
  nvm install --lts
elif [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  nvm install --lts
else
  echo "Warning: nvm not found, skipping Node.js LTS installation"
fi

# Install rust
curl https://sh.rustup.rs -sSf | sh -s -- -y

./.cfg/scripts/install-omb.sh
./.cfg/scripts/install-omz.sh

# Install LunarVim (requires neovim)
./.cfg/scripts/install-lvim.sh
