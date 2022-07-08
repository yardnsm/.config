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

let mapleader=','                     " change the map leader
let maplocalleader=','

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
Plug 'scrooloose/nerdtree'

Plug 'mhinz/vim-signify'                  " shows git diff in the gutter

Plug 'editorconfig/editorconfig-vim'      " enable support for editorconfig files

Plug 'christoomey/vim-tmux-navigator'     " navigation between tmux and bim splits
Plug 'roxma/vim-tmux-clipboard'           " integration for vim and tmux's clipboard
Plug 'tmux-plugins/vim-tmux'              " some nice stuff for editing `.tmux.conf`

Plug 'tpope/vim-fugitive'                 " a git wrapper for vim
Plug 'tpope/vim-rhubarb'                  " GitHub extension for vim-fugitive
Plug 'tpope/vim-surround'                 " easly work with surroundings
Plug 'tpope/vim-commentary'               " comment stuff out
Plug 'tpope/vim-unimpaired'               " some sensible bracket mappings
Plug 'tpope/vim-repeat'                   " enable repeating support (`.`) for plugin maps
Plug 'tpope/vim-eunuch'                   " some unix shell commands helper
Plug 'tpope/vim-scriptease'               " helper commands for writing Vim plugins

Plug 'Valloric/MatchTagAlways'            " highlights matching tags

Plug 'vimwiki/vimwiki'                    " wiki for vim

" Lua plugins
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" TreeSitter stuff
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'yardnsm/nvim-autopairs', { 'branch': 'fix/custom-end-pair-endwise' }
Plug 'windwp/nvim-ts-autotag'
Plug 'RRethy/nvim-treesitter-endwise'     " automatically close `end` blocks (`endif`, `done`, etc.)

" My plugins :)
Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }

" LSP shit
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'j-hui/fidget.nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'SmiteshP/nvim-navic'

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

lua require('user')

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
  autocmd FileType nerdtree lua vim.schedule(function () vim.wo.signcolumn = 'auto'; vim.wo.winbar = '' end)
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

    " Gotham {{{

    autocmd ColorScheme gotham
          \   highlight Folded ctermbg=green ctermfg=blue
          \ | highlight VertSplit ctermfg=4 ctermbg=10
          \ | highlight MatchTag ctermbg=12 ctermfg=9
          " \ | highlight CursorLineNr ctermfg=3

    " }}}
    " Base16 {{{


    " Note that we're referring to the **base16** color codes -- not Vim's cterms!
    function! s:hi(group, fg, bg, ...)
      let l:attr = get(a:, 1, "")
      let l:guisp = get(a:, 2, "")

      let l:fg_hex = a:fg !=# "" ? printf('%.2X', a:fg) : v:null
      let l:bg_hex = a:bg !=# "" ? printf('%.2X', a:bg) : v:null

      let l:guifg = l:fg_hex !=# v:null ? g:['base16_gui' . l:fg_hex] : ""
      let l:guibg = l:bg_hex !=# v:null ? g:['base16_gui' . l:bg_hex] : ""

      let l:ctermfg = l:fg_hex !=# v:null ? g:['base16_cterm' . l:fg_hex] : ""
      let l:ctermbg = l:bg_hex !=# v:null ? g:['base16_cterm' . l:bg_hex] : ""

      cal g:Base16hi(a:group, l:guifg, l:guibg, l:ctermfg, l:ctermbg, l:attr, l:guisp)
    endfunction

    " User1..9 highlights are used for the statusline
    autocmd ColorScheme base16-*
          \   highlight Comment ctermfg=11
          \ | highlight Folded ctermbg=green ctermfg=11
          \ | highlight Statement cterm=bold
          \ | highlight StatusLine ctermbg=11 cterm=bold
          \ | call s:hi('MatchTag', 8, 2)
          \ | call s:hi('FloatBorder', 2, 0)
          \
          \ | highlight clear SignColumn
          \ | highlight clear LineNr
          \ | highlight clear CursorLineNr
          \ | call s:hi('SignColumn', 3, "")
          \ | call s:hi('LineNr', 3, "")
          \ | call s:hi('CursorLineNr', 4, "", "bold")
          \
          \ | highlight clear VertSplit
          \ | call s:hi('VertSplit', 3, "")
          \
          \ | call s:hi('SpellBad', "", 8, "undercurl")
          \ | call s:hi('SpellCap', "", 13, "undercurl")
          \ | call s:hi('SpellRare', "", 2, "undercurl")
          \ | call s:hi('SpellLocal', "", 3, "undercurl")
          \
          \ | highlight clear SignifySignAdd
          \ | highlight clear SignifySignChange
          \ | highlight clear SignifySignDelete
          \ | call s:hi('SignifySignAdd', 11, "")
          \ | call s:hi('SignifySignChange', 13, "")
          \ | call s:hi('SignifySignDelete', 8, "")
          \
          \ | highlight link LspReferenceText Visual
          \ | highlight link LspReferenceRead Visual
          \ | highlight link LspReferenceWrite Visual
          \
          \ | call s:hi('DiagnosticSignError', 8, "", "bold")
          \ | highlight! DiagnosticSignError guifg=Red
          \ | call s:hi('DiagnosticSignWarn', 10, "", "bold")
          \ | highlight! DiagnosticSignWarn guifg=Yellow
          \ | call s:hi('DiagnosticSignHint', 13, "", "bold")
          \ | call s:hi('DiagnosticSignInfo', 13, "", "bold")
          \
          \ | highlight link TelescopeMatching Special
          \ | call s:hi('TelescopeMatching', 14, "", "bold")
          \ | highlight link TelescopeResultsNormal Comment
          \ | highlight link TelescopeTitle TelescopeMatching
          \ | highlight link TelescopeBorder FloatBorder
          \
          \ | highlight! clear PmenuSel
          \ | call s:hi('PmenuSel', "", 2, "bold")
          \
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
          \ | call s:hi('Yanked', "", 2)
          \
          \ | call s:hi('StatusLinePrimary', 7, 2, "bold")
          \ | call s:hi('StatusLineSecondary', 7, 2)
          \ | call s:hi('StatusLineNeutral', 12, 1)
          \ | call s:hi('StatusLineIndicatorNeutral', 14, 0, "bold")
          \ | call s:hi('StatusLineIndicatorWarning', 9, 0, "bold")
          \ | call s:hi('StatusLineIndicatorError', 8, 0, "bold")
          \ | call s:hi('StatusLineIndicatorSuccess', 11, 0)
          \
          \ | call s:hi('WinbarBgActive', 14, 2)
          \ | call s:hi('WinbarBgInactive', 14, 1)
          \ | call s:hi('WinbarFgActive', 12, "", "bold")
          \ | call s:hi('WinbarFgInactive', 1, "")

    " }}}

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
" Statusline && Winbar {{{

" Always show the status line
set laststatus=2

" Global status line when available
if has('nvim-0.7.0')
  set laststatus=3
  set fillchars+=vert:\│
endif

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
nnoremap <leader>tw :set wrap!<CR>

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
cnoreabbrev bd BQ

" Insert a Shebang
" https://github.com/junegunn/dotfiles/blob/master/vimrc#L567
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" }}}
