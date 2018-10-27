" 'vim-unimpaired' overrides

" Use `t` for tabs, as I'm not using tags (...yet)
nnoremap ]t :tabn<CR>
nnoremap [t :tabp<CR>

" Disbale the `pasting` mappings
silent! unmap =p
silent! unmap =P

" Disable the legacy options mappings
silent! unmap =o
silent! unmap =op
