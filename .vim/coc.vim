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

"""""""""""""
" Languages "
" Python
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = $HOME."/.vim/.venv/bin/python3"
"           "
"""""""""""""

"""""""""""""
" Filetypes "
" Set ansible filetypes for certain files
au BufRead,BufNewFile */ansible/*.yml,playbook*.yml,*/ansible/*.yaml,playbook*.yaml set ft=yaml.ansible
let g:coc_filetype_map = {
\ 'yaml.ansible': 'ansible',
\ }
"           "
"""""""""""""

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

" Use tab for completion (needed for CoC>=0.0.82)
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
