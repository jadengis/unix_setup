".vimrc for jadengis
" Configures vim for maximum power

" Set vim path for file searching
set path=.,,**

" Rule for find my ctags tags file
set tags+=tags;~

" make features
set makeprg=make
map <leader>m :make<CR>

" Turn on Autocmd for quickfix windows
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Open files to last position
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let c_no_curly_error=1

" Not vi compatible
set nocompatible

" Spaces & Tabs
"set expandtab " Tabs are spaces
set tabstop=2 " Input tab length
set softtabstop=2 " Edit time tab length
set shiftwidth=2 " indenting is 4 spaces
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Backspace
set backspace=2

" UI config
filetype indent on " Loads langauge specific indentation
set number " Show line numbers
set ruler "Show row and column numbers
set showcmd " Displays last command
"set cursorline " Highlights current line
set wildmenu " Graphical menu for autocomplete
set wildmode=full
set lazyredraw " Redraws only when necessary
set showmatch " Highlights matching parantheses

" Searching
set incsearch " Search while typing
set hlsearch " Highlight search results

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Folding
set foldenable " Start folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

" Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" change windows more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Setup for Vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"
" Function
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'

" Appearance
Plugin 'jacoborus/tender.vim'
Plugin 'vim-airline/vim-airline'

" Language specific
Plugin 'fatih/vim-go'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'slashmili/alchemist.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

" Syntax highlighters
Plugin 'octol/vim-cpp-enhanced-highlight' 
Plugin 'tomlion/vim-solidity'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'posva/vim-vue'
Plugin 'uarun/vim-protobuf'
Plugin 'jparise/vim-graphql'
Plugin 'elixir-editors/vim-elixir'

" Code formatting
Plugin 'prettier/vim-prettier'

" All of your Plugins must be added before the following line
call vundle#end()

" Enable gui colours
" if (has("termguicolors"))
" set termguicolors
" endif

" Theming for vim
syntax enable
colorscheme tender
let g:airline_theme = 'tender'

" Set filetype plugin on to allow for file specific modes
filetype plugin indent on

" NERDTree customizations
" Settings for nerdtree to pop
"autocmd VimEnter * NERDTree

" Jump to the main window.
autocmd VimEnter * wincmd p
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Go setup
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  

"JavaScript Highlighter setup
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

" Dart plugin setup
let dart_style_guide = 2
let dart_format_on_save = 1

" Prettier setup
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" CtrlP setup
let g:ctrlp_working_path_mode = 'ra'

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = ['elixir']

" FileType customizations
autocmd FileType proto setlocal tabstop=4 shiftwidth=4 softtabstop=4
