" Settings for vim-closer

augroup closer_au
  autocmd!

  autocmd FileType typescript.jsx
    \ let b:closer = 1 |
    \ let b:closer_flags = '([{;' |
    \ let b:closer_no_semi = '^\s*\(function\|class\|if\|else\)' |
    \ let b:closer_semi_ctx = ')\s*{$'
augroup END
