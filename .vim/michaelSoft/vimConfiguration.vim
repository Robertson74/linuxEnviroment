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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Functionality                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3 lines up and down on complete menu
inoremap <expr> <C-J> pumvisible() ? "\<C-N>\<C-N>\<C-N>" : "\<C-J>"
inoremap <expr> <C-K> pumvisible() ? "\<C-P>\<C-P>\<C-P>" : "\<C-K>"
inoremap \<c-v>: "\<C-x>\<C-O>"
" don't redraw between macro steps
set lazyredraw
" command line completion
set wildmenu
" show command line completion options
set wildignorecase
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
"                                Text Objects                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inside caps
onoremap ic :<C-U>:call HighlightCapsTextObject()<CR>
" to caps
onoremap c :<C-U>execute "norm! /\\u\rv`'"<CR>
onoremap C :<C-U>execute "norm! ?\\u\rv`'"<CR>
" onoremap ic :<C-U>execute "norm! ?\\(\\l\\zs\\u\\\|\\u\\\|^\\\|\\W\\zs\\w\\)\r/\\(\\w\\ze\\u\\\|\\w\\ze$\\\|\\w\\ze\\W\\)\r:nohl\rv`'"<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Options                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" control-p ignore folders
set wildignore+=*/build/*,*/node_modules/*,*/test/*,*/vendor/*,*/tests/*,*/web/*,*/app/cache/*,*/dist/*
" omni complete 
set completeopt=longest,menuone,noinsert,noselect,preview
set wildmode=longest:full,full
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Miscellaneous                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.apidoc    set filetype=apidoc
" au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
