" Toggle mouse support
function! functions#ToggleMouse()
  if &mouse == 'a'
    set mouse=
  else
    set mouse=a
  endif
endfunc

" Taken from:
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
function! functions#StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    %s/\s\+$//e
    normal `^
  endif
endfunction

" Search in all currently opened buffers
" Taken from http://vim.wikia.com/wiki/Search_on_all_opened_buffers
function! functions#Vimgrepall(pattern)
  call setqflist([])
  exe 'bufdo vimgrepadd ' . a:pattern . ' %'
  cnext
endfunction
