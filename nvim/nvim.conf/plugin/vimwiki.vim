let g:vimwiki_list = [{
      \ 'path': '~/dev/gitlab/knowledge/',
      \ 'syntax': 'markdown',
      \ 'ext': '.wiki',
      \ }]

" Disable links concealing
let g:vimwiki_url_maxsave = 0

" Disable table mappings
let g:vimwiki_table_mappings = 0

" Set folding
let g:vimwiki_folding = 'expr'

" Disable concealing
let g:vimwiki_conceallevel = 0

augroup vimwiki_au
  autocmd!

  autocmd BufRead index.wiki :setlocal conceallevel=2
augroup END
