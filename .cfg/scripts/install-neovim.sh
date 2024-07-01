#!/usr/bin/env zsh

. ~/.zshrc

curl -fLo '~/.vim/autoload/plug.vim' --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

python -m venv ~/.vim/.venv
~/.vim/.venv/bin/pip install pynvim pyright
npm i -g neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +'PlugInstall' +qall
nvim --headless +'CocInstall' +qall  # FIXME
