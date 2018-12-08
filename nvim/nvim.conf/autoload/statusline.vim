function! statusline#Paste()
    return &paste ? '[PASTE]' : ''
endfunction

function! statusline#Spell()
    return &spell ? '[SPELL]' : ''
endfunction

function! statusline#Filetype()
  return &filetype !=# '' ? &filetype : 'no ft'
endfunction

function! statusline#ALEWarnings() abort
  if !exists('g:loaded_ale')
    return 0
  endif

  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:all_non_errors
endfunction

function! statusline#ALEErrors() abort
  if !exists('g:loaded_ale')
    return 0
  endif

  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error

  return l:all_errors
endfunction
