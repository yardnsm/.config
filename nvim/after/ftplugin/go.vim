" Specific configurations for `go` filetype

" Indent settings

setlocal noexpandtab
setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" Since we're using tabs, show only leading spaces
" TODO exatrct to autocommand as per expandtab
setlocal listchars+=tab:\ \ ,lead:·
