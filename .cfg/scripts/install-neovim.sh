#!/usr/bin/env zsh

. ~/.zshrc

curl -sL -o /var/cache/apt/archives/nvim-linux64.deb  https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb && dpkg -i /var/cache/apt/archives/nvim-linux64.deb

python -m venv ~/.vim/.venv
~/.vim/.venv/bin/pip install pynvim pyright
npm i -g neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +'PlugInstall' +qall
nvim --headless +'CocInstall' +qall  # FIXME