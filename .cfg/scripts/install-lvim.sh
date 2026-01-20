#!/usr/bin/env bash

# Install LunarVim
# Requires neovim to be installed first

# Check for nvim in common locations
NVIM_PATH=""
if command -v nvim &> /dev/null; then
  NVIM_PATH=$(command -v nvim)
elif [ -f "/home/linuxbrew/.linuxbrew/bin/nvim" ]; then
  NVIM_PATH="/home/linuxbrew/.linuxbrew/bin/nvim"
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
elif [ -f "/opt/homebrew/bin/nvim" ]; then
  NVIM_PATH="/opt/homebrew/bin/nvim"
  export PATH="/opt/homebrew/bin:$PATH"
fi

if [ -z "$NVIM_PATH" ]; then
  echo "Warning: neovim not found, skipping LunarVim installation"
  echo "You can install LunarVim manually later by running:"
  echo "LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)"
  exit 0
fi

echo "Found neovim at: $NVIM_PATH"

# Install LunarVim
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh) --no-install-dependencies
