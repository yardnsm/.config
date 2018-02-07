" ------------------------------------
"
" This is a simple configuration, no plugins. Just to make vim less painful by default.
" Adopted from https://github.com/yardnsm/dotfiles/blob/master/nvim/nvim.conf/init.vim
"

set nocompatible                      " don't behave like Vi
filetype plugin indent on             " automatically detect file types.

set fileencoding=utf-8
set encoding=utf-8

set modelines=1                       " enable modelines

set number                            " show line numbers
set linebreak                         " wraps between words
set list                              " show invisibles
set scrolloff=8                       " allows to scroll of the screen

set backspace=indent,eol,start        " proper backspacing

" Invisibles
set showbreak=↪
set listchars=  ""

set fillchars+=vert:\┃                " change the split border

syntax on                             " enable syntax highlighting

set nofoldenable                      " do not enable folding by default
set foldmethod=indent                 " based folds on indentation
set foldmarker={{{,}}}                " fold marker
set foldlevelstart=10                 " open most folds by default
set foldnestmax=10                    " 10 nested fold at max

set incsearch                         " shows matches as you type
set smartcase                         " if caps, watch case
set ignorecase                        " ignore case if all lowercase
set hlsearch                          " highlight search results
set gdefault                          " make search&replaces global for the line

set autoindent
set smartindent
set expandtab                         " spaces FTW
set shiftround                        " round indent to multiples of shiftwidth

set shiftwidth=2
set softtabstop=2                     " number of spaces in <tab> when editing
set tabstop=2                         " number of visual spaces per <tab>

set autoread                          " detect when a file is changed

set nobackup                          " do not store backups
set noswapfile                        " do not store swapfiles
set noundofile                        " do not store undos

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

" ------------------------------------

"
" Mappings
"

let mapleader=','                     " change the map leader

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Keep blocks selected after indenting
vnoremap > >gv
vnoremap < <gv

" Toggle search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" Enable hlsearch before searching
nnoremap / :set hlsearch<CR>/

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

" Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Typing ':' requires 2 keystrokes (S-;).
" Let's fix that
nnoremap ; :

" Relative number toggle
nnoremap <leader>tn :set relativenumber!<CR>

" Some abbreviations
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev qQ q!
