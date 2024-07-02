#!/usr/bin/env zsh

curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --headless +'PlugInstall' +qall
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonInstall dockerfile-language-server" +qa
nvim --headless "+MasonInstall docker-compose-language-service" +qa
nvim --headless "+MasonInstall --force pyright" +qa
nvim --headless "+MasonInstall gopls" +qa
nvim --headless "+MasonInstall typescript-language-server" +qa
nvim --headless "+MasonInstall ansible-language-server" +qa
nvim --headless "+MasonInstall bash-language-server" +qa
nvim --headless "+MasonInstall lua-language-server" +qa
nvim --headless "+MasonInstall nginx-language-server" +qa

