function! statusline#Paste()
    return &paste ? '[PASTE]' : ''
endfunction

function! statusline#Spell()
    return &spell ? '[SPELL]' : ''
endfunction

function! statusline#Filetype()
  return &filetype !=# '' ? &filetype : 'no ft'
endfunction

function! statusline#Warnings() abort

  " Check coc first
  let l:coc_info = get(b:, 'coc_diagnostic_info', {})
  if !empty(l:coc_info)
    return l:coc_info['warning']
  endif

  if !exists('g:loaded_ale')
    return 0
  endif

  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:all_non_errors
endfunction

function! statusline#Errors() abort

  " Check coc first
  let l:coc_info = get(b:, 'coc_diagnostic_info', {})
  if !empty(l:coc_info)
    return l:coc_info['error']
  endif

  if !exists('g:loaded_ale')
    return 0
  endif

  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error

  return l:all_errors
endfunction
