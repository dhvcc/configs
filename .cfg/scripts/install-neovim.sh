#!/usr/bin/zsh -i

curl -sL -o /var/cache/apt/archives/nvim-linux64.deb  https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb && dpkg -i /var/cache/apt/archives/nvim-linux64.deb

python -m venv ~/.vim/.venv #> /dev/null 2>&1
~/.vim/.venv/bin/pip install pynvim pyright
npm i -g neovim #> /dev/null 2>&1
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +'PlugInstall' +qall #> /dev/null 2>&1
nvim --headless +'CocInstall' +qall  #> /dev/null 2>&1 # FIXME
