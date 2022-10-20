" TODO: fix comments

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

"""""""""""""""""
" Splits & tabs "
" Resize splits with Alt+J/K
noremap <A-k> :vertical resize +5<CR>
noremap <A-j> :vertical resize -5<CR>

" Tabs like in chrome with vimium
noremap <C-j> :tabprevious<CR>
noremap <C-k> :tabnext<CR>
noremap <C-t> :tabnew<CR>

" Move splits with Ctrl instead of Ctrl+W
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Splits & tabs "
"""""""""""""""""

" RENAMER F2 or \rn
nmap <leader>rn <Plug>(coc-rename)
nmap <F2> <Plug>(coc-rename)

" FZF
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nmap <C-P> :Files<CR>

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

