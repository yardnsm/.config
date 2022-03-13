" vim: set foldmethod=marker foldlevel=0:

" ------------------------------------------------------------------------------
"      _       _ __  _       _
"     (_)___  (_) /_(_)   __(_)___ ___
"    / / __ \/ / __/ / | / / / __ `__ \
"   / / / / / / /_/ /| |/ / / / / / / /
"  /_/_/ /_/_/\__/_(_)___/_/_/ /_/ /_/
"                     yardnsm's init.vim
" ------------------------------------------------------------------------------

" General {{{

set nocompatible                      " don't behave like Vi
filetype plugin indent on             " automatically detect file types for indentation

set fileencoding=utf-8
set encoding=utf-8

set modelines=1                       " enable modelines

" See ~/dev/.setup/nvim/install.sh
" let g:python_host_prog = $PYENV_ROOT . '/versions/neovim/bin/python'
" let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

" }}}
" Plugins {{{

call plug#begin('~/.config/nvim/plugged')

Plug 'lewis6991/impatient.nvim'

" Colors
Plug 'chriskempson/base16-vim'
Plug 'kyazdani42/nvim-web-devicons'

" File tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'wikitopian/hardmode'                " stepping up the game...

Plug 'mhinz/vim-signify'                  " shows git diff in the gutter

Plug 'editorconfig/editorconfig-vim'      " enable support for editorconfig files

Plug 'christoomey/vim-tmux-navigator'     " navigation between tmux and bim splits
Plug 'roxma/vim-tmux-clipboard'           " integration for vim and tmux's clipboard
Plug 'tmux-plugins/vim-tmux-focus-events' " make focus events work inside tmux
Plug 'tmux-plugins/vim-tmux'              " some nice stuff for editing `.tmux.conf`

Plug 'tpope/vim-fugitive'                 " a git wrapper for vim
Plug 'tpope/vim-rhubarb'                  " GitHub extension for vim-fugitive
Plug 'tpope/vim-surround'                 " easly work with surroundings
Plug 'tpope/vim-commentary'               " comment stuff out
Plug 'tpope/vim-unimpaired'               " some sensible bracket mappings
Plug 'tpope/vim-endwise'                  " automatically close `end` blocks (`endif`, `done`, etc.)
Plug 'tpope/vim-repeat'                   " enable repeating support (`.`) for plugin maps
Plug 'tpope/vim-eunuch'                   " some unix shell commands helper
Plug 'tpope/vim-scriptease'               " helper commands for writing Vim plugins

Plug 'rstacruz/vim-closer'                " a more conservative version of auto-pairs
Plug 'alvan/vim-closetag'                 " auto-close SGML tags
Plug 'Valloric/MatchTagAlways'            " highlights matching tags

Plug 'vimwiki/vimwiki'                    " wiki for vim

" Lua plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" TreeSitter stuff
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" My plugins :)
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

" LSP shit
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Completion engine
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'

" Snippets
Plug 'L3MON4D3/LuaSnip'

" MacOS specific plugins
if has('mac')
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
endif

call plug#end()

" }}}
" Lua Integration {{{

" Speed up startup time of lua plugins
lua require('user.plugin.impatient')

" Setup LSP
lua require('user.lsp').setup()
lua require('user.lsp.null-ls')

" Setup Plugins
lua require('user.plugin.cmp')
lua require('user.plugin.treesitter')

" }}}
" Editor {{{

set mouse=                            " disable mouse support by default

set number                            " show line numbers
set relativenumber                    " set relative numbers
set linebreak                         " wraps between words
set textwidth=100                     " cuz percision matter
set list                              " show invisibles
set scrolloff=8                       " allows to scroll of fthe screen
set hidden                            " allow switching buffers w/o saving

set nojoinspaces                      " only insert a single space after '.', '!' and '?' with the join command

set wildmenu                          " enable wildmenu for completion
set wildmode=full                     " completion mode

set cursorline                        " highlight current line (may cause vim to be slower)
set colorcolumn=+0                    " make the 'colorcolumn' same as 'textwidth'

set showcmd                           " show command in normal (when typed)
set report=0                          " always display the count of lines yanked or deleted on the message line

" Invisibles
set showbreak=↪
set listchars=tab:\»\ ,space:\ ,eol:\ ,trail:·,nbsp:_ " ¬

" Change the split border
set fillchars+=vert:\  " ┃

" }}}
" Autocommands {{{

augroup vimrc_au
  autocmd!

  " Unset paste on InsertLeave
  autocmd InsertLeave * silent! set nopaste

  " Set signcolumn for buffers that already have numbers on
  autocmd BufCreate,BufEnter * silent! let &l:signcolumn = &l:number == 1 ? 'yes' : 'auto'

  " Unset cursorline on leave
  " autocmd WinLeave * set nocursorline
  " autocmd WinEnter * set cursorline
augroup END

" }}}
" Colors and Syntax {{{

syntax on                             " enable syntax highlighting

" Settings for the terminal
if !has('gui_vimr')
  set background=dark                 " assume a dark background
  set termguicolors                   " use true colors in the treminal

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
    " User1..9 highlights are used for the statusline
    autocmd ColorScheme base16-classic-dark
          \   highlight Comment ctermfg=11
          \ | highlight Folded ctermbg=green ctermfg=11
          \ | highlight SpellBad cterm=undercurl ctermbg=1
          \ | highlight SpellCap cterm=undercurl ctermbg=4
          \ | highlight SpellRare cterm=undercurl ctermbg=11
          \ | highlight SpellLocal cterm=undercurl ctermbg=8
          \ | highlight MatchTag ctermbg=11 ctermfg=1 guibg=#303030 guifg=#AC4142
          \ | highlight Statement cterm=bold
          \ | highlight StatusLine ctermbg=11 cterm=bold
          \ | highlight FloatBorder ctermfg=11 ctermbg=0 guifg=#303030 guibg=#151515
          \
          \ | highlight LspReferenceText ctermbg=11 guibg=#303030
          \ | highlight LspReferenceRead ctermbg=11 guibg=#303030
          \ | highlight LspReferenceWrite ctermbg=11 guibg=#303030
          \
          \ | highlight DiagnosticError ctermbg=10 guibg=#202020
          \ | highlight DiagnosticWarn ctermbg=10 guibg=#202020
          \ | highlight DiagnosticHint ctermbg=10 guibg=#202020
          \ | highlight DiagnosticInfo ctermbg=10 guibg=#202020
          \
          \ | highlight TelescopeMatching ctermfg=6 cterm=bold guifg=#75B5AA gui=bold
          \ | highlight link TelescopeTitle TelescopeMatching
          \ | highlight TelescopeResultsNormal ctermfg=11 guifg=#505050
          \
          \ | highlight! clear PmenuSel
          \ | highlight! PmenuSel guibg=#303030
          \ | highlight! CmpItemMenu guifg=#505050
          \ | highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
          \ | highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
          \ | highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
          \ | highlight! link CmpItemKind CmpItemKindDefault
          \ | highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
          \ | highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
          \ | highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
          \ | highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
          \ | highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
          \ | highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
          \ | highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
          \ | highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
          \
          \ | highlight User1 ctermfg=15 ctermbg=11 cterm=bold guifg=#F5F5F5 guibg=#303030 gui=bold
          \ | highlight User2 ctermfg=15 ctermbg=11            guifg=#F5F5F5 guibg=#303030
          \ | highlight User3 ctermfg=6  ctermbg=10            guifg=#75B5AA guibg=#202020
          \ | highlight User5 ctermfg=4  ctermbg=0  cterm=bold guifg=#6A9FB5 guibg=#151515 gui=bold
          \ | highlight User6 ctermfg=9  ctermbg=0  cterm=bold guifg=#D28445 guibg=#151515 gui=bold
          \ | highlight User7 ctermfg=1  ctermbg=0  cterm=bold guifg=#AC4142 guibg=#151515 gui=bold
          \ | highlight User8 ctermfg=3  ctermbg=0             guifg=#F4BF75 guibg=#151515
          \ | highlight User9 ctermfg=10 ctermbg=0             guifg=#202020 guibg=#151515

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

" Highlight conflict markerts
match Error '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" Statusline {{{

" Always show the status line
set laststatus=2

augroup statusline_au
  autocmd!

  autocmd BufWinEnter,WinEnter,FocusGained,FileType *
        \ if type(statusline#GetMinimalName(&ft)) ==# v:t_string |
        \   setlocal statusline=%!statusline#BuildMinimalStatusLine('active') |
        \ else |
        \   setlocal statusline=%!statusline#BuildStatusLine('active') |
        \ endif

  autocmd WinLeave,FocusLost *
        \ if type(statusline#GetMinimalName(&ft)) ==# v:t_string |
        \   setlocal statusline=%!statusline#BuildMinimalStatusLine('inactive') |
        \ else |
        \   setlocal statusline=%!statusline#BuildStatusLine('inactive') |
        \ endif
augroup END


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
  set inccommand=split                " shows the effects of the substitute
                                      " command incrementally, as you type
endif

" Use `ag` instead of `grep`
if executable('ag')
  set grepprg=ag\ --vimgrep\ --smart-case\ --hidden\ --ignore\ .git
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

set timeout
set timeoutlen=1000
set ttimeoutlen=50
set updatetime=300

set splitbelow                        " split below by default
set splitright                        " split right by default

set shortmess+=cI                     " do not show completion-menu messages + :intro message
set completeopt-=preview              " disable preview window

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

let mapleader=','                     " change the map leader
let maplocalleader=','

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
nnoremap <leader>tm :call functions#ToggleMouse()<CR>
nnoremap <leader>tn :set relativenumber!<CR>
nnoremap <leader>tp :set paste!<CR>
nnoremap <leader>tf :set foldenable!<CR>
nnoremap <leader>tc :set cursorline!<CR>

" Copy to clipboard
vnoremap <C-c> "+y

" Make `S` works like `X` is to `x`
nnoremap S ch

" Scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Count matches
nnoremap <leader>C :%s///gn<CR>

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

" Insert a Shebang
" https://github.com/junegunn/dotfiles/blob/master/vimrc#L567
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" }}}
