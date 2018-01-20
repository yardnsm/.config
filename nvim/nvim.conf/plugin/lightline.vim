let g:lightline = {
  \ 'colorscheme': 'Dracula',
  \
  \ 'inactive': {
  \   'left': [
  \     [ 'mode', 'filename' ],
  \   ],
  \ },
  \
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'readonly', 'filename', 'modified' ],
  \   ],
  \   'right': [
  \     [ 'ale_errors', 'ale_warnings' ],
  \     [ 'lineinfo' ],
  \     [ 'fileformat', 'filetype', 'percent' ],
  \   ],
  \ },
  \
  \ 'component_function': {
  \   'mode': 'LightlineMode',
  \   'filename': 'LightlineFilename',
  \   'modified': 'LightlineModified',
  \   'lineinfo': 'LightlineLineinfo',
  \   'percent': 'LightlinePercent',
  \   'fileformat': 'LightlineFileformat',
  \   'filetype': 'LightlineFiletype',
  \ },
  \
  \ 'component_expand': {
  \   'ale_warnings': 'LightlineALEWarnings',
  \   'ale_errors': 'LightlineALEErrors',
  \ },
  \
  \ 'component_type': {
  \   'readonly': 'error',
  \   'ale_warnings': 'warning',
  \   'ale_errors': 'error',
  \ },
  \ }

" ------------------------------------------------------------------------------
" Custom components for lightline
" They're mainly used for hiding the components in specific file
" types (such as NERDTree and Quickfix)

function! IsLightlineSupportedFiletype()
  let l:unsupported_filetypes = [ 'qf', 'nerdtree' ]
  return index(l:unsupported_filetypes, &filetype) == -1
endfunction

" Change the mode component text based of filetype
function! LightlineMode()
  let l:filetypes_modes = {
  \  'qf': 'Quickfix',
  \  'nerdtree': 'NERD',
  \ }

  return get(l:filetypes_modes, &filetype, lightline#mode())
endfunction

function! LightlineFilename()
  if IsLightlineSupportedFiletype()
    return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  endif

  return ''
endfunction

function! LightlineModified()
  if IsLightlineSupportedFiletype()
    return &modified ? '[+]' : ''
  endif

  return ''
endfunction

function! LightlineLineinfo()
  if IsLightlineSupportedFiletype()
    return printf('%3d:%-2d', line('.'), col('.'))
  endif

  return ''
endfunction

function! LightlinePercent()
  if IsLightlineSupportedFiletype()
    return printf('%3.0f%%',  line('.') * 100 / line('$'))
  endif

  return ''
endfunction

function! LightlineFileformat()
  if IsLightlineSupportedFiletype()
    return &fileformat
  endif

  return ''
endfunction

function! LightlineFiletype()
  if IsLightlineSupportedFiletype()
    return &filetype !=# '' ? &filetype : 'no ft'
  endif

  return ''
endfunction

" ------------------------------------------------------------------------------
" ALE component for lightline

function! LightlineALEWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf('W:%d', all_non_errors)
endfunction

function! LightlineALEErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_errors == 0 ? '' : printf('E:%d', all_errors)
endfunction

" ------------------------------------------------------------------------------

autocmd User ALELint call s:UpdateLightline()

function! s:UpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction
