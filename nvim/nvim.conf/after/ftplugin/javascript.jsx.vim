augroup javascript
  autocmd!

  autocmd Filetype javascript nnoremap <buffer> <localleader>r :!node %<CR>
augroup END

setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
