" Settings for vim-import-cost

augroup import_cost_mappings
  autocmd!

  autocmd FileType javascript.jsx nnoremap <buffer> <leader>i :ImportCost<CR>
  autocmd FileType typescript.jsx nnoremap <buffer> <leader>i :ImportCost<CR>
augroup END
