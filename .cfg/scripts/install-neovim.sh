#!/usr/bin/env zsh

curl -sL -o /var/cache/apt/archives/nvim-linux64.deb  https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb && dpkg -i /var/cache/apt/archives/nvim-linux64.deb

zsh -ic "python -m venv ~/.vim/.venv" #> /dev/null 2>&1
~/.vim/.venv/bin/pip install pynvim pyright
zsh -ic 'npm i -g neovim' #> /dev/null 2>&1
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
zsh -ic "nvim --headless +'PlugInstall' +qall" #> /dev/null 2>&1
zsh -ic "nvim --headless +'CocInstall' +qall"  #> /dev/null 2>&1 # FIXME
