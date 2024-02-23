" Meta and UI
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
Plug 'mechatroner/rainbow_csv'
Plug 'editorconfig/editorconfig-vim' " editorconfig support
Plug 'dhvcc/nord-mint-vim' " Theme
Plug 'vim-scripts/ShowTrailingWhitespace' " Trailing whitespace highlight
Plug 'vim-airline/vim-airline' " Statusline
" Character jumping
Plug 'easymotion/vim-easymotion'
" Language support
Plug 'neoclide/coc.nvim', {'tag': 'v0.0.82'} " Language server support
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

if !empty(glob("~/.wakatime.cfg"))
  Plug 'wakatime/vim-wakatime' " Time tracking
endif
