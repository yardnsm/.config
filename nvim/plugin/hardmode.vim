" Settings for hardmode

augroup hardmode_au
  autocmd!

  " https://github.com/wikitopian/hardmode/issues/27
  autocmd VimEnter,BufNewFile,BufReadPost * if !strlen(&buftype) | silent! call HardMode() | endif

  " Enable j and k
  autocmd VimEnter,BufNewFile,BufReadPost * silent! unmap <buffer> j
  autocmd VimEnter,BufNewFile,BufReadPost * silent! unmap <buffer> k

  " Disable in NERDTree
  autocmd FileType nerdtree silent! call EasyMode()
augroup END
