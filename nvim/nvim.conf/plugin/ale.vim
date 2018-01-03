let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tslint'],
      \ 'python': ['flake8'],
      \ }

let g:ale_fixers = {
      \ 'javascript': ['eslint'],
      \ }

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
