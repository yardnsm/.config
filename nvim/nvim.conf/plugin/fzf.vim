" Settings for fzf.nvim

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

let g:fzf_layout = {
      \ 'window': { 'width': 0.9, 'height': 0.6 }
      \ }


" Status line {{{

function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=0 cterm=bold
  highlight fzf1 guifg=161 guibg=0
  setlocal statusline=%#fzf1#~~>\ fzf\ ԅ(≖‿≖ԅ)
endfunction

augroup fzf_statusline_au
  autocmd! User FzfStatusLine call <SID>fzf_statusline()
augroup END

" }}}
" Mappings {{{

nnoremap <leader>a :Ag<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>m :Marks<CR>

" If inside a git repo, use :GFiles
if isdirectory(".git")
  nmap <C-p> :GFiles --cached --others --exclude-standard<CR>
else
  " otherwise, use :FZF
  nmap <C-p> :Files<CR>
endif

" }}}
