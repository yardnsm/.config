augroup hardmode_au
  autocmd!

  " https://github.com/wikitopian/hardmode/issues/27
  autocmd VimEnter,BufNewFile,BufReadPost * if !strlen(&buftype) | silent! call HardMode() | endif

  " Disable in NERDTree
  autocmd FileType nerdtree silent! call EasyMode()
augroup END
