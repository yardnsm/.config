let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1

let g:NERDTreeIgnore = ['\.DS_Store$']

nnoremap <leader>/ :NERDTreeToggle<CR>
nnoremap <leader>0 :NERDTreeFocus<CR>

" Open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
