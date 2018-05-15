" Set tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Insert a newline after pressing enter
inoremap <silent> <CR> <C-r>=<SID>hide_comp_and_newline()<CR>
function! s:hide_comp_and_newline() abort
  return (pumvisible() ? "\<C-y>\<CR>" : "\<CR>")
endfunction

" Trigger autocompletion
let g:cm_auto_popup = 1
imap <C-g> <Plug>(cm_force_refresh)

" Sub-string matching
" https://github.com/roxma/nvim-completion-manager/issues/12#issuecomment-325618268
let g:cm_matcher = {'module': 'cm_matchers.substr_matcher', 'case': 'smartcase'}

" Disable preview window
set completeopt-=preview
