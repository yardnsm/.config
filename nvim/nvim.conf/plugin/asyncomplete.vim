" Configuration
" ------------------------------------------------------------------------------

let g:asyncomplete_remove_duplicates = 1

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

imap <C-g> <Plug>(asyncomplete_force_refresh)

" Completion sources
" ------------------------------------------------------------------------------

augroup AsyncompleteSources
  autocmd!

  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necosyntax#get_source_options({
        \ 'name': 'necosyntax',
        \ 'whitelist': ['html', 'css'],
        \ 'completor': function('asyncomplete#sources#necosyntax#completor'),
        \ 'priority': 6,
        \ }))

  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
        \ 'name': 'TS',
        \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx'],
        \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
        \ 'priority': 6,
        \ }))

  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
        \ 'name': 'neco',
        \ 'whitelist': ['vim'],
        \ 'completor': function('asyncomplete#sources#necovim#completor'),
        \ 'priority': 5,
        \ }))

  " File paths
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
        \ 'name': 'file',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#file#completor'),
        \ 'priority': 4,
        \ }))

  " Buffer
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
        \ 'name': 'buffer',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#buffer#completor'),
        \ 'priority': 2,
        \ }))

  " Emoji!
  au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
        \ 'name': 'emoji',
        \ 'whitelist': ['', 'markdown'],
        \ 'completor': function('asyncomplete#sources#emoji#completor'),
        \ 'priority': 1,
        \ }))
augroup END

" Setting up tmux-complete
let g:tmuxcomplete#asyncomplete_source_options = {
      \ 'name': 'tmux',
      \ 'whitelist': ['*'],
      \ 'blacklist': ['css', 'less', 'sass'],
      \ 'priority': 0,
      \ 'config': {
      \     'splitmode': 'words',
      \     'filter_prefix': 1,
      \     'show_incomplete': 0,
      \     'sort_candidates': 0,
      \     'scrollback': 100,
      \     'truncate': 30
      \     }
      \ }
