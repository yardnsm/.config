" vim: set foldmethod=marker foldlevel=0:

" ------------------------------------------------------------------------------
"      _       _ __  _       _
"     (_)___  (_) /_(_)   __(_)___ ___
"    / / __ \/ / __/ / | / / / __ `__ \
"   / / / / / / /_/ /| |/ / / / / / / /
"  /_/_/ /_/_/\__/_(_)___/_/_/ /_/ /_/
"                     yardnsm's init.vim
" ------------------------------------------------------------------------------

" This init.vim file is inteded to be used with the latest version of neovim. I tend to prefer
" using Vimscript as a DSL for setting options, mappings etc.

" General {{{

set nocompatible                      " don't behave like Vi
filetype plugin indent on             " automatically detect file types for indentation

" Use filetype.lua
if has('nvim')
  let g:do_filetype_lua = 1
  let g:did_load_filetypes = 0
endif

set fileencoding=utf-8
set encoding=utf-8

set modelines=1                       " enable modelines

let mapleader="\<space>"
let maplocalleader="\<space>"

" }}}
" Lua Integration {{{

lua require('yardnsm')

" }}}
" Editor {{{

set mouse=                            " disable mouse support by default
" set mouse=nv
" set mousemodel=popup

set number                            " show line numbers
set relativenumber                    " set relative numbers
set linebreak                         " wraps between words
set textwidth=100                     " cuz percision matter
set list                              " show invisibles
set scrolloff=8                       " allows to scroll of fthe screen
set hidden                            " allow switching buffers w/o saving
set backspace=indent                  " INSERT is for INSERT, not DELETE
set nojoinspaces                      " only insert a single space after '.', '!' and '?' with the join command

set wildmenu                          " enable wildmenu for completion
set wildmode=full                     " completion mode

set cursorline                        " highlight current line (may cause vim to be slower)
set colorcolumn=+0                    " make the 'colorcolumn' same as 'textwidth'

set showcmd                           " show command in normal (when typed)
set report=0                          " always display the count of lines yanked or deleted on the message line

" Invisibles
" See also ./lua/yardnsm/autocommands.lua for the listchars change based on expandtab
set showbreak=↪
set listchars=tab:\»\ ,space:\ ,eol:\ ,trail:·,nbsp:_ " ¬

" Change the split border
set fillchars+=eob:\ ,vert:\  " ┃

" Make diff mode look better
set fillchars+=diff:╱

" Always show the status line
set laststatus=2

" Global status line when available
if has('nvim-0.7.0')
  set laststatus=3
  set fillchars+=vert:\│
endif

" }}}
" Colors and Syntax {{{

syntax on                             " enable syntax highlighting

set background=dark                 " assume a dark background
set termguicolors                   " use true colors in the treminal

" Highlight conflict markerts
match Error '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" Folding {{{

set foldmethod=indent                 " base folds on indentation by default
set foldmarker={{{,}}}                " default fold marker
set foldlevelstart=10                 " open most folds by default
set foldnestmax=10                    " max nested folds

" }}}
" Search {{{

set incsearch                         " shows matches as you type
set smartcase                         " if caps, watch case
set ignorecase                        " ignore case if all lowercase
set hlsearch                          " highlight search results
set gdefault                          " make search and replace global for the line
set magic                             " turn magic on for regular expressions

if has('nvim')
  set inccommand=split                " shows the effects of the substitute command incrementally, as you type
endif

" Use `ag` instead of `grep`
if executable('ag')
  set grepprg=ag\ --vimgrep\ --smart-case\ --hidden\ --ignore\ .git
endif

" ...and `rg` if present
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --exclude\ .git\ --no-heading
endif

" }}}
" Indent {{{

" Default to 2 spaces indentation

set autoindent                        " copy indent from current line when starting a new line
set smartindent
set smarttab
set expandtab                         " use spaces
set shiftround                        " round indent to multiplies of shiftwidth

set shiftwidth=2                      " for `>>`, `<<`, `==`
set softtabstop=2                     " number of spaces in <tab> when editing
set tabstop=2                         " number of *visual* spaces per <tab>

" }}}
" File system {{{

set autoread                          " detect when a file is changed

set noundofile                        " disable undofiles
" set nobackup                          " disable backups
" set noswapfile                        " disable swaps

" Neovim defaults are great, but vim's not...
if !has('nvim')
  set undodir=$XDG_DATA_HOME/vim/undo
  set directory=$XDG_DATA_HOME/vim/swap
  set backupdir=$XDG_DATA_HOME/vim/backup
  set viewdir=$XDG_DATA_HOME/vim/view
  set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo

  " Bootstrap directories
  call functions#BootstrapDirectory(&undodir)
  call functions#BootstrapDirectory(&directory)
  call functions#BootstrapDirectory(&backupdir)
  call functions#BootstrapDirectory(&viewdir)
endif

" }}}
" Misc {{{

set lazyredraw                        " don't redraw while performing macros
set winhighlight=Normal:Normal

set splitbelow                        " split below by default
set splitright                        " split right by default

set shortmess+=cI                     " do not show completion-menu messages + :intro message
set completeopt-=preview              " disable preview window

set updatetime=300

" }}}
" Platform-specific stuff {{{

" VimR
if has('gui_vimr')

  " ¯\_(ツ)_/¯

endif

" GVim (on windows specific)
if has('gui')
  set guifont=Consolas:h10

  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

" Windows
if has('win32')
  source $VIMRUNTIME/mswin.vim
  behave mswin

  " Do not keep backup or swp files
  set nobackup
  set nowritebackup
  set noswapfile
endif

" }}}
" Mappings {{{

" Move vertically by visual line
nnoremap j gj
nnoremap k gk
nnoremap ^ g^
nnoremap $ g$

" Keep blocks selected after indenting
vnoremap > >gv
vnoremap < <gv

" Search and replace the word under the cursor (with confirmation prompt)
nnoremap <leader>sw :%s/\<<C-r><C-w>\>//c<Left><Left>
nnoremap <leader>ss :%s/<C-r><C-w>//c<Left><Left>

" Substitute the last search
nmap gs :%s~~
vmap gs :s~~

" Toggle search highlight
" TODO https://github.com/LazyVim/LazyVim/blob/12818a6cb499456f4903c5d8e68af43753ebc869/lua/lazyvim/config/keymaps.lua#L43-L44
nnoremap <ESC> :set hlsearch!<CR>

" Enable hlsearch before searching
nnoremap / :set hlsearch<CR>/
nnoremap ? :set hlsearch<CR>?

" Quick access to .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>zm
nnoremap <leader>sv :source $MYVIMRC<CR>

" Space opens/closes folds
nnoremap <CR> za

" Fold Levels
nnoremap z2 zMzr
nnoremap z3 zMzrzr

" Convert the current word to uppercase when in INSERT mode
inoremap <C-u> <ESC>gUiwgi

" Toggles
" <leader>t for [t]oggle
nnoremap <leader>tm :call functions#ToggleMouse()<CR>
nnoremap <leader>tn :set relativenumber!<CR>
nnoremap <leader>tp :set paste!<CR>
nnoremap <leader>tf :set foldenable!<CR>
nnoremap <leader>tc :set cursorline!<CR>
nnoremap <leader>tw :set wrap!<CR>

" Copy to clipboard
vnoremap <C-c> "+y

" +y to copy to clipboard
nnoremap + "+
vnoremap + "+

" Make `S` works like `X` is to `x`
nnoremap S ch

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Count matches
nnoremap <leader>C :%s///gn<CR>

" Make <S-Tab> inverse <Tab> (:h i_CTRL-D)
inoremap <S-Tab> <C-d>

" Paste over selection without updating the yank register
vnoremap p "_dP
vnoremap _p p

" Close all
nnoremap <leader><BS> :qa<CR>

" Move lines
nnoremap <A-j> <cmd>m .+1<cr>==
nnoremap <A-k> <cmd>m .-2<cr>==
inoremap <A-j> <esc><cmd>m .+1<cr>==gi
inoremap <A-k> <esc><cmd>m .-2<cr>==gi
vnoremap <A-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<cr>gv=gv

" https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]

" Add undo break
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ; ;<C-g>u

" Add a comment above / below
nnoremap gco o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>
nnoremap gcO O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>

" }}}
" Commands {{{

" Strip traling spaces
command! StripTrailingWhitespace call functions#StripTrailingWhitespace()

" Delete a buffer without closing the window
command! BQ :bp | :sp | :bn | :bd

" Call the Vimgrepall functions
command! -nargs=1 GrepAll call functions#Vimgrepall(<f-args>)

" }}}
" Abbreviations {{{

cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev qQ q!
cnoreabbrev bq BQ
cnoreabbrev bd BQ

" Insert a Shebang
" https://github.com/junegunn/dotfiles/blob/master/vimrc#L567
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" }}}
