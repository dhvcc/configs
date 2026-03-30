#!/usr/bin/env bash

# Install unzip first (needed for font casks)
brew install unzip

# Reload brew environment to make unzip available
if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install remaining packages
brew install vim neovim \
  starship fastfetch fzf btop wget \
  uv fnm go \
  oxker k9s \
  lsd fd ripgrep bat `# rust utils` \
  gh delta diffnav lazygit \
  font-hack-nerd-font `# for terminal`

