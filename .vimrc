call plug#begin('~/.vim/plugged')
Plug 'jcherven/jummidark.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'wakatime/vim-wakatime'
call plug#end()
" Syntax highlighting
syntax enable
colorscheme jummidark
" Other
filetype indent on
set number
set ruler
" Indent
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
