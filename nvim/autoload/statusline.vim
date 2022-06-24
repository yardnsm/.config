" Status line configurations
" Refer to init.vim for highlights info

const s:diagnostic_highlights = {
      \ 'info': 'StatusLineIndicatorNeutral',
      \ 'warning': 'StatusLineIndicatorWarning',
      \ 'error': 'StatusLineIndicatorError',
      \ 'success': 'StatusLineIndicatorSuccess',
      \ }

const s:MODE_ACTIVE = 'active'
const s:MODE_INACTIVE = 'inactive'

let s:statusline_ft_titles = {
      \ 'netrw': 'Netrw',
      \ 'nerdtree': 'NERD',
      \ 'TelescopePrompt': 'Telescope',
      \ 'qf': '',
      \ }

let s:winbar_filetype_exclude = [
      \ "help",
      \ "netrw",
      \ "nerdtree",
      \ "TelescopePrompt"
      \ ]

let s:statusline_visual_percentages = ["__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██"]

" Helper functions {{{

function! s:GetDevIconForCurrentBuffer() abort
  let l:icon_result = luaeval(
        \ "pcall(require, 'nvim-web-devicons') and { require('nvim-web-devicons').get_icon(vim.fn.expand('%:t'), vim.fn.expand('%:e')) } or {}"
        \ )

  let l:icon_color_result = luaeval(
        \ "pcall(require, 'nvim-web-devicons') and { require('nvim-web-devicons').get_icon_color(vim.fn.expand('%:t'), vim.fn.expand('%:e')) } or {}"
        \ )

  if len(l:icon_result) !=# 2
    return v:null
  endif

  return {
    \ 'icon': l:icon_result[0],
    \ 'hl_group': l:icon_result[1],
    \ 'color': l:icon_color_result[1],
    \ }
endfunction

function! statusline#ShouldSetWinbar(ft) abort
  return index(s:winbar_filetype_exclude, a:ft) ==# -1
        \ && (&buftype !=# 'nofile' && &buflisted !=# 0) " No for scratch buffers
endfunction

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
  let l:icon_result = s:GetDevIconForCurrentBuffer()
  let l:has_result = type(l:icon_result) ==# v:t_dict

  let l:icon = l:has_result ? l:icon_result['icon'] : v:null
  let l:hl_group = l:has_result ? l:icon_result['hl_group'] : 'StatusLineNeutral'

  if a:color
    return &filetype !=# '' ?
          \ ' %#' . l:hl_group . '# ' . (l:icon !=# v:null ? ' ' . l:icon . '  ' . &filetype . '  ' : &filetype) . '%#StatusLineNeutral#':
          \ 'no ft'
  endif

  return &filetype !=# '' ?
        \ (l:icon !=# v:null ? ' ' . l:icon . '  ' . &filetype . ' ' : &filetype) :
        \ 'no ft'
endfunction

function! statusline#FileIcon() abort
  let l:devicon = s:GetDevIconForCurrentBuffer()
  let l:icon = ''

  if type(l:devicon) ==# v:t_dict
    let l:icon = '%#' . l:devicon['hl_group'] . "# " . l:devicon['icon']
  endif

  return l:icon
endfunction

" }}}
" Diagnosticss {{{

function! statusline#Hints() abort
  return luaeval('#vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })')
endfunction

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
  let l:hints = statusline#Hints()
  let l:infos = statusline#Infos()
  let l:warnings = statusline#Warnings()
  let l:errors = statusline#Errors()

  let l:highlight = s:diagnostic_highlights['success']

  let l:summary = ''

  if l:hints
    let l:highlight = s:diagnostic_highlights['info']
    let l:summary .= printf('%%#%s# ‹!:%d›',
          \ l:highlight,
          \ l:hints)
  endif

  if l:infos
    let l:highlight = s:diagnostic_highlights['info']
    let l:summary .= printf('%%#%s# ‹I:%d›',
          \ l:highlight,
          \ l:infos)
  endif

  if l:warnings
    let l:highlight = s:diagnostic_highlights['warning']
    let l:summary .= printf('%%#%s# ‹W:%d›',
          \ l:highlight,
          \ l:warnings)
  endif

  if l:errors
    let l:highlight = s:diagnostic_highlights['error']
    let l:summary .= printf('%%#%s# ‹E:%d›',
          \ l:highlight,
          \ l:errors)
  endif

  let l:summary .= printf('%%#%s# ● %%#StatusLineNeutral# ', l:highlight)

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
  if !exists('*sy#start')
    return ''
  endif

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

function! statusline#BuildWinbar(mode) abort
  let l:fg_hl = a:mode ==# s:MODE_ACTIVE ? 'WinbarFgActive' : 'WinbarFgInactive'
  let l:bg_hl = a:mode ==# s:MODE_ACTIVE ? 'WinbarBgActive' : 'WinbarBgInactive'

  return
    \ '%#' . l:fg_hl . '#     ' .
    \ '%{%statusline#FileIcon()%} ' .
    \ '%#' . l:fg_hl . '#%f %m     ' .
    \ '%#' . l:bg_hl . '#'
endfunction

" This mode is for special buffers. It'll show a blank indicator, and the custom name for that
" buffer. Those buffers are defined in s:statusline_ft_titles.
function! statusline#BuildMinimalStatusLine(mode) abort
  if a:mode ==# s:MODE_ACTIVE
    return
      \ '%#StatusLinePrimary# %{statusline#GetMinimalName(&ft)}%q ' .
      \ '%#StatusLineNeutral#%=%#StatusLineIndicatorNeutral# ● %#StatusLineNeutral# '

  elseif a:mode ==# s:MODE_INACTIVE
    return ' %{statusline#GetMinimalName(&ft)}%q %= ●  '
  endif
endfunction

function! statusline#BuildStatusLine(mode) abort
  let l:result = ''
  let l:focused = g:statusline_winid == win_getid(winnr()) && a:mode !=# s:MODE_INACTIVE

  if l:focused
    let l:diagnostics = statusline#Diagnostics()

    let l:result .= '%#StatusLinePrimary# %f '                               " filename
    let l:result .= '%#StatusLineNeutral#%{statusline#Branch()}'             " VCS Branch

    " Buffer number if in diff node
    if &diff
      let l:result .= ' [%n]'
    endif

    let l:result .= '%#StatusLineNeutral# %r'                                " readonly
    let l:result .= '%#StatusLineNeutral#%m'                                 " modified
    let l:result .= '%#StatusLineNeutral#%{statusline#Paste()}'              " paste
    let l:result .= '%#StatusLineNeutral#%{statusline#Spell()} '             " spell
    let l:result .= '%#StatusLineNeutral#%{%statusline#VCSStats()%}'         " VCS Stats
    let l:result .= '%#StatusLineNeutral#'

    let l:result .= '%#StatusLineNeutral#%='

    let l:result .= '%#StatusLineNeutral#%{%statusline#Filetype(v:true)%} '  " filetype
    let l:result .= '%#DiffAdd#%{statusline#LSPStatus()}'                    " LSP status
    let l:result .= '%#StatusLineNeutral#%3p%% '                             " line percentage
    let l:result .= '%#StatusLineSecondary# %3l:%-2c '                       " line info

    " Visual percentages
    let l:result .= '%#DevIconSh#%{statusline#VisualPercentage()}%#StatusLineSecondary# '

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

    let l:result .= '%{statusline#Filetype(v:false)} '         " filetype
    let l:result .= ' ●  '                                     " blank indicator, for consistency
  endif

  return l:result
endfunction
