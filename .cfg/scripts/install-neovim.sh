#!/usr/bin/env zsh

export PATH="/home/linuxbrew/.linuxbrew/bin:/opt/homebrew/bin:$PATH"

curl -fLo '~/.vim/autoload/plug.vim' --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --headless +'PlugInstall' +qall
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonInstall dockerfile-language-server" +qa
nvim --headless "+MasonInstall docker-compose-language-service" +qa
nvim --headless "+MasonInstall pyright" +qa
nvim --headless "+MasonInstall gopls" +qa
nvim --headless "+MasonInstall typescript-language-server" +qa

