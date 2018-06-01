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
filetype plugin indent on             " automatically detect file types for indentation

set fileencoding=utf-8
set encoding=utf-8

set modelines=1                       " enable modelines

" let g:python_host_skip_check = 1
" let g:python3_host_skip_check = 1

" let g:python_host_prog = '/usr/local/bin/python2'
" let g:python3_host_prog = '/usr/local/bin/python3'

" see ~/dotfiles/nvim/setup-python-env.sh
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim3/bin/python'

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Plugins {{{

call plug#begin('~/.config/nvim/plugged')

" Colors
Plug 'whatyouhide/vim-gotham'

" Status line
Plug 'itchyny/lightline.vim'

" Linting support
Plug 'w0rp/ale'

" File tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'             " shows git diff in the gutter
Plug 'kshenoy/vim-signature'              " displays marks in the gutter (and more)
Plug 'terryma/vim-multiple-cursors'       " multiple cursors for vim!

Plug 'editorconfig/editorconfig-vim'      " enable support for editorconfig files

Plug 'christoomey/vim-tmux-navigator'     " navigation between tmux and bim splits
Plug 'roxma/vim-tmux-clipboard'           " integration for vim and tmux's clipboard
Plug 'tmux-plugins/vim-tmux-focus-events' " make focus events work inside tmux

Plug 'mileszs/ack.vim'                    " support for Ack within vim (I use it for Ag, though)

Plug 'tpope/vim-fugitive'                 " a git wrapper for vim
Plug 'tpope/vim-rhubarb'                  " GitHub extension for vim-fugitive
Plug 'tpope/vim-surround'                 " easly work with surroundings
Plug 'tpope/vim-commentary'               " comment stuff out
Plug 'tpope/vim-characterize'             " more character info in `ga`
Plug 'tpope/vim-unimpaired'               " some sensible bracket mappings
Plug 'tpope/vim-endwise'                  " automatically close `end` blocks (`endif`, `done`, etc.)
Plug 'tpope/vim-repeat'                   " enable repeating support (`.`) for plugin maps
Plug 'tpope/vim-eunuch'                   " some unix shell commands helper

Plug 'junegunn/vim-easy-align'            " an alignment plugin
Plug 'jiangmiao/auto-pairs'               " insert or delete pairs
Plug 'junegunn/vim-emoji'                 " emoji in vim!
Plug 'junegunn/vim-peekaboo'              " view the registers content when using `\"`, `@` or <C-R>

Plug 'SirVer/ultisnips'                   " snippets

" Autocompletion
" ------------------------------------------------------------------------------

Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-zsh'
Plug 'wellle/tmux-complete.vim'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'

" Language specific stuff (besides autocompletion)
" ------------------------------------------------------------------------------

" SGML stuff
Plug 'alvan/vim-closetag'
Plug 'Valloric/MatchTagAlways'

" CSS stuff
Plug 'ap/vim-css-color'

" JavaScript stuff
Plug 'moll/vim-node'

" Python stuff
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Tmux config stuff
Plug 'tmux-plugins/vim-tmux'

" Universal shit
Plug 'sheerun/vim-polyglot'

" MacOS specific plugins
" ------------------------------------------------------------------------------

if has('mac')
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif

call plug#end()

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Editor {{{

set mouse=                            " disable mouse support by default

set number                            " show line numbers
set linebreak                         " wraps between words
set list                              " show invisibles
set scrolloff=8                       " allows to scroll of fthe screen
set hidden                            " allow switching buffers w/o saving

set nojoinspaces                      " only insert a single space after '.', '!' and '?' with the join command

set wildmenu                          " enable wildmenu for completion
set wildmode=full                     " completion mode

set cursorline                        " highlight current line (may cause vim to be slower)
set colorcolumn=100                   " cuz percision matter

set showcmd                           " show command in normal (when typed)
set laststatus=2                      " always show the status line

set report=0                          " always display the count of lines yanked or deleted on the message line

set backspace=indent,eol,start        " proper backspacing

" Invisibles
set showbreak=↪
set listchars=tab:\»\ ,space:\ ,eol:\ ,trail:·,nbsp:_ " ¬

" Change the split border
set fillchars+=vert:\  " ┃

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Autocommands {{{

augroup vimrc
  autocmd!

  " Unset paste on InsertLeave
  autocmd InsertLeave * silent! set nopaste
augroup END

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Colors and Syntax {{{

syntax on                             " enable syntax highlighting

" Settings for the terminal
if !has('gui_vimr')
  set background=dark                 " assume a dark background
  set t_Co=256                        " we use a 256-color terminal

  " Colorscheme overrides
  augroup CustomColors
    autocmd!

    " For gotham
    autocmd ColorScheme gotham
          \   highlight Folded ctermbg=green ctermfg=blue
          \ | highlight VertSplit ctermfg=4 ctermbg=10
  augroup END
endif

try
  colorscheme gotham                  " set colorscheme

  " Setup base16-shell
  if g:colors_name == 'base16-default-dark'
    if filereadable(expand("~/.vimrc_background"))
      let base16colorspace=256
      source ~/.vimrc_background
    endif
  endif
catch
endtry

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Folding {{{

set nofoldenable                      " do not enable folding by default (<leader>tf)
set foldmethod=indent                 " base folds on indentation by default
set foldmarker={{{,}}}                " fold marker
set foldlevelstart=10                 " open most folds by default
set foldnestmax=10                    " max nested folds

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Search {{{

set incsearch                         " shows matches as you type
set smartcase                         " if caps, watch case
set ignorecase                        " ignore case if all lowercase
set hlsearch                          " highlight search results
set gdefault                          " make search and replace global for the line
set magic                             " turn magic on for regular expressions

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Indent {{{

set autoindent
set smartindent
set smarttab
set expandtab                         " use spaces
set shiftround                        " round indent to multiplies of shiftwidth

set shiftwidth=2                      " for `>>`, `<<`, `==`
set softtabstop=2                     " number of spaces in <tab> when editing
set tabstop=2                         " number of *visual* spaces per <tab>

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" File system {{{

set autoread                          " detect when a file is changed

set nobackup                          " disable backups
set noswapfile                        " disable swaps
set noundofile                        " disable undofiles

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Misc {{{

set lazyredraw                        " don't redraw while performing macros

set timeout
set timeoutlen=1000
set ttimeoutlen=50

set splitbelow                        " split below by default
set splitright                        " split right by default

set shortmess+=c                      " do not show completion-menu messages

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" GUI stuff {{{

" Using VimR mainly
if has('gui_vimr')

  " ¯\_(ツ)_/¯

endif

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Mappings {{{

let mapleader=','                     " change the map leader
let maplocalleader=','

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Keep blocks selected after indenting
vnoremap > >gv
vnoremap < <gv

" Search and replace the word under the cursor (with confirmation prompt)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//c<Left><Left>

" Location list
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lc :lclose<CR>

" Quickfix list
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>

" Toggle search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" Enable hlsearch before searching
nnoremap / :set hlsearch<CR>/
vnoremap / :set hlsearch<CR>/
nnoremap ? :set hlsearch<CR>?
vnoremap ? :set hlsearch<CR>?

" Quick access to .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Space open/closes folds
nnoremap <space> za

" Making working with buffers less painful
" nnoremap <leader>bq :bp <BAR> bd #<CR>

" Circular windows navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

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

" Typing ':' with only one keystroke
nnoremap ; :

" qq to record, Q to run
nnoremap Q @q

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

" Toggle indent
nnoremap <leader>tf :set foldenable!<CR>

" Toggle cursorline
nnoremap <leader>tc :set cursorline!<CR>

" Copy to clipboard
vnoremap <C-c> "+y

" Retired
" I use this section for reference
" ------------------------------------------------------------------------------

" Splits
" Letting `vim-tmux-navigator` to manage these
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" In favor of vim-unimpaired
" nnoremap <leader>n :bnext<CR>
" nnoremap <leader>p :bprevious<CR>

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Commands {{{

    " ¯\_(ツ)_/¯

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Abbreviations {{{

cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev qQ q!

" Insert a Shebang
" https://github.com/junegunn/dotfiles/blob/master/vimrc#L567
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" }}}
" ------------------------------------------------------------------------------
