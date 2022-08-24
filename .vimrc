call plug#begin('~/.vim/plugged')
" Meta and UI
Plug 'mechatroner/rainbow_csv'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim' " editorconfig support
Plug 'dhvcc/nord-mint-vim' " Theme
Plug 'wakatime/vim-wakatime' " Time tracking
Plug 'vim-scripts/ShowTrailingWhitespace' " Trailing whitespace highlight
Plug 'vim-airline/vim-airline' " Statusline
"" Renamer
Plug 'nvim-lua/plenary.nvim'
Plug 'filipdutescu/renamer.nvim', { 'branch': 'master' }
" Character jumping
Plug 'easymotion/vim-easymotion'
" Language support
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Language server support
Plug 'ray-x/lsp_signature.nvim' " Function signature (and arguments) as you type
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' " Git status in NERDTree
Plug 'scrooloose/nerdcommenter' " Ctrl+/ comment toggle
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons' " Icons for NERDTree

" Git
Plug 'airblade/vim-gitgutter'

" FZF and Ctrl+P support
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" TODO: fix renamer and comments

""""""""""
" Basics "
colorscheme nord
"
" Relative number
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
"        "
""""""""""

" f is single-char, F is double-char bidirectional motion search
map f <Plug>(easymotion-s)
map F <Plug>(easymotion-s2)

" Renamer Alt+F2
inoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>
nnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>
vnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>

" FZF
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nmap <C-P> :Files<CR>

" Ctrl+B toogle tree
inoremap jk <ESC>
nmap <C-B> :NERDTreeToggle<CR>
" Comment lines with Ctrl+/
filetype plugin on
nmap <C-_> <plug>NERDCommenterToggle

let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = $HOME."/.vim/.venv/bin/python3"

" Move splits with Ctrl instead of Ctrl+W
noremap <A-k> :vertical resize +5<CR>
noremap <A-j> :vertical resize -5<CR>

noremap <C-j> :tabprevious<CR>
noremap <C-k> :tabnext<CR>
noremap <C-t> :tabnew<CR>

nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""
" NerdTree "
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

""""""""""""""""""""""""
" transparency + KiTTY "
" https://github.com/kovidgoyal/kitty/issues/108

let &t_ut=''
set background=dark

if (empty($TMUX))
  if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"                      "
""""""""""""""""""""""""


"""""""
" coc "
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-pyright',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ '@yaegassy/coc-ansible',
  \ ]
" Set ansible filetypes for certain files
au BufRead,BufNewFile */ansible/*.yml,*.yaml set ft=yaml.ansible
au BufRead,BufNewFile playbook.yml,*.yaml set ft=yaml.ansible
" Set filetype map
let g:coc_filetype_map = {
  \ 'yaml.ansible': 'ansible',
  \ }
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
"     "
"""""""

" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use Shift+K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

