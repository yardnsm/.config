" vim: set foldmethod=marker foldlevel=0:

" ------------------------------------------------------------------------------
"            _
"     _   __(_)___ ___  __________
"    | | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /__
"  (_)___/_/_/ /_/ /_/_/   \___/
"                     yardnsm's .vimrc
" ------------------------------------------------------------------------------

" Make Vim work nicely with Neovim config

" May be broken for some machines?
" ¯\_(ツ)_/¯
let s:neovim_paths = [
      \ '~/.config/nvim',
      \ '~/.config/nvim/after',
      \ '~/.local/share/nvim/site',
      \ ]

for p in s:neovim_paths
  execute "set rtp^=" . p
endfor

let &packpath = &runtimepath
source ~/.config/nvim/init.vim
