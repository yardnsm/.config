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

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" }}}

" ------------------------------------------------------------------------------
" Plugins {{{

call plug#begin($DOTFILES . '/nvim/nvim.conf/plugged')

Plug 'whatyouhide/vim-gotham'
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'airblade/vim-gitgutter'
Plug 'mattn/gist-vim'
Plug 'tpope/vim-fugitive'

Plug 'editorconfig/editorconfig-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'jiangmiao/auto-pairs'

Plug 'terryma/vim-multiple-cursors'

Plug 'matze/vim-move'

Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'

Plug 'Valloric/MatchTagAlways'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'junegunn/vim-emoji'

Plug 'kassio/neoterm'
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'moll/vim-node', { 'for': 'javascript' }

call plug#end()

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

" Change the cursor shape depending on mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" }}}

" ------------------------------------------------------------------------------
" Autocommands {{{

" Terminal stuff
autocmd TermOpen * setlocal statusline=%{b:term_title}
autocmd TermOpen * let w:airline_disabled = 1

" }}}

" ------------------------------------------------------------------------------
" Colors and Syntax {{{

syntax on                             " enable syntax highlighting
colorscheme gotham                    " set colorscheme

if !has("gui_running")
  set background=dark                 " assume a dark background
  set t_Co=256                        " we use a 256-color terminal

  " Change fold bg
  hi Folded ctermbg=green
endif

if has("gui_running")
  set transparency=0
endif

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

set nobackup                          " disable backups
set noswapfile                        " disable swaps
set noundofile                        " disable undofiles

" }}}

" ------------------------------------------------------------------------------
" Misc {{{

set mouse=                            " disable mouse support by default

set showcmd                           " show command in normal (when typed)
set lazyredraw                        " redraw only when we need to
set nocursorline                      " do not highlight current line

set wildmenu                          " enable wildmenu for completion
set wildmode=full

set laststatus=2                      " always show status

set timeout
set timeoutlen=1000
set ttimeoutlen=50

set hidden                            " allow switching buffers w/o saving

set splitbelow                        " split below by default
set splitright                        " split right by default

set colorcolumn=100                   " cuz percision matter

" }}}

" ------------------------------------------------------------------------------
" Mappings and abbreviations {{{

let mapleader=','                     " change the map leader

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Keep blocks selected after indenting
vnoremap > >gv
vnoremap < <gv

" Location window
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>

" Toggle search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" Enable hlsearch before searching
nnoremap / :set hlsearch<CR>/

" Quick access to .vimrc
nnoremap <leader>r :so $MYVIMRC<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Toggle pastemode
nnoremap <leader>tp :set paste!<CR>

" Space open/closes folds
nnoremap <space> za

" Making working with buffers less painful
nnoremap <leader>T :enew<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>
nnoremap <leader>bq :bp <BAR> bd #<CR>

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
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal mappings
nnoremap <Leader>tn <C-w>n:terminal<CR>
nnoremap <Leader>ts <C-w>n:terminal<CR>
nnoremap <Leader>tv <C-w>v<C-w>l:terminal<CR>
nnoremap <Leader>tt :enew<CR>:terminal<CR>
nnoremap <Leader>t. :te<CR>

tnoremap <leader><esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Typing ':' requires 2 keystrokes (S-;).
" Let's fix that
nnoremap ; :

" Uppercase the current word
" nnoremap <C-U> gUaw

" Toggle mouse support
function! MouseToggle()
  if &mouse == 'a'
    set mouse=
  else
    set mouse=a
  endif
endfunc
nnoremap <leader>tm :call MouseToggle()<CR>

" Relative number toggle
nnoremap <leader>tn :set relativenumber!<CR>

" Some abbreviations
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev qQ q!

" }}}
