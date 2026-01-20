#!/usr/bin/env bash

# Install LunarVim
# Requires neovim to be installed first

# Ensure brew path is available
export PATH="/home/linuxbrew/.linuxbrew/bin:/opt/homebrew/bin:$PATH"

if ! command -v nvim &> /dev/null; then
  echo "Error: neovim is not installed. Please install neovim first."
  exit 1
fi

# Install LunarVim
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh) --no-install-dependencies
