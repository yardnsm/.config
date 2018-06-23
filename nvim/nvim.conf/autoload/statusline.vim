function! statusline#Paste()
    return &paste ? '[PASTE]' : ''
endfunction

function! statusline#Filetype()
  return &filetype !=# '' ? &filetype : 'no ft'
endfunction

function! statusline#ALEWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf(' W:%d ', all_non_errors)
endfunction

function! statusline#ALEErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_errors == 0 ? '' : printf(' E:%d ', all_errors)
endfunction
