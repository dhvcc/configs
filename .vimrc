"""""""""""""""
"   General   "
" Terminal
:tnoremap <Esc> <C-\><C-n>

" Escape with jk in insert mode
inoremap jk <ESC>

set scrolloff=5
set number relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

" Show trailing spaces
set list
set listchars+=trail:◦
"   General   "
"""""""""""""""

""""""""""""
" Vim plug "
call plug#begin('~/.vim/plugged')
Plug 'dhvcc/nord-mint-vim' " Theme
Plug 'editorconfig/editorconfig-vim' " editorconfig support
Plug 'vim-airline/vim-airline' " Statusline
" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' " Git status in NERDTree
Plug 'scrooloose/nerdcommenter' " Ctrl+/ comment toggle
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' " Icons for NERDTree
call plug#end()
" Vim plug "
""""""""""""

""""""""""""
" NerdTree "
" Comment lines with Ctrl+/
filetype plugin on

nmap <C-_> <plug>NERDCommenterToggle

" Ctrl+B toogle tree
nmap <C-B> :NERDTreeToggle<CR>

let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",
    \ "Modified"  : "#d9bf91",
    \ "Renamed"   : "#51C9FC",
    \ "Untracked" : "#FCE77C",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#FFBD61",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }
let g:NERDTreeIgnore = ['^node_modules$', '^venv$', '^.venv$', '^__pycache__$', '.sass-cache']
:let g:NERDTreeShowLineNumbers=1
:autocmd BufEnter NERD_* setlocal rnu
"          "
""""""""""""

colorscheme nord
