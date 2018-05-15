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

" let g:python_host_skip_check = 1
" let g:python3_host_skip_check = 1

" let g:python_host_prog = '/usr/local/bin/python2'
" let g:python3_host_prog = '/usr/local/bin/python3'

let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

" }}}

" ------------------------------------------------------------------------------
" Plugins {{{

call plug#begin($HOME . '/dotfiles/nvim/nvim.conf/plugged')

Plug 'whatyouhide/vim-gotham'

Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'kshenoy/vim-signature'
Plug 'ktonga/vim-follow-my-lead'

Plug 'editorconfig/editorconfig-vim'

Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'mileszs/ack.vim'

" tpope deserves his own section
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'

" same for junegunn
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/goyo.vim'

" Autocompletion
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  { 'do': 'npm install' }
Plug 'Shougo/neco-vim'

" ------------------------------------------------
" Language specific stuff (besides autocompletion)
" ------------------------------------------------

" SGML stuff
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways', {
  \ 'for': ['html', 'xml', 'jsx', 'xhtml']
  \ }

" JavaScript stuff
Plug 'moll/vim-node'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" TypeScript stuff
Plug 'mhartington/nvim-typescript', { 'do': ':UpdateRemotePlugins' }

" Python stuff
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Tmux stuff
Plug 'tmux-plugins/vim-tmux'

" Universal shit
Plug 'sheerun/vim-polyglot'

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
set fillchars+=vert:\  " ┃

" Change the cursor shape depending on mode
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" }}}

" ------------------------------------------------------------------------------
" Autocommands {{{

      " ¯\_(ツ)_/¯

" }}}

" ------------------------------------------------------------------------------
" Colors and Syntax {{{

syntax on                             " enable syntax highlighting

try
  colorscheme gotham                  " set colorscheme

  " Setup base16-shell
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
catch
endtry

if !has('gui_vimr')
  set background=dark                 " assume a dark background
  set t_Co=256                        " we use a 256-color terminal

  " Set colors for folds
  highlight Folded ctermbg=green ctermfg=blue
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
set smarttab
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

set shortmess+=c                      " do not show completion-menu messages

" }}}

" ------------------------------------------------------------------------------
" GUI stuff {{{
"
if has('gui_vimr')
  " set cursorline                      " highlight the current line
endif

" }}}

" ------------------------------------------------------------------------------
" Mappings and abbreviations {{{

let mapleader=','                     " change the map leader
let maplocalleader=','

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Keep blocks selected after indenting
vnoremap > >gv
vnoremap < <gv

" Quickfix window
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>

" Toggle search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" Enable hlsearch before searching
" AND also use 'very magic' mode
nnoremap / :set hlsearch<CR>/\v
vnoremap / :set hlsearch<CR>/\v
nnoremap ? :set hlsearch<CR>?\v
vnoremap ? :set hlsearch<CR>?\v

" Quick access to .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

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
nnoremap <Leader>ts <C-w>n:terminal<CR>
nnoremap <Leader>tv <C-w>v<C-w>l:terminal<CR>
nnoremap <Leader>tt :terminal<CR>

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

" Toggle pastemode
nnoremap <leader>tp :set paste!<CR>

" Copy to clipboard
vnoremap <C-c> "+y

" Some abbreviations
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev qQ q!

" }}}
