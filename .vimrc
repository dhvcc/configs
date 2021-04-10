call plug#begin('~/.vim/plugged')
" One dark theme
Plug 'rakr/vim-one'
" Status bar
Plug 'itchyny/lightline.vim'
" Tree explorer
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Linter
Plug 'dense-analysis/ale'
" Git
Plug 'airblade/vim-gitgutter'

Plug 'wakatime/vim-wakatime'
call plug#end()

" Lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set laststatus=2

" NerdTree
let NERDTreeShowHidden=1

" Vim one
colorscheme one
set background=dark
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Other
syntax enable
filetype indent on
set number
set ruler
" Indent
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
