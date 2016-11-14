" .vimrc for jadengis
" Configures vim for maximum power

" Set vim path for file searching
set path=.,,**

" Set filetype plugin on to allow for file specific modes
filetype plugin on

" make features
set makeprg=make
map <leader>m :make<CR>

" Turn on Autocmd for quickfix windows
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Colour
colorscheme delek " Leave off until I understand how to add colorschemes
syntax on

" Spaces & Tabs
set expandtab " Tabs are spaces
set tabstop=4 " Input tab length
set softtabstop=4 " Edit time tab length
set shiftwidth=4 " indenting is 4 spaces

" Backspace
set backspace=2

" UI config
filetype indent on " Loads langauge specific indentation
set number " Show line numbers
set ruler "Show row and column numbers
set showcmd " Displays last command
set cursorline " Highlights current line
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
