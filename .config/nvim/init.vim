set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim
call plug#end()
source ~/.vimrc
