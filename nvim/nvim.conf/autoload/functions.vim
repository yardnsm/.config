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
