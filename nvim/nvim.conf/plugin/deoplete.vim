" Enable at start
let g:deoplete#enable_at_startup = 1

" Set tab completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Close preview window after completion
autocmd CompleteDone * silent! pclose!
" set completeopt-=preview
