" Set tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Insert a newline after pressing enter
inoremap <silent> <CR> <C-r>=<SID>hide_comp_and_newline()<CR>
function! s:hide_comp_and_newline() abort
  return (pumvisible() ? "\<C-y>\<CR>" : "\<CR>")
endfunction

" ------------------------------------------------------------------------------
" Enable deoplete sources
" https://github.com/roxma/nvim-completion-manager/issues/50#issuecomment-285652366

call deoplete#enable()

au User CmSetup call cm#register_source({
  \ 'name' : 'deoplete',
  \ 'priority': 7,
  \ 'abbreviation': '',
  \ })

inoremap <silent> <Plug>_ <C-r>=g:Deoplete_ncm()<CR>

func! g:Deoplete_ncm()
  call cm#complete('deoplete', cm#context(), g:deoplete#_context.complete_position + 1, g:deoplete#_context.candidates)
  return ''
endfunc
