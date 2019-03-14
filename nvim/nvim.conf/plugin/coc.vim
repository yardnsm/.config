" Settings for coc.nvim

if !exists('g:coc_enanled')
  finish
endif

" Enable completion using <Tab> {{{

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent> <expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }}}
" Mappings {{{

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>f <Plug>(coc-fix-current)
nmap <silent> <leader>l <Plug>(coc-codeaction)
vmap <silent> <leader>l <Plug>(coc-codeaction-selected)

" }}}
" Insert a newline after pressing enter {{{

inoremap <silent> <CR> <C-r>=<SID>hide_comp_and_newline()<CR>
function! s:hide_comp_and_newline() abort
  return (pumvisible() ? "\<C-y>\<CR>" : "\<CR>")
endfunction

" }}}
" Use K for documentation in preview window {{{

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" }}}
" Highlights {{{

highlight link CocWarningSign Todo
highlight CocWarningHighlight ctermbg=11 cterm=undercurl

highlight link CocErrorSign Error
highlight CocErrorHighlight ctermbg=11 cterm=undercurl

highlight link CocHintSign Todo
highlight CocErrorHighlight ctermbg=11 cterm=undercurl

highlight link CocInfoSign Question
highlight CocInfoHighlight ctermbg=11 cterm=undercurl

" }}}
" Autocommands {{{

augroup coc_au
  " autocmd InsertEnter * setlocal cmdheight=2
  " autocmd InsertLeave * setlocal cmdheight=1
augroup END

" }}}
