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
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'

" Linting support
Plug 'w0rp/ale'

" File tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'wikitopian/hardmode'                " stepping up the game...

Plug 'alvan/vim-closetag'                 " auto-close SGML tags
Plug 'Valloric/MatchTagAlways'            " highlights matching tags

Plug 'airblade/vim-gitgutter'             " shows git diff in the gutter
Plug 'kshenoy/vim-signature'              " displays marks in the gutter (and more)
" Plug 'terryma/vim-multiple-cursors'       " multiple cursors for vim!

Plug 'editorconfig/editorconfig-vim'      " enable support for editorconfig files

Plug 'christoomey/vim-tmux-navigator'     " navigation between tmux and bim splits
Plug 'roxma/vim-tmux-clipboard'           " integration for vim and tmux's clipboard
Plug 'tmux-plugins/vim-tmux-focus-events' " make focus events work inside tmux
Plug 'tmux-plugins/vim-tmux'              " some nice stuff for editing `.tmux.conf`

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
" Plug 'junegunn/vim-emoji'                 " emoji in vim!
" Plug 'junegunn/vim-peekaboo'              " view the registers content when using `\"`, `@` or <C-R>

Plug 'SirVer/ultisnips'                   " snippets
Plug 'vimwiki/vimwiki'                    " wiki for vim

Plug 'moll/vim-node'                      " allowg to `gf` properly on `require`

Plug 'python-mode/python-mode',           " python support
      \ { 'branch': 'develop' }

Plug 'sheerun/vim-polyglot'               " one language pack to rule them all

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
set relativenumber                    " set relative numbers
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

augroup vimrc_au
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

  " set t_Co=256                        " we use a 256-color terminal

  " Colorscheme overrides
  augroup custom_colors_au
    autocmd!

    " For gotham
    autocmd ColorScheme gotham
          \   highlight Folded ctermbg=green ctermfg=blue
          \ | highlight VertSplit ctermfg=4 ctermbg=10
          \ | highlight MatchTag ctermbg=12 ctermfg=9

          " \ | highlight CursorLineNr ctermfg=3

    " For base16-classic-dark
    autocmd ColorScheme base16-classic-dark
          \   highlight Comment ctermfg=11
          \ | highlight Folded ctermbg=green ctermfg=11
          \ | highlight SpellBad cterm=undercurl ctermbg=1
          \ | highlight SpellCap cterm=undercurl ctermbg=4
          \ | highlight SpellRare cterm=undercurl ctermbg=11
          \ | highlight SpellLocal cterm=undercurl ctermbg=8
          \ | highlight MatchTag ctermbg=11 ctermfg=1
          \ | highlight Statement cterm=bold
          \ | highlight StatusLine cterm=bold
          \ | highlight StatusLineNC ctermbg=11 ctermfg=11

  augroup END
endif

try
  colorscheme base16-classic-dark     " set colorscheme

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
" Statusline {{{

" Check out './autoload/statusline.vim'

" Always show the status line
set laststatus=2

" Highlights
" TODO: add to an augroup
hi User1 ctermfg=10 ctermbg=4
hi User2 ctermfg=10 ctermbg=4
hi User3 ctermfg=6 ctermbg=11

" Highlights for lint warnings and errors
hi User6 ctermfg=10 ctermbg=9
hi User7 ctermfg=15 ctermbg=1

function! BuildStatusLine(mode) abort
  let l:result = ''

  if a:mode ==# 'active'
    let l:result .= '%1* %f '                        " filename
    let l:result .= '%3* %r'                         " readonly
    let l:result .= '%3*%m'                          " modified
    let l:result .= '%3*%{statusline#Paste()} '      " paste

    let l:result .= '%3*%='                          " going to the right side

    let l:result .= '%3*%{statusline#Filetype()} | ' " filetype
    let l:result .= '%3*%3p%% '                      " line percentage
    let l:result .= '%2* %3l:%-2c '                  " line info

    let l:result .= '%6*%{statusline#ALEWarnings()}' " lint warning
    let l:result .= '%7*%{statusline#ALEErrors()}'   " lint errors

  elseif a:mode ==# 'inactive'
    let l:result .= '%f %m'           " filename, buffer number and modified

  else
    let l:result .= '%1* ' . a:mode . ' %3*'
  endif

  return l:result
endfunction

set statusline=%!BuildStatusLine('active')

augroup statusline_au
  autocmd!

  autocmd WinEnter * setlocal statusline=%!BuildStatusLine('active')
  autocmd WinLeave * setlocal statusline=%!BuildStatusLine('inactive')

  autocmd FocusGained * setlocal statusline=%!BuildStatusLine('active')
  autocmd FocusLost * setlocal statusline=%!BuildStatusLine('inactive')

  autocmd FileType nerdtree setlocal statusline=%!BuildStatusLine('NERD')
  autocmd FileType qf setlocal statusline=%!BuildStatusLine('%q')
augroup END


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
set inccommand=split                  " shows the effects of a command incrementally, as you type

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
nnoremap <leader>sw :%s/\<<C-r><C-w>\>//c<Left><Left>
nnoremap <leader>ss :%s/<C-r><C-w>//c<Left><Left>

" Toggle search highlight
nnoremap <leader><space> :set hlsearch!<CR>

" Enable hlsearch before searching
nnoremap / :set hlsearch<CR>/
nnoremap ? :set hlsearch<CR>?

" Quick access to .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>zm
nnoremap <leader>sv :source $MYVIMRC<CR>

" Space opens/closes folds
nnoremap <space> za

" Convert the current word to uppercase when in INSERT mode
inoremap <C-u> <ESC>gUiwgi

" Toggles
nnoremap <leader>tm :call functions#MouseToggle()<CR>
nnoremap <leader>tn :set relativenumber!<CR>
nnoremap <leader>tp :set paste!<CR>
nnoremap <leader>tf :set foldenable!<CR>
nnoremap <leader>tc :set cursorline!<CR>

" Copy to clipboard
vnoremap <C-c> "+y

" Since I use <C-a> as tmux's prefix,
" Map <C-y> to <C-a> (incrementing a number)
nnoremap <C-y> <C-a>

" Make `S` works like `X` is to `x`
nnoremap S hs

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

" In favor of hardmode
" noremap <left>  <nop>
" noremap <right> <nop>
" noremap <up>    <nop>
" noremap <down>  <nop>
" inoremap <left>  <nop>
" inoremap <right> <nop>
" inoremap <up>    <nop>
" inoremap <down>  <nop>

" Typing ':' with only one keystroke
" nnoremap ; :

" Making working with buffers less painful
" nnoremap <leader>bq :bp <BAR> bd #<CR>

" qq to record, Q to run
" nnoremap Q @q

" " Circular windows navigation
" nnoremap <tab>   <c-w>w
" nnoremap <S-tab> <c-w>W

" " Location list
" nnoremap <leader>lo :lopen<CR>
" nnoremap <leader>lc :lclose<CR>

" " Quickfix list
" nnoremap <leader>co :copen<CR>
" nnoremap <leader>cc :cclose<CR>

" " Move to the next closed fold
" " https://stackoverflow.com/a/9407015
" nnoremap <silent> ]z :call functions#NextClosedFold('j')<cr>
" nnoremap <silent> [z :call functions#NextClosedFold('k')<cr>

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Commands {{{

" Strip traling spaces
command! StripTrailingWhitespace call functions#StripTrailingWhitespace()

" Delete a buffer without closing the window
command! BQ :bp | :sp | :bn | :bd

" }}}
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" Abbreviations {{{

cnoreabbrev Q q
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev qQ q!
cnoreabbrev bq BQ

" Insert a Shebang
" https://github.com/junegunn/dotfiles/blob/master/vimrc#L567
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" }}}
" ------------------------------------------------------------------------------
