augroup hardmode_au
  autocmd!

  autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
augroup END
