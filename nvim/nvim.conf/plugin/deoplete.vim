" Enable at start
let g:deoplete#enable_at_startup = 1

" Set tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Insert a newline after pressing enter
inoremap <silent> <CR> <C-r>=<SID>hide_comp_and_newline()<CR>
function! s:hide_comp_and_newline() abort
  return (pumvisible() ? "\<C-y>\<CR>" : "\<CR>")
endfunction

" Disable preview window
set completeopt-=preview

" Autocomplete delay
call deoplete#custom#option('auto_complete_delay', 10)
