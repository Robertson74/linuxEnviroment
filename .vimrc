"new install
"PluginInstall
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"let Vundle manage Vundle, required
" Better text objects
Plugin 'wellle/targets.vim'
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
" File information display
Plugin 'Shougo/unite.vim'
" PHP Debugger
Plugin 'joonty/vdebug'
"Git wrapper
Plugin 'tpope/vim-fugitive'
" Adds functionality to change surrounding characters
Plugin 'tpope/vim-surround'
" Twig syntax
Plugin 'evidens/vim-twig'
" Makes Async available
Plugin 'Shougo/vimproc.vim'
" Syntax error highlighting
Plugin 'scrooloose/syntastic'
" auto complete
Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete.vim'
" tag browser
Plugin 'majutsushi/tagbar'
" extended tag matching with ^
Plugin 'tmhedberg/matchit'
" undo/redo tree structure
Plugin 'sjl/gundo.vim'
" easy comments
Plugin 'tpope/vim-commentary'
" color schemes
Plugin 'flazz/vim-colorschemes'
" status bar plugin
Plugin 'vim-airline/vim-airline'
" status bar plugin
Plugin 'tpope/vim-repeat.git'
" html quick develop
Plugin 'mattn/emmet-vim'
" html5 autocomplete
Plugin 'othree/html5.vim'
" autocomplete for quotes and the like
" Plugin 'raimondi/delimitmate'
" git gutter
Plugin 'airblade/vim-gitgutter'
" more readable indents
Plugin 'nathanaelkane/vim-indent-guides'
" Snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" type script syntax highlighting
Plugin 'leafgarland/typescript-vim'
" javascript debuggin
Plugin 'sidorares/node-vim-debugger'
" php autocomplete
" Plugin 'm2mdas/phpcomplete-extended'

" END OF PLUGINS
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-configuration
" Netrw top level tree set to dir where vim was opened
" execute "normal! :silent Ntree" $PWD
" Netrw list style to long tree form
let g:netrw_liststyle= 3
"cursor underlining
set cursorline
let mapleader="\<Space>"
"turn off .swp files
"set backupdir=~/.vim/backup//
"set directory=~/.vim/swap//
"set undodir=~/.vim/undo//
"setting initial fold methods
set foldmethod=indent
set foldlevel=1
set foldnestmax=1
"spell checking
setlocal spelllang=en_us
" case sensitivity while searching
set ignorecase
set smartcase
" syntax highlighting
syntax on
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
" enables auto complete on php
" autocmd  FileType  php set omnifunc=phpcomplete#CompletePHP
"Netrw override to allow relative numbers
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
" status line config
set laststatus=2
" Fix for delay after pressing escape
set timeoutlen=1000 ttimeoutlen=0
" gui configuration
colorscheme sand
" Line number colors
highlight LineNr ctermfg=red
highlight CursorLineNr ctermbg=magenta
highlight CursorLineNr ctermfg=green

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-autocommands
" show numbers only on focused pane
:augroup numberFocus
:  autocmd!
:  autocmd WinEnter * set number
:  autocmd WinEnter * set relativenumber
:  autocmd WinLeave * set nonumber
:  autocmd WinLeave * set norelativenumber
:augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-plugin configuration
" php extended config 
let g:phpcomplete_index_composer_command = "composer"
" Syntastic typescript linter
let g:syntastic_typescript_checkers = ['tslint']
" Syntastic recommended default settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
command! E Explore

" vdebug with xdebug options
let g:vdebug_options = {}
let g:vdebug_options["debug_file"] = "~/vdebug.log"
let g:vdebug_options["debug_file_level"] = 2
let g:vdebug_options["port"] = 9000
let g:vdebug_options["break_on_open"] = 1
" let g:vdebug_options["path_maps"] = {"/var/www/html/repos/" : "/Users/mrobertson/vms/dev/repos/"}
" let g:vdebug_options['server'] = ""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-plugin calls
nnoremap <Leader>H :call BrowseDoc()
" tagbar settings
nnoremap <Leader>T :TagbarToggle<CR>
" grundo mapping
nnoremap <Leader>U :GundoToggle<CR>
" gitgutter  mapping
nnoremap <Leader>GG :GitGutterToggle<CR>
" git status
nnoremap <Leader>GS :Gstatus<CR>
" git commit
nnoremap <Leader>GC :Gcommit<CR>
" indent  mapping
nnoremap <Leader>I :IndentGuidesToggle<CR>
" toggle syntax checking
nnoremap <Leader>ST :SyntasticToggleMode<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-file short cuts
nnoremap <Leader>epar :vsp ./app/config/parameters.yml<CR>
nnoremap <Leader>ete :vsp ./src/APIBundle/Controller/TestingController.php<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-quick commands
" toggle format pasting
nnoremap <Leader>pas :set paste!<CR>
" pane/tab navigatoin
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-l> <C-w>l
nnoremap zh gT
nnoremap zl gt
"Obscure/UnObscure doc
nnoremap <Leader>hid :normal! mmggg?G`m<CR>
" Search/edit/find reference files
nnoremap <Leader>gref :grep -R "" ~/.vim/michaelSoft/references <left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <Leader>eref :tabnew ~/.vim/michaelSoft/references<CR>
nnoremap <Leader>fref :find ~/.vim/michaelSoft/references/*
" swap comments quickly
nnoremap <Leader>sco :+1Commentary<CR>:Commentary<CR>
nnoremap <Leader>cl :set cursorcolumn!<CR>
nnoremap <Leader>ul :set cursorline!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>com :windo set diff!<CR>:windo set diffopt=iwhite<CR>:windo set scrollbind!<CR>
nnoremap <Leader>scr :windo set scrollbind!<CR>
nnoremap <Leader>hl :tab help 
nnoremap <Leader>f. :find ./**/
nnoremap <Leader>fs :find ./src/**/
nnoremap <Leader>fm :find ./server/**/
nnoremap <Leader>g. :grep -R "" ./<left><left><left><left>
nnoremap <Leader>gs :grep -R "" ./src<left><left><left><left><left><left><left>
nnoremap <Leader>gm :grep -R "" ./server<left><left><left><left><left><left><left><left><left><left>
nnoremap <Leader>sw :w !sudo tee %<cr>
" zoom a split/ close and return
" nnoremap <Leader>z mb:tabnew %<cr>'bzz
" nnoremap <Leader>Z mv:tabprevious<CR>'vzz:+tabclose<CR>
" find trailing spaces
nnoremap <Leader>ts /\S\zs\s\+$<cr>
"turn off highlighting
nnoremap <Leader>no :noh<CR>
" vim edit rc and resource
nnoremap <Leader>vup :!cd ~;git add .vimrc;git commit -m "updating";git push github master;<CR>
nnoremap <Leader>vsy :!cd ~;git pull github master;<CR>
nnoremap <Leader>vvv :tabnew ~/.vimrc<CR>
" update vimrc to github
nnoremap <Leader>vup :!cd ~;git add .vimrc;git commit -m "updating";git push github master;<CR>
" Reload vimrc
nnoremap <Leader>vs :source $MYVIMRC<CR>

" Install vim plugins
nnoremap <Leader>vp :PluginInstall<CR>
nnoremap <Leader>vup :!cd ~;git add .vimrc;git add .vim/michaelSoft/*;git commit -m "updating";git push github master;<CR>
nnoremap <Leader>vsy :!cd ~;git pull github master;<CR>
nnoremap <Leader>vvv :tabnew ~/.vimrc<CR>
" Reload vimrc
nnoremap <Leader>vso :source $MYVIMRC<CR>
" Install/Updating vim plugins
nnoremap <Leader>PI :PluginInstall<CR>
nnoremap <Leader>PU :PluginUpdate<CR>
" toggle spelling
nnoremap <Leader>sp :set spell!<CR>
" rerun ctags
nnoremap <Leader>ct :!ctags -R --exclude=.git<CR>
" location list commands
nnoremap <Leader>lo :lopen<CR>
nnoremap <Leader>lc :lcl<CR>
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprevious<CR>
" quick fix commands
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cc :ccl<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprevious<CR>
" Count search terms
nnoremap <Leader>sc :exe '%s/'.@/.'//gn'<CR>
" Turn on off numbers
nnoremap <Leader>nu :set nu! rnu!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-script calls
nnoremap <Leader>tem :call PlaceTempArea()<CR>
nnoremap <Leader>rtem :call RemoveTempArea()<CR>
nnoremap <Leader>csl :call SearchContextually("local")<CR>
nnoremap <Leader>csg :call SearchContextually("global")<CR>
nnoremap <Leader>nav :call NavigationBarToggle()<CR>
nnoremap <Leader>st :call PlaceTempSign()<CR>
nnoremap <Leader>sr :call RemoveTempSign()<CR>
" Zooming
nnoremap <Leader>z :call ToggleZoom()<CR>
" Turn on off numbers
nnoremap <Leader>ya :call YankAboveAndPaste()<CR>
nnoremap <Leader>yma :call YankMultipleAboveAndPaste()<CR>
nnoremap <Leader>yb :call YankBelowAndPaste()<CR>
nnoremap <Leader>ymb :call YankMultipleBelowAndPaste()<CR>
nnoremap <Leader>sp :set spell!<CR>
" go to thirds of line
nnoremap gh :call GoToFirstThirdOfLine()<CR>
nnoremap gl :call GoToSecondThirdOfLine()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-scripts
function! RemoveTempArea()
  :execute "silent normal! gg/#TEMP AREA\<CR>V/#END TEMP\<CR>x"
  :execute "silent normal! gg/#TEMP AREA\<CR>V/#END TEMP\<CR>x"
  :execute "silent normal! gg/#TEMP AREA\<CR>V/#END TEMP\<CR>x"
  :execute "silent normal! gg/#TEMP AREA\<CR>V/#END TEMP\<CR>x"
  :execute "silent normal! gg/#TEMP AREA\<CR>V/#END TEMP\<CR>x"
endfunction
function! PlaceTempArea()
  :execute "normal! o\<esc>a#\<esc>30.\<esc>ATEMP AREA\<esc>"
  :Commentary
  :execute "normal! o\<esc>a#\<esc>30.\<esc>AEND TEMP\<esc>"
  :Commentary
endfunction
" Zooming
let g:zoomedStatus = "false"
function! ToggleZoom()
  if(g:zoomedStatus == "false")
    :mark b|:tabnew %|normal! 'bzz
    call ZoomContext()
    let g:zoomedStatus = "true"
  else
    :mark v|:tabprevious|:normal! 'vzz
    :+tabclose
    let g:zoomedStatus = "false"
  endif
endfunction
" yank a line below or above and paste below
function! YankAboveAndPaste()
    :execute ":let g:yankLine = input('Line below to yank: ')"
    :execute "-".g:yankLine."y|normal!p"
endfunction
" yank multipl lines below or above and paste below
function! YankMultipleAboveAndPaste()
    :execute ":let g:yankLineStart = input('Line below to start yanking: ')"
    :execute ":let g:yankLineEnd = input('Line below to end yanking: ')"
    :execute "-".g:yankLineStart.",-".g:yankLineEnd."y|normal!p"
endfunction
" yank a line below or above and paste below
function! YankBelowAndPaste()
    :execute ":let g:yankLine = input('Line below to yank: ')"
    :execute "+".g:yankLine."y|normal!p"
endfunction
" yank multipl lines below or above and paste below
function! YankMultipleBelowAndPaste()
    :execute ":let g:yankLineStart = input('Line below to start yanking: ')"
    :execute ":let g:yankLineEnd = input('Line below to end yanking: ')"
    :execute "+".g:yankLineStart.",+".g:yankLineEnd."y|normal!p"
endfunction
"go to first/second third of the line, for easier f and t commands on long lines
function! GoToFirstThirdOfLine()
    :execute "normal! $"
    :let endOfLine = col(".")
    :cal cursor(line("."), endOfLine/3)
endfunction

function! GoToSecondThirdOfLine()
    :execute "normal! $"
    :let endOfLine = col(".")
    :cal cursor(line("."), (endOfLine/3)*2)
endfunction
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
nnoremap <Leader>!c :!code %<CR>
"this is a test <test 123> this is a test <test 123>;
""""""" open doc in code
nnoremap <Leader>!c :!code %<CR>
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
""""""" Call up Node Debugger
let debugLaunchFile = "build/server.js"
let debugFile = "none"
let debugWord = "none"
let debugLine = "none"
function! SetDebugLaunchFile()
    :execute ":let g:debugLaunchFile = input('Enter Debug File: ')"
endfunction
function! SetDebugWord()
    :execute ":let g:debugWord = expand('<cword>')"
endfunction
function! SetDebugLine()
    :execute ":let g:debugLine = line('.')"
endfunction
function! SetDebugFile()
    if match(@%, ".ts") > 0 
        let g:debugFile = substitute(expand('%:t'), '.ts', '.js', '')
    else
        let g:debugFile = expand('%:t')
    endif
endfunction
function! NodeDebug()
    :execute "!expect ~/.vim/michaelSoft/JSDebug/JSDebug.sh ".@%." ".g:debugLine." ".g:debugWord." ".g:debugLaunchFile
endfunction
function! NodeDebugMon()
    :execute "!expect ~/.vim/michaelSoft/JSDebug/JSDebugMon.sh ".g:debugFile." ".g:debugLine." ".g:debugWord
endfunction
nnoremap <Leader>df :call SetDebugLaunchFile()<CR>
nnoremap <Leader>dw :call SetDebugWord()<CR>
nnoremap <Leader>dl :call SetDebugLine()<CR>:call SetDebugFile()<CR>
" nnoremap <Leader>dd :call NodeDebug()<CR>
nnoremap <Leader>dd :call NodeDebugMon()<CR>
nnoremap <Leader>da :call SetDebugWord()<CR>:call SetDebugLine()<CR>:call SetDebugFile()<CR>:call NodeDebugMon()<CR>

""""""" Place and unplace temp signs for reference
sign define temp linehl=Error text=--
let g:tempSignLine = 99
function! PlaceTempSign()
  :exec "sign place ".g:tempSignLine." line=".line('.')." name=temp file=".expand('%:p')
  :let g:tempSignLine = g:tempSignLine - 1
endfunction
function! RemoveTempSign()
  :exec "sign unplace"
endfunction

""""""" Nav bar
:let g:defautlNavWidth = 40
function! NavigationBarToggle()
  if exists("t:navActive") == 0
    :let t:navActive=0
  endif
  if exists("t:navBuffer") == 0
    :let t:navBuffer=0
  endif
  if t:navActive==0
    :let @/ = " ".expand('%:t')."\\?.$"
    :let g:netrw_liststyle = 3
    :Vex
    :exec "normal! \<C-W>H"
    :exe "vertical resize ".g:defautlNavWidth
    :let t:navBuffer = bufnr('%')
    :let t:navActive = 1
    :normal! n
    :.
    :exec "normal! :noh \<CR>"
    :set wfw
  elseif t:navActive==1
    :let t:navActive = 0
    :silent windo :call CheckIfBufferIsNav()
    if t:navActive==1
      :exe "silent bd ".t:navBuffer
      :let t:navActive = 0
    else
      :call NavigationBarToggle()
    endif
  endif
endfunction

function! CheckIfBufferIsNav()
  if bufnr('%') == t:navBuffer 
    :let t:navActive=1 
  endif
endfunction

""""""" Context Searching
:let g:searchContextDefault = 0
function! SearchContextually(searchType)
  :let b:searchTerm = input('Search for: ')
  if !empty(b:searchTerm)
    :let b:searchContext = input('Context lines around search: ')
    :normal! mm
    if empty(b:searchContext)
      :let b:searchContext = g:searchContextDefault
    endif
    if a:searchType == "local"
      :execute "silent lgrep \"".b:searchTerm."\" % -A ".b:searchContext." -B ".b:searchContext
    endif
    if a:searchType == "global"
      :let a:searchDir = input('DIR to search: ')
      if empty(a:searchDir)
        :let a:searchDir = "./"
      endif
      :execute "silent grep -R \"".b:searchTerm."\" ".a:searchDir." -A ".b:searchContext." -B ".b:searchContext
    endif
    :normal! 'm
    :let @/ = b:searchTerm
    :redraw!
    if a:searchType == "local"
      :lopen
    elseif a:searchType == "global"
      :echom a:searchType
      :copen
    endif
    :resize 30
    :execute ":call search(@/)"
    :execute ":call matchadd('Search', @/)"
    :call PlaceSignAtPatternMatch("contextMarker", "^|| --")
  endif
endfunction
  
:sign define contextMarker linehl=Error
function! PlaceSignAtPatternMatch(signName, contextPattern)
  :let a:lineNumber = 1
  while a:lineNumber <= line('$') 
    if match(getline(a:lineNumber), a:contextPattern) != -1
      :exec ":sign place ".a:lineNumber." line=".a:lineNumber." name=".a:signName." buffer=".bufnr('%')
    endif
    :let a:lineNumber = a:lineNumber + 1
  endwhile
endfunction

function! ZoomContext()
  :sp
  :e ~/.vim/michaelSoft/zoomwindows/topbar
  :execute "normal! \<C-W>k"
  :resize 1
  :set nornu nonu
  :set wfh
  :execute "normal!\<C-W>p"
  " :sp
  " :execute "normal! \<C-W>j"
  " :e ~/.vim/michaelSoft/zoomwindows/topbar
  " :resize 1
  " :set nornu nonu
  " :set wfh
  " :execute "normal!\<C-W>p"
  :vsp
  :execute "normal! \<C-W>h"
  :e ~/.vim/michaelSoft/zoomwindows/sidebar
  :vertical resize 3
  :set nornu nonu
  :set wfw
  :execute "normal!\<C-W>p"
  :vsp
  :execute "normal! \<C-W>l"
  :e ~/.vim/michaelSoft/zoomwindows/sidebar
  :vertical resize 3
  :set nornu nonu
  :set wfw
  :execute "normal!\<C-W>p"
endfunction

nnoremap <Leader>ish :tabnew ~/.vim/michaelSoft/ish/ish.txt\|set nornu nonu\|silent sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|:q!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-TODO
"---update zoom funciton to allow multile zoom instances with a b:zoom variable instead of a g:zoom variable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-TESTING AREA

" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%120v.\+/



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-set up latest vim plus vundle
"sudo apt-install git
"git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" # Create the directories you need
" sudo mkdir -p /opt/local/bin
" # Download, compile, and install the latest Vim
" cd ~
" git clone https://github.com/vim/vim.git
" cd vim
" ./configure --prefix=/opt/local --with-features=huge --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu
" make
" sudo make install
" # Add the binary to your path, ahead of /usr/bin
" echo 'PATH=/opt/local/bin:$PATH' >> ~/.bash_profile
" # Reload bash_profile so the changes take effect in this window
" source ~/.bash_profile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-You complete me install
" # install youcompleteme
" cd ~
" mkdir ycm_build
" cd ycm_build
" cmake -G "Unix Makefiles" . /home/vagrant/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
" cmake --build . --target ycm_core --config Release
" cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/tern_runtime/
