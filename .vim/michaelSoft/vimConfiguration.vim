command! E Explore
" control-p ignore folders
set wildignore+=*/build/*,*/node_modules/*,*/test/*,*/vendor/*,*/tests/*,*/web/*
" omni complete 
set completeopt+=longest
" filetypes
au BufRead,BufNewFile *.apidoc    set filetype=apidoc
" stop the annoyting autojoin line
set textwidth=0
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType c setlocal omnifunc=ccomplete#Complete
" syntax highlighting
syntax on
" gui configuration
colorscheme landscape
" allow backspacing over start of 'insertmode'; necesssary for delimitmate " backspace
set backspace=indent,eol,start
" column when in insert mode
autocmd InsertEnter * silent! set cursorcolumn
autocmd InsertLeave * silent! set nocursorcolumn
" no swap files
set noswapfile
set breakindent
"cursor underlining
set cursorline
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
"highlight when searching
set hlsearch incsearch
:nohl
let g:netrw_altv = 1
" relative numbers
set rnu
" absolute number line (with relative displays both)
set nu
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
" Line number colors
" show numbers only on focused pane
:augroup numberFocus
:  autocmd!
:  autocmd WinEnter * set number
:  autocmd WinEnter * set relativenumber
:  autocmd WinLeave * set nonumber
:  autocmd WinLeave * set norelativenumber
:augroup END
