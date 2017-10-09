""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 aesthetics                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" stop the annoyting autojoin line
set textwidth=0
" syntax highlighting
syntax on
" column when in insert mode
autocmd InsertEnter * silent! set cursorcolumn
autocmd InsertLeave * silent! set nocursorcolumn
" color scheme tweaks
" color scheme stuff located in the plugins file, so that it isn't set before 
" the schemes load
"cursor underlining
set cursorline
" highlight when searching
set hlsearch incsearch
nohl
" relative numbers
set rnu
" absolute number line (with relative displays both) 
set nu
:augroup numberFocus
:  autocmd!
:  autocmd WinEnter * set number
:  autocmd WinEnter * set relativenumber
:  autocmd WinLeave * set nonumber
:  autocmd WinLeave * set norelativenumber
:augroup END
" let &colorcolumn=join(range(81,999),",")
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Functionality                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tags 
set tag+=./.michaelSoft/tags
" don't wrap text
set nowrap
" persistent undos
set undofile
set undodir=~/.vimUndos/
" fix netrw E command
command! E Explore
"  necesssary for delimitmate " backspace
set backspace=indent,eol,start
" no swap files
set noswapfile
set breakindent
let mapleader="\<Space>"
"setting initial fold methods
set foldmethod=indent
set foldlevel=99
let &fdn=2
"spell checking
setlocal spelllang=en_us
" case sensitivity while searching
set ignorecase
set smartcase
filetype plugin indent on
let g:netrw_altv = 1
"set path on project open
set path=$PWD/**
" show exiting tab with 4 spaces width
set tabstop=2
" " when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert spaces
set expandtab
"Netrw override to allow relative numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" status line config
set laststatus=2
" Fix for delay after pressing escape
set timeoutlen=1000 ttimeoutlen=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  options                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" control-p ignore folders
set wildignore+=*/build/*,*/node_modules/*,*/test/*,*/vendor/*,*/tests/*,*/web/*,*/app/cache/*
" omni complete 
set completeopt-=noselect
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Miscellaneous                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.apidoc    set filetype=apidoc
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
