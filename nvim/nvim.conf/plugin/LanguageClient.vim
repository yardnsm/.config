let g:LanguageClient_autoStart = 1
let g:LanguageClient_loggingLevel='DEBUG'
let g:LanguageClient_serverCommands = {}

" Disable diagnostics
let g:LanguageClient_diagnosticsEnable = 0

" Change the highlights of diagnostics messages
" LanguageClient-neovim clears the specified highlights if the diagnostics are
" disabled, causing ALE highlights to also be cleared (since it uses ALE
" highlights). Doing this prevents it from clearing ALE highlights.
let g:LanguageClient_diagnosticsDisplay = {
      \    1: {
      \         "name": "Error",
      \         "texthl": "LChl",
      \         "signText": "✖",
      \         "signTexthl": "LChl",
      \     },
      \     2: {
      \         "name": "Warning",
      \         "texthl": "LChl",
      \         "signText": "⚠",
      \         "signTexthl": "LChl",
      \     },
      \     3: {
      \         "name": "Information",
      \         "texthl": "LChl",
      \         "signText": "ℹ",
      \         "signTexthl": "LChl",
      \     },
      \     4: {
      \         "name": "Hint",
      \         "texthl": "LChl",
      \         "signText": "➤",
      \         "signTexthl": "LChl",
      \     },
      \ }

" Mappings
nnoremap <silent> <leader>lc :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" JavaScript
" ------------------------------------------------------------------------------

let g:LanguageClient_serverCommands['javascript'] = ['typescript-language-server', '--stdio']
let g:LanguageClient_serverCommands['javascript.jsx'] = ['typescript-language-server', '--stdio']

" TypeScript
" ------------------------------------------------------------------------------

let g:LanguageClient_serverCommands['typescript'] = ['typescript-language-server', '--stdio']

" HTML
" ------------------------------------------------------------------------------

let g:LanguageClient_serverCommands['html'] = ['html-languageserver', '--stdio']

" Python
" ------------------------------------------------------------------------------

let g:LanguageClient_serverCommands['python'] = ['pyls']

" CSS, LESS, SCSS
" ------------------------------------------------------------------------------

let g:LanguageClient_serverCommands['css'] = ['css-languageserver', '--stdio']
let g:LanguageClient_serverCommands['less'] = ['css-languageserver', '--stdio']
let g:LanguageClient_serverCommands['scss'] = ['css-languageserver', '--stdio']

" Bash
" ------------------------------------------------------------------------------

let g:LanguageClient_serverCommands['sh'] = ['bash-language-server', 'start']
