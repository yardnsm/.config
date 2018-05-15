augroup tern_for_vim_au
  autocmd!

  autocmd Filetype javascript,javascript.jsx nnoremap <leader>gd :TernDef<CR>
  autocmd Filetype javascript,javascript,jsx nnoremap <leader>gr :TernRef<CR>
augroup END
