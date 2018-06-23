let g:LanguageClient_autoStart = 1
let g:LanguageClient_loggingLevel='DEBUG'
let g:LanguageClient_serverCommands = {}

" Disable diagnostics
let g:LanguageClient_diagnosticsEnable = 0

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
