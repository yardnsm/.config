" Toggle mouse support
function! bootstrap#Directory(path)
  if !isdirectory(a:path)
    call mkdir(a:path, "p")
  endif
endfunc
