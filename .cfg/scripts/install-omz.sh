#!/usr/bin/env zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh-custom/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh-custom/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh-custom/plugins/zsh-completions"
