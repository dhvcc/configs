#!/usr/bin/env zsh

curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --headless +'PlugInstall' +qall
nvim --headless "+Lazy! sync" +qa
nvim --headless "+MasonInstall --force dockerfile-language-server" +qa
nvim --headless "+MasonInstall --force docker-compose-language-service" +qa
nvim --headless "+MasonInstall --force pyright" +qa
nvim --headless "+MasonInstall --force gopls" +qa
nvim --headless "+MasonInstall --force typescript-language-server" +qa
nvim --headless "+MasonInstall --force ansible-language-server" +qa
nvim --headless "+MasonInstall --force bash-language-server" +qa
nvim --headless "+MasonInstall --force lua-language-server" +qa
# nvim --headless "+MasonInstall --force nginx-language-server" +qa

