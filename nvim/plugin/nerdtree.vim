" Settings for NERDTree

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1

let g:NERDTreeIgnore = [
  \ '\.DS_Store$',
  \ '__pycache__[[dir]]',
  \ '\.pyc$',
  \ ]

nnoremap <leader>/ :NERDTreeToggle<CR>
nnoremap <leader>0 :NERDTreeFocus<CR>
