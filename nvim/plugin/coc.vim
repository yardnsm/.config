" Settings for coc.nvim

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

" Trigger completion
imap <silent><expr> <C-g> coc#refresh()

" Gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <leader>l :CocList actions<CR>
vmap <silent> <leader>l <Plug>(coc-codeaction-selected)

nmap <silent> <leader>c  :<C-u>CocList commands<CR>

" Expand snippets
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Navigate diagnostics
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" }}}
" Commands {{{

" Format the file using LSPs, fallback to eslint
command! -nargs=0 Format :call CocAction('format')
      \ || CocCommand eslint.executeAutofix

" Reset floating windows
command! -nargs=0 ResetFloating :execute "norm \<Plug>(coc-float-hide)"

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
" CocList fixes {{{

" I don't like the default behaviour of CocList, so...
let s:coc_list_cources = [
      \ 'location',
      \ 'extensions',
      \ 'diagnostics',
      \ 'outline',
      \ 'symbols',
      \ 'services',
      \ 'commands',
      \ 'links',
      \ 'output',
      \ 'sources',
      \ 'lists',
      \ 'actions'
      \ ]

for list_source in s:coc_list_cources
  call coc#config('list.source.' . list_source . '.defaultOptions', [
        \ "--regex",
        \ "--ignore-case",
        \ "--no-sort",
        \ "--input"
        \ ])
endfor

" }}}
