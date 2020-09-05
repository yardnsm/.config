" Status line configurations

" Highlights Info: {{{
"
" User1 - Primary
" User2 - Secondary
" User3 - Neutral (bg)
"
" User5 - Blue   (neutral) lint indicator
" User6 - Red    (error)   lint indicator
" User7 - Yellow (warning) lint indicator
" User8 - Green  (success) lint indicator
"
" }}}

const s:MODE_ACTIVE = 'active'
const s:MODE_INACTIVE = 'inactive'

let s:statusline_ft_titles = {
      \ 'nerdtree': 'NERD',
      \ 'qf': '',
      \ }

let s:statusline_visual_percentages = {
      \ '0': '██',
      \ '12.5': '▆▆',
      \ '25': '▅▅',
      \ '37.5': '▄▄',
      \ '50': '▃▃',
      \ '62.5': '▂▂',
      \ '75': '▁▁',
      \ '100': '  ',
      \ }

" Blocks {{{

function! statusline#VisualPercentage()
  let l:line_percentage = line('.') * 100 / line('$')
  let l:last_percentage = 0

  for percentage in sort(keys(s:statusline_visual_percentages), 'N')
    if l:line_percentage <= percentage && l:line_percentage >= l:last_percentage
      return s:statusline_visual_percentages[percentage]
    endif

    let l:last_percentage = percentage
  endfor

  return ' '
endfunction

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

" }}}
" Helper functions {{{

function! statusline#GetMinimalName(ft) abort
  if has_key(s:statusline_ft_titles, a:ft)
    return s:statusline_ft_titles[a:ft]
  endif

  " Custom handler for :CocList
  if a:ft ==# 'list'
    let l:match_list = matchlist(expand('%f'), 'list:\/\/\/\(.\+\)')

    if !empty(l:match_list)
      return 'CocList [' . l:match_list[1] . ']'
    endif
  endif

  return 0
endfunction

" }}}

" This mode is for special buffers. It'll show a blank indicator, and the custom name for that
" buffer. Those buffers are defined in s:statusline_ft_titles.
function! statusline#BuildMinimalStatusLine(mode) abort
  if a:mode ==# s:MODE_ACTIVE
    return '%1* %{statusline#GetMinimalName(&ft)}%q %3*%=%5* ● %3* '
  elseif a:mode ==# s:MODE_INACTIVE
    return ' %{statusline#GetMinimalName(&ft)}%q %= ●  '
  endif
endfunction

function! statusline#BuildStatusLine(mode) abort
  let l:result = ''

  if a:mode ==# s:MODE_ACTIVE
    let l:result .= '%3*%1* %f '                     " filename

    " Buffer number if in diff node
    if &diff
      let l:result .= '[%n] '
    endif

    let l:result .= '%3* %r'                         " readonly
    let l:result .= '%3*%m'                          " modified
    let l:result .= '%3*%{statusline#Paste()}'       " paste
    let l:result .= '%3*%{statusline#Spell()} '      " spell

    let l:result .= '%3*%='                          " going to the right side

    let l:result .= '%3*%{statusline#Filetype()} '   " filetype
    let l:result .= '%3*%3p%% '                      " line percentage
    let l:result .= '%2* %3l:%-2c '                  " line info

    let l:result .= '%9*%{statusline#VisualPercentage()}'                  " line info

    " ALE errors and warning
    let l:errors = statusline#Errors()
    let l:warnings = statusline#Warnings()

    if l:warnings
      if l:errors
        let l:result .= printf('%%6* ‹%d›', l:warnings)
      else
        let l:result .= printf('%%6* ‹%d› ● %%3* ', l:warnings)
      endif
    endif

    if l:errors
      let l:result .= printf('%%7* ‹%d› ● %%3* ', l:errors)
    endif

    if !l:errors && !l:warnings
      let l:result .= '%8* ● %3* '
    endif

  elseif a:mode ==# s:MODE_INACTIVE
    let l:result .= ' %f '                          " filename

    " Buffer number if in diff node
    if &diff
      let l:result .= '[%n] '
    endif

    let l:result .= '%m'                            " modified
    let l:result .= '%='                            " going to the right side

    let l:result .= '[%{statusline#Filetype()}] '   " filetype
    let l:result .= ' ●  '                          " blank indicator, for consistency
  endif

  return l:result
endfunction
