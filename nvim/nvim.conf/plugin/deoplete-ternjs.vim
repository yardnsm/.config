let g:tern_request_timeout = 1

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" Setup tern source
let g:deoplete#sources#ternjs#filetypes = [
      \ 'jsx',
      \ 'javascript.jsx'
      \ ]
