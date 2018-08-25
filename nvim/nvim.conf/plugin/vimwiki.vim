let $VIMWIKI_HOME = $HOME . '/dev/gitlab/knowledge'

let g:vimwiki_list = [{
      \ 'path': $VIMWIKI_HOME,
      \ 'syntax': 'markdown',
      \ 'ext': '.md',
      \ 'index': 'README',
      \ 'nested_syntaxes': {'python': 'python', 'javascript': 'javascript', 'bash': 'sh'},
      \ }]

" Disable links concealing
let g:vimwiki_url_maxsave = 0

" Disable table mappings
let g:vimwiki_table_mappings = 0

" Set folding
let g:vimwiki_folding = 'expr'

" Use vimwiki syntax only in files within the wiki
let g:vimwiki_global_ext = 0

" I use <C-Space> for MacOS' Spotlight, so...
nmap <A-Space> <C-Space>
