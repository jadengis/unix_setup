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

" Colour
colorscheme delek " Leave off until I understand how to add colorschemes
syntax on

let c_no_curly_error=1

" Spaces & Tabs
"set expandtab " Tabs are spaces
set tabstop=2 " Input tab length
set softtabstop=2 " Edit time tab length
set shiftwidth=2 " indenting is 4 spaces

" Backspace
set backspace=2

" UI config
filetype indent on " Loads langauge specific indentation
set number " Show line numbers
set ruler "Show row and column numbers
set showcmd " Displays last command
"set cursorline " Highlights current line
set wildmenu " Graphical menu for autocomplete
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
Plugin 'Valloric/YouCompleteMe'

" Plugin for golang
Plugin 'fatih/vim-go'

" Deps for vim-delve
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'

" Plugin for delve
Plugin 'sebdah/vim-delve'

" C++14 syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight' 

" Solidity syntax highlighting 
Plugin 'tomlion/vim-solidity'

" Directory tree plugin
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()

" Set filetype plugin on to allow for file specific modes
filetype plugin indent on

" YouCompleteMe remaps
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>jg :YcmCompleter GoTo<CR> 
nnoremap <leader>jr :YcmCompleter GoToReferences<CR> 
nnoremap <leader>jt :YcmCompleter GetType<CR> 
nnoremap <leader>jp :YcmCompleter GetParent<CR> 

" Settings for nerdtree to pop
autocmd VimEnter * NERDTree
" Jump to the main window.
autocmd VimEnter * wincmd p
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
