" vim: set foldmethod=marker foldlevel=0:

" ------------------------------------------------------------------------------
"         _
"  __   _(_)_ __ ___  _ __ ___
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__
"  (_)_/ |_|_| |_| |_|_|  \___|
"                     yardnsm's .vimrc
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" General {{{

set nocompatible                      " don't behave like Vi
filetype plugin indent on             " automatically detect file types.

set fileencoding=utf-8
set encoding=utf-8

set modelines=1                       " enable modelines

" }}}

" ------------------------------------------------------------------------------
" Plugins {{{

call plug#begin($DOTFILES . '/nvim/nvim.conf/plugged')

" Color scheme
Plug 'whatyouhide/vim-gotham'

" Syntax and stuff
Plug 'Yggdroot/indentLine'

" Javascript stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Statusbar
Plug 'vim-airline/vim-airline'

" Filetree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Easly surround text objects
Plug 'tpope/vim-surround'

" Snippets!
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Automatic closing
Plug 'jiangmiao/auto-pairs'

" Easy commenting
Plug 'Tpope/vim-commentary'

" Multiple cursors!
Plug 'terryma/vim-multiple-cursors'

" Move lines and selections
Plug 'matze/vim-move'

" Code completion
Plug 'Valloric/YouCompleteMe'

" Match SGML tags
Plug 'Valloric/MatchTagAlways'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Emojis
Plug 'junegunn/vim-emoji'

" Multi cursors!
Plug 'vim-multiple-cursors'

" Neovim plugins
Plug 'kassio/neoterm'
Plug 'neomake/neomake'

" Fix neomake
Plug 'benjie/neomake-local-eslint.vim'

call plug#end()

" }}}

" ------------------------------------------------------------------------------
" Plugins config {{{

" Airline
let g:airline_theme='gotham'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#tab_min_count=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#show_splits=0

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_warning_sign = {'text': 'W', 'texthl': 'WarningMsg'}
let g:neomake_error_sign = {'text': 'E', 'texthl': 'ErrorMsg'}

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" NERDTree
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['\.DS_Store$']

" indentLine
let g:indentLine_color_term = 11
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0

" vim-move
let g:move_key_modifier = 'C'

" UltiSnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

" fzf status line
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=0
  setlocal statusline=%#fzf1#~~>\ fzf
  setlocal statusline+=\ %{emoji#for('see_no_evil')}
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

" Redefine :Ag command (fix a color problem)
autocmd VimEnter * command! -nargs=* Ag
      \ call fzf#vim#ag(<q-args>, '--color-path "33;1"', fzf#vim#default_layout)
" }}}

" ------------------------------------------------------------------------------
" Editor {{{

set number                            " show line numbers
set linebreak                         " wraps between words
set list                              " show invisibles
set scrolloff=8                       " allows to scroll of the screen

set backspace=indent,eol,start        " proper backspacing

" Invisibles
set showbreak=↪
set listchars=tab:\»\ ,space:\ ,eol:\ ,trail:·,nbsp:_ " ¬

" Change the split border
set fillchars+=vert:\┃
" }}}

" ------------------------------------------------------------------------------
" Movement {{{

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Disable mouse support
set mouse=v

" change the cursor shape depending on mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" }}}

" ------------------------------------------------------------------------------
" Colors and Syntax {{{

set background=dark                   " assume a dark background
colorscheme gotham                    " set colorscheme

set t_Co=256                          " we use a 256-color terminal

if &term =~ '256color'
  set t_ut=                           " disable background color erase
endif

syntax on                             " enable syntax highlighting

" Change fold bg
hi Folded ctermbg=green

" }}}

" ------------------------------------------------------------------------------
" Folding {{{

set nofoldenable                      " do not enable folding by default
set foldmethod=indent                 " based folds on indentation
set foldmarker={{{,}}}                " fold marker
set foldlevelstart=10                 " open most folds by default
set foldnestmax=10                    " 10 nested fold at max

" }}}

" ------------------------------------------------------------------------------
" Search {{{

set incsearch                         " shows matches as you type
"set showmatch                         " jump to matching bracket
set smartcase                         " if caps, watch case
set ignorecase                        " ignore case if all lowercase
set hlsearch                          " highlight search results
set gdefault                          " make search&replaces global for the line

" }}}

" ------------------------------------------------------------------------------
" Indent {{{

set autoindent
set smartindent
set expandtab                         " spaces FTW
set shiftround                        " round indent to multiples of shiftwidth

set shiftwidth=2
set softtabstop=2                     " number of spaces in <tab> when editing
set tabstop=2                         " number of visual spaces per <tab>

" }}}

" ------------------------------------------------------------------------------
" File system {{{

set autoread                          " detect when a file is changed

" Backup files
set backup
if &backupdir =~# '^\.,'
  let &backupdir = $HOME . "/.nvimtmp/backup," . &backupdir
endif

" Swap files
set swapfile
if &directory =~# '^\.,'
  let &directory = $HOME . "/.nvimtmp/swap," . &directory
endif

" Undo files
set undofile
if &undodir =~# '^\.\%(,\|$\)'
  let &undodir = $HOME . "/.nvimtmp/undo," . &undodir
endif

" }}}

" ------------------------------------------------------------------------------
" Misc {{{

set showcmd                           " show command in normal (when typed)
set lazyredraw                        " redraw only when we need to
set cursorline                        " highlight current line

set wildmenu                          " enable wildmenu for completion
set wildmode=full

set laststatus=2                      " always show status

set timeout                           " Make airline work
set timeoutlen=1000
set ttimeoutlen=50

set hidden                            " allow switching buffers w/o saving

set splitbelow                        " split below by default
set splitright                        " split right by default

set colorcolumn=80                    " cus percision matter

" Open folds to right and bottom
set splitbelow
set splitright
" }}}

" ------------------------------------------------------------------------------
" Mappings and abbreviations {{{

let mapleader=','                     " change the map leader

" Indent using the <tab> key
nnoremap <tab> >>
nnoremap <s-tab> <<

" Keep blocks selected after indenting
vnoremap > >gv
vnoremap < <gv

" Toggle search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" Re-source .vimrc
nnoremap <leader>r :so $MYVIMRC<CR>

" Toggle pastemode
nnoremap <leader>p :set paste!<CR>

" Space open/closes folds
nnoremap <space> za

" Disable arrow keys for now...
noremap <left>  <nop>
noremap <right> <nop>
noremap <up>    <nop>
noremap <down>  <nop>

" ...and also in INSERT mode
inoremap <left>  <nop>
inoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>

" Splits (there's a problem with <C-h>, ref:
" https://github.com/neovim/neovim/issues/2048)
nnoremap <BS> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Typing ':' requires 2 keystrokes (S-;).
" Let's fix that
nnoremap ; :

" Copy to system clipboard
vnoremap <C-c> "*y<CR>

" Relative number toggle
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>tn :call NumberToggle()<CR>

" Some abbreviations
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Tabe tabe
cnoreabbrev qQ q!

" NERDtree stuff
nnoremap <leader>/ :NERDTreeToggle<CR>
nnoremap <leader>0 :NERDTreeFocus<CR>

" Neomake
nnoremap <leader>no :lopen<CR>
nnoremap <leader>nc :lclose<CR>

" fzf stuff
nnoremap <C-p> :Files<CR>
nnoremap <leader>lb :Buffers<CR>
nnoremap <leader>lg :GFiles?<CR>
nnoremap <leader>lc :Commits<CR>
nnoremap <leader>lt :Filetypes<CR>
" }}}
