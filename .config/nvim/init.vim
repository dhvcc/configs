set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

call plug#begin('~/.vim/plugged')
source ~/.vim/plugins.vim
call plug#end()

" EASYMOTION
" f is single-char, F is double-char bidirectional motion search
map f <Plug>(easymotion-s)
map F <Plug>(easymotion-s2)

source ~/.vimrc
source ~/.vim/coc.vim

colorscheme nord
