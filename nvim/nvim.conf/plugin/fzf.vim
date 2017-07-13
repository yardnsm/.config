let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

" fzf status line
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=0
  highlight fzf1 guifg=161 guibg=0
  setlocal statusline=%#fzf1#~~>\ fzf
  setlocal statusline+=\ %{emoji#for('see_no_evil')}
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

nnoremap <C-p> :Files<CR>
nnoremap <leader>lb :Buffers<CR>
nnoremap <leader>lt :Filetypes<CR>
nnoremap <leader>lm :Marks<CR>
