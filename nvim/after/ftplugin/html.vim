" Specific configurations for `html` filetype

" Mappings {{{

" Auto close html tags + indent:
"   </         - Write `</`
"   <C-X><C-O> - Start omni completion and select the first option
"   <ESC>      - Back to normal mode
"   ==         - Indent the current line
"   `^         - Go the position where the cursor was the last timewhen Insert mode was stopped
"   a          - Append text after the cursor
imap <buffer> </ </<C-X><C-O><ESC>==`^a

" }}}
