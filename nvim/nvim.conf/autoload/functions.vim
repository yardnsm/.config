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

" Go to next closed fold (see `]z` and `[z` mappings)
function! functions#NextClosedFold(dir)
  let cmd = 'norm!z' . a:dir
  let view = winsaveview()
  let [l0, l, open] = [0, view.lnum, 1]
  while l != l0 && open
    exe cmd
    let [l0, l] = [l, line('.')]
    let open = foldclosed(l) < 0
  endwhile
  if open
    call winrestview(view)
  endif
endfunction
