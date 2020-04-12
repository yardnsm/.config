" Settings for NERDTree

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1

let g:NERDTreeIgnore = [
  \ '\.DS_Store$',
  \ '__pycache__[[dir]]',
  \ '\.pyc$',
  \ ]

let g:NERDTreeBookmarksFile = $XDG_DATA_HOME . '/.NERDTreeBookmarks'

nnoremap <leader>/ :NERDTreeToggle<CR>
nnoremap <leader>0 :NERDTreeFocus<CR>
