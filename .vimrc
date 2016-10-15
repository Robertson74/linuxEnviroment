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
" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

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

nnoremap <Leader>H :call BrowseDoc()
" tagbar settings
nnoremap <Leader>T :TagbarToggle<CR>
" grundo mapping
nnoremap <Leader>U :GundoToggle<CR>
" gitgutter  mapping
nnoremap <Leader>G :GitGutterToggle<CR>
" indent  mapping
nnoremap <Leader>I :IndentGuidesToggle<CR>





"""""""""""""""""""""""""CUSTOM ADDITIONS
"""""""""""""""""""""""""rebinds
" easy help access and zoom
nnoremap <Leader>h :tab help 
" zoom a split/ close and return
nnoremap <Leader>z mb:tabnew %<cr>'bzz
nnoremap <Leader>Z mv:tabprevious<CR>'vzz:+tabclose<CR>
" find trailing spaces
nnoremap <Leader>t /\S\zs\s\+$<cr>
"turn off highlighting
nnoremap <Leader>n :noh<cr>
" vim edit rc and resource
nnoremap <Leader>vvv :tabnew ~/.vimrc<cr>
nnoremap <Leader>vs :source ~/.vimrc<CR>
" Install vim plugins
nnoremap <Leader>vp :PluginInstall<CR>
" toggle spelling
nnoremap <Leader>s :set spell!<CR>
" rerun ctags
nnoremap <Leader>ccc :!ctags -R --exclude=.git<CR>

"""""""""""""""""""""""""scripts
" Rotate parameters in parenthesis
""""""" (param(2), param(1), param[3])
nnoremap <Leader>rk :execute "normal! va(<C-v><esc>dF,%pa, <C-v><esc>F,;xxh%"<CR>
nnoremap <Leader>rj :execute "normal! va(<C-v><esc>%ldf,h%i, <C-v><esc>px%lxh%"<CR>
""""""" Add change inside parenths from cursor outside parenths
nnoremap ci( %ci)
nnoremap ci) F(ci)
"this is a test (test 123) anothere test (here);
nnoremap ci[ %ci[
nnoremap ci] F[ci[
"this is a test [test 123] anothere test [here];
nnoremap ci{ %ci{
nnoremap ci} F{ci}
"this is a test {test 123} another test {here};
nnoremap ci< f<ci>
nnoremap ci> F<ci>
"this is a test <test 123> this is a test <test 123>;
""""""" flip true false
function! FlipBoolean()
    if expand('<cword>') == 'true'
        :execute "normal! ciwfalse"
    elseif expand('<cword>') == 'false'
        :execute "normal! ciwtrue"
    elseif expand('<cword>') == '1'
        :execute "normal! ciw0"
    elseif expand('<cword>') == '0'
        :execute "normal! ciw1"
    else
        :echo "Not a Boolean"
    endif
endfunction
nnoremap <Leader>b :call FlipBoolean()<CR>
"true 1 0 false

"""""""""""""""""""""""""TESTING AREA
" function! GuiTabLabel()
"   let label = ''
"   let bufnrlist = tabpagebuflist(v:lnum)

"   " Add '+' if one of the buffers in the tab page is modified
"   for bufnr in bufnrlist
"     if getbufvar(bufnr, "&modified")
"       let label = '+'
"       break
"     endif
"   endfor

"   " Append the number of windows in the tab page if more than one
"   let wincount = tabpagewinnr(v:lnum, '$')
"   if wincount > 1
"     let label .= wincount
"   endif
"   if label != ''
"     let label .= ' '
"   endif

"   " Append the buffer name
"   return label . bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
" endfunction

" set guitablabel=%{GuiTabLabel()}
" <jdkasdkfj>
