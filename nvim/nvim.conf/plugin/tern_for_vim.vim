augroup tern_for_vim_au
  autocmd!

  autocmd Filetype javascript nnoremap <leader>gd :TernDef<CR>
  autocmd Filetype javascript nnoremap <leader>gr :TernRef<CR>
augroup END
