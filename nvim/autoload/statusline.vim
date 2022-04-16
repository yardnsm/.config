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

const s:diagnostic_highlights = {
      \ 'info': 5,
      \ 'warning': 6,
      \ 'error': 7,
      \ 'success': 8,
      \ }

const s:MODE_ACTIVE = 'active'
const s:MODE_INACTIVE = 'inactive'

let s:statusline_ft_titles = {
      \ 'netrw': 'Netrw',
      \ 'nerdtree': 'NERD',
      \ 'qf': '',
      \ }

let s:statusline_visual_percentages = ["__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"]

" Blocks {{{

" Visual Percentage {{{

function! statusline#VisualPercentage()
  let l:current_line = line('.')
  let l:total_lines = line('$')

  let l:index = float2nr(
        \ ceil((current_line * 1.0) / total_lines * (len(s:statusline_visual_percentages) - 1)))

  return s:statusline_visual_percentages[index]
endfunction

" }}}
" Paste mode {{{

function! statusline#Paste()
    return &paste ? '[PASTE]' : ''
endfunction

" }}}
" Spell mode {{{

function! statusline#Spell()
    return &spell ? '[SPELL]' : ''
endfunction

" }}}
" Filetype {{{

function! statusline#Filetype(color)
  let l:icon_result = luaeval(
        \ "pcall(require, 'nvim-web-devicons') and { require('nvim-web-devicons').get_icon(vim.fn.expand('%:t'), vim.fn.expand('%:e')) }"
        \ )

  let l:icon = len(l:icon_result) ==# 2 ? l:icon_result[0] : v:null
  let l:hl_group = len(l:icon_result) ==# 2 ? l:icon_result[1] : 'User3'

  if a:color
    return &filetype !=# '' ?
          \ ' %#' . l:hl_group . '# ' . (l:icon !=# v:null ? ' ' . l:icon . '  ' . &filetype . '  ' : &filetype) . '%3*':
          \ 'no ft'
  endif

  return &filetype !=# '' ?
        \ (l:icon !=# v:null ? ' ' . l:icon . '  ' . &filetype . ' ' : &filetype) :
        \ 'no ft'
endfunction

" }}}
" Diagnosticss {{{

function! statusline#Infos() abort
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })')
endfunction

function! statusline#Warnings() abort
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })')
endfunction

function! statusline#Errors() abort
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })')
endfunction

function! statusline#Diagnostics() abort
  let l:infos = statusline#Infos()
  let l:warnings = statusline#Warnings()
  let l:errors = statusline#Errors()

  let l:highlight = s:diagnostic_highlights['success']

  let l:summary = ''

  if l:infos
    let l:highlight = s:diagnostic_highlights['info']
    let l:summary .= printf('%%%s* ‹%d›',
          \ l:highlight,
          \ l:infos)
  endif

  if l:warnings
    let l:highlight = s:diagnostic_highlights['warning']
    let l:summary .= printf('%%%s* ‹%d›',
          \ l:highlight,
          \ l:warnings)
  endif

  if l:errors
    let l:highlight = s:diagnostic_highlights['error']
    let l:summary .= printf('%%%s* ‹%d›',
          \ l:highlight,
          \ l:errors)
  endif

  let l:summary .= printf('%%%s* ● %%3* ', l:highlight)

  return {
        \ 'highlight': l:highlight,
        \ 'summary': l:summary
        \ }
endfunction

" }}}
" LSP Status {{{

function! statusline#LSPStatus() abort
  let l:client_attahced = luaeval('require("user.lsp.statusline").is_client_attahced()')
  let l:server_names = luaeval('require("user.lsp.statusline").get_servers_names()')

  if l:client_attahced
    return '⋅   ' . l:server_names . ' ⋅ '
  endif

  return ''
endfunction

" }}}
" VCS Branch {{{

function! statusline#Branch() abort
  let l:branch = exists('*FugitiveHead') ? FugitiveHead() : ''

  if l:branch != ''
    return '  ' . l:branch
  endif

  return ''
endfunction

" }}}
" VCS Stats {{{

function! statusline#VCSStats() abort
  let [added, modified, removed] = sy#repo#get_stats()

  let hl_groups = ['SignifySignAdd', 'SignifySignDelete', 'SignifySignChange']
  let symbols = ['+', '-', '~']
  let stats = [added, removed, modified]

  let result = ''

  for i in range(len(stats))
    if stats[i] > 0
      let result .= '%' . printf('#%s#%s%s ', hl_groups[i], symbols[i], stats[i])
    endif
  endfor

  if !empty(result)
    let result = result[:-2]
  endif

  return result
endfunction

" }}}

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
  let focused = g:statusline_winid == win_getid(winnr()) && a:mode !=# s:MODE_INACTIVE

  if focused
    let l:diagnostics = statusline#Diagnostics()

    let l:result .= '%3*%1* %f '                               " filename
    let l:result .= '%3*%{statusline#Branch()}'                " VCS Branch

    " Buffer number if in diff node
    if &diff
      let l:result .= ' [%n]'
    endif

    let l:result .= '%3* %r'                                   " readonly
    let l:result .= '%3*%m'                                    " modified
    let l:result .= '%3*%{statusline#Paste()}'                 " paste
    let l:result .= '%3*%{statusline#Spell()} '                " spell
    let l:result .= '%3*%{%statusline#VCSStats()%}%3*'         " VCS Stats

    let l:result .= '%3*%='                                    " going to the right side

    let l:result .= '%3*%{%statusline#Filetype(v:true)%} '     " filetype
    let l:result .= '%#DiffAdd#%{statusline#LSPStatus()}'      " LSP status
    let l:result .= '%3*%3p%% '                                " line percentage
    let l:result .= '%2* %3l:%-2c '                            " line info

    " Visual percentages
    let l:result .= '%#DevIconSh#%{statusline#VisualPercentage()}%2* '

    " Diagnostics indications
    let l:result .= l:diagnostics['summary']

  else
    let l:result .= ' %f '                                     " filename

    " Buffer number if in diff node
    if &diff
      let l:result .= '[%n] '
    endif

    let l:result .= '%m'                                       " modified
    let l:result .= '%='                                       " going to the right side

    let l:result .= '[%{statusline#Filetype(v:false)}] '       " filetype
    let l:result .= ' ●  '                                     " blank indicator, for consistency
  endif

  return l:result
endfunction
