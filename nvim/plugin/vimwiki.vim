" Settings for vimwiki

let $VIMWIKI_HOME = $KNOWLEDGE

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
let g:vimwiki_folding = 'custom'

" Use vimwiki syntax only in files within the wiki
let g:vimwiki_global_ext = 0

" I use <C-Space> for MacOS' Spotlight, so...
nmap <A-Space> <C-Space>

" Update default folding: disable the weird folding fro code blocks.
function! VimwikiFoldLevelNew(lnum)
  if getline(a:lnum) =~# vimwiki#vars#get_syntaxlocal('rxPreStart')
    return '='
  endif

  return VimwikiFoldLevel(a:lnum)
endfunction

augroup vimwiki_au
  autocmd!

  " Set folding
  autocmd FileType vimwiki setlocal foldmethod=expr
  autocmd FileType vimwiki setlocal foldexpr=VimwikiFoldLevelNew(v:lnum)
  autocmd FileType vimwiki setlocal foldtext=VimwikiFoldText()
augroup END
