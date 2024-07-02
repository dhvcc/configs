#!/usr/bin/env zsh

export PATH="/home/linuxbrew/.linuxbrew/bin:/opt/homebrew/bin:$PATH"

curl -fLo '~/.vim/autoload/plug.vim' --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#python -m venv ~/.vim/.venv
#~/.vim/.venv/bin/pip install pynvim pyright
#npm i -g neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +'PlugInstall' +qall
#nvim --headless +'CocInstall' +qall  # FIXME
