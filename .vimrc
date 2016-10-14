"new install 
"Install git
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"PluginInstall
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
" File information display
Plugin 'Shougo/unite.vim'
" Debugger
Plugin 'joonty/vdebug'
"Git wrapper
Plugin 'tpope/vim-fugitive'
" Adds functionality to change surrounding characters
Plugin 'tpope/vim-surround'
" Twig syntax
Plugin 'evidens/vim-twig'
" Makes Async available
Plugin 'Shougo/vimproc.vim'
" Star wars goodness
Plugin 'shinokada/SWTC.vim'
" Syntax error highlighting
Plugin 'scrooloose/syntastic'
" auto complete
Plugin 'Valloric/YouCompleteMe'
" tag browser
Plugin 'majutsushi/tagbar'
" extended tag matching with ^
Plugin 'tmhedberg/matchit'
" undo/redo tree structure
Plugin 'sjl/gundo.vim'
" easy comments
Plugin 'tpope/vim-commentary'
" color schemes
Plugin 'altercation/vim-colors-solarized'
" status bar plugin
Plugin 'vim-airline/vim-airline'
" status bar plugin
Plugin 'tpope/vim-repeat.git'
" html quick develop
Plugin 'mattn/emmet-vim'
" html5 autocomplete
Plugin 'othree/html5.vim'
" autocomplete for quotes and the like
Plugin 'raimondi/delimitmate'
" git gutter
Plugin 'airblade/vim-gitgutter'
" more readable indents
Plugin 'nathanaelkane/vim-indent-guides'

" END OF PLUGINS
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
filetype plugin indent on
"highlight when searching
set hlsearch incsearch
let g:netrw_altv = 1
" relative numbers
set rnu
" absolute numberline (with relative displays both)
set nu
"set path on project open
set path=$PWD/**
" show eisting tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" enables auto complete on php
" " autocmd  FileType  php set omnifunc=phpcomplete#CompletePHP
" vdebug with xdebug options
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9000
let g:vdebug_options["break_on_open"] = 1
let g:vdebug_options["path_maps"] = {"/var/www/html/repos/": "/Users/mrobertson/vms/dev/repos/"}
let g:vdebug_options['server'] = ""
" gui configuration
colorscheme darth
" let g:solarized_termcolors=256
" syntax enable
" set background=light
" colorscheme solarized
"Netrw override to allow relative numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" status line config
set laststatus=2
" set statusline=%t
" set statusline+=%h
" set statusline+=%m
" set statusline+=%r
" set statusline+=%y
" set statusline+=%=
" set statusline+=%c,
" set statusline+=%l/%L
" set statusline+=\ %P
"Syntastic recommended default settings
" set statusline+=%#warningmsg#
" let g:statline_sytastic =0
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
command! E Explore
" Fix for delay after pressing escape
set timeoutlen=1000 ttimeoutlen=0
" F7 opens documentation for php/perl function under cursor
function! BrowseDoc()
    if b:current_syntax == "php"
        ! open "http://php.net/manual-lookup.php?pattern=<cword>&scope=quickref"
    elseif b:current_syntax == "perl"
        ! open http://perldoc.perl.org/search.html?q=<cword>
    elseif b:current_syntax == "cpp"
        let cname = tolower(cword);
        ! open file:///opt/qt-4.3.4/doc/html/<cname>
    else
        return
    endif
endfunction

"""""""""""""""""""""""""Plugin Bindings
" indent line settings
nnoremap <Leader>h :call BrowseDoc()
" tagbar settings
nnoremap <Leader>t :TagbarToggle<CR>
" grundo mapping
nnoremap <Leader>u :GundoToggle<CR>
" gitgutter  mapping
nnoremap <Leader>g :GitGutterToggle<CR>
" indent  mapping
nnoremap <Leader>i :IndentGuidesToggle<CR>





"""""""""""""""""""""""""CUSTOM ADDITIONS
"""""""""""""""""""""""""rebinds
"""""""""""""""""""""""""scripts
" Rotate parameters in parenthesis
""""""" (param(2), param(1), param[3])
nnoremap <Leader>Rk :execute "normal! va(<C-v><esc>dF,%pa, <C-v><esc>F,;xxh%"<CR>
nnoremap <Leader>Rj :execute "normal! va(<C-v><esc>%ldf,h%i, <C-v><esc>px%lxh%"<CR>
""""""" Add change inside parenths from cursor outside parenths
nnoremap ci( :execute "normal! f(ci("<CR>a
"this is a test (test 123);
nnoremap ci[ :execute "normal! f[ci["<CR>a
"this is a test [test 123];
nnoremap ci{ :execute "normal! f{ci{"<CR>a
"this is a test {test 123};

""""""" expand parameters for easy checking
