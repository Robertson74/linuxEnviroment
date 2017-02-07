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
set breakindent
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
" control p async
let g:user_command_async=1
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
" toggle modifiable 
nnoremap <Leader>mod :set modifiable!<CR>
" toggle format pasting
nnoremap <Leader>pas :set paste!<CR>
" pane/tab navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-l> <C-w>l
nnoremap <C-t> <C-w>t
nnoremap <C-b> <C-w>b
nnoremap <C-n> <C-w>p
nnoremap <C-x> :q<CR>
nnoremap zh gT
nnoremap zl gt
"Obscure/UN Obscure doc
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
nnoremap <Leader>hg :tab helpgrep 
nnoremap <Leader>f. :find ./**/*
nnoremap <Leader>fs :find ./src/**/*
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
nnoremap <Leader>vup :!cd ~;git add .vimrc && git commit -m "updating" && git push github master;<CR>
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
nnoremap <Leader>lo :lopen<CR><C-w>J
nnoremap <Leader>lc :lcl<CR>
nnoremap <Leader>ln :lnext<CR>
nnoremap <Leader>lp :lprevious<CR>
" quick fix commands
nnoremap <Leader>co  :copen<CR><C-w>J
nnoremap <Leader>cc :ccl<CR>
nnoremap <Leader>cn :cnext<CR>
nnoremap <Leader>cp :cprevious<CR>
" Count search terms
nnoremap <Leader>sc :exe '%s/'.@/.'//gn'<CR>
" Turn on off numbers
nnoremap <Leader>nu :set nu! rnu!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call script
nnoremap <Leader>mw :call MarkWindow()<CR>
nnoremap <Leader>mr :call UnMarkWindow()<CR>
nnoremap <Leader>mmo :call MoveWindowToTab()<CR>
nnoremap <Leader>rst :call RepetitiveLine()<CR>
nnoremap Q :silent call MoveToPreviousCap()<CR>
nnoremap <BAR> :silent call MoveToNextCap()<CR>
nnoremap dic :call DeleteInsideCaps()<CR>
nnoremap cic :call ChangeInsideCaps()<CR>
nnoremap dc :call DeleteToCap()<CR>
nnoremap cc :call ChangeToCap()<CR>
nnoremap <Leader>res :silent call ResizeWindow()<CR>
" Yank from adjacent buffers
nnoremap <Leader>y2l :call GetFromAdjacentLine('l', 2, 'Y')<CR>
nnoremap <Leader>y2h :call GetFromAdjacentLine('h', 2, 'Y')<CR>
nnoremap <Leader>y2k :call GetFromAdjacentLine('k', 2, 'Y')<CR>
nnoremap <Leader>y2j :call GetFromAdjacentLine('j', 2, 'Y')<CR>
nnoremap <Leader>m2l :call GetFromAdjacentLine('l', 2, 'dd')<CR>
nnoremap <Leader>m2h :call GetFromAdjacentLine('h', 2, 'dd')<CR>
nnoremap <Leader>m2k :call GetFromAdjacentLine('k', 2, 'dd')<CR>
nnoremap <Leader>m2j :call GetFromAdjacentLine('j', 2, 'dd')<CR>
nnoremap <Leader>ym2h :call GetMultipleFromAdjacentLine('h', 2, 'y')<CR>
nnoremap <Leader>ym2j :call GetMultipleFromAdjacentLine('j', 2, 'y')<CR>
nnoremap <Leader>ym2k :call GetMultipleFromAdjacentLine('k', 2, 'y')<CR>
nnoremap <Leader>ym2l :call GetMultipleFromAdjacentLine('l', 2, 'y')<CR>
nnoremap <Leader>mm2h :call GetMultipleFromAdjacentLine('h', 2, 'd')<CR>
nnoremap <Leader>mm2j :call GetMultipleFromAdjacentLine('j', 2, 'd')<CR>
nnoremap <Leader>mm2k :call GetMultipleFromAdjacentLine('k', 2, 'd')<CR>
nnoremap <Leader>mm2l :call GetMultipleFromAdjacentLine('l', 2, 'd')<CR>
nnoremap <Leader>yl :call GetFromAdjacentLine('l', 1, 'Y')<CR>
nnoremap <Leader>yh :call GetFromAdjacentLine('h', 1, 'Y')<CR>
nnoremap <Leader>yk :call GetFromAdjacentLine('k', 1, 'Y')<CR>
nnoremap <Leader>yj :call GetFromAdjacentLine('j', 1, 'Y')<CR>
nnoremap <Leader>ml :call GetFromAdjacentLine('l', 1, 'dd')<CR>
nnoremap <Leader>mh :call GetFromAdjacentLine('h', 1, 'dd')<CR>
nnoremap <Leader>mk :call GetFromAdjacentLine('k', 1, 'dd')<CR>
nnoremap <Leader>mj :call GetFromAdjacentLine('j', 1, 'dd')<CR>
nnoremap <Leader>ymh :call GetMultipleFromAdjacentLine('h', 1, 'y')<CR>
nnoremap <Leader>ymj :call GetMultipleFromAdjacentLine('j', 1, 'y')<CR>
nnoremap <Leader>ymk :call GetMultipleFromAdjacentLine('k', 1, 'y')<CR>
nnoremap <Leader>yml :call GetMultipleFromAdjacentLine('l', 1, 'y')<CR>
nnoremap <Leader>mmh :call GetMultipleFromAdjacentLine('h', 1, 'd')<CR>
nnoremap <Leader>mmj :call GetMultipleFromAdjacentLine('j', 1, 'd')<CR>
nnoremap <Leader>mmk :call GetMultipleFromAdjacentLine('k', 1, 'd')<CR>
nnoremap <Leader>mml :call GetMultipleFromAdjacentLine('l', 1, 'd')<CR>
" auto cammel case
nnoremap <Leader>cam :call CammelCaseVisual()<CR>
" nav bar
nnoremap <Leader>tn :call ToggleNav()<CR>
nnoremap <Leader>fn :call NewFocusNavBar()<CR>
" extend screen to another split
nnoremap <Leader>ext :call ExtendScreenDown()<CR>
" Temp areas
nnoremap <Leader>temp :call PlaceTempArea()<CR>
nnoremap <Leader>temr :call RemoveTempArea()<CR>
" Context Searching
nnoremap <Leader>csl :call SearchContextually("local")<CR>
nnoremap <Leader>csg :call SearchContextually("global")<CR>
" temporary line highlights
nnoremap <Leader>st :call PlaceTempSign()<CR>
nnoremap <Leader>sr :call RemoveTempSign()<CR>
" Zooming
nnoremap <Leader>z :silent call ToggleZoom()<CR>
" copying/moving from a distance
nnoremap <Leader>ma :call DeleteAboveAndPaste()<CR>
nnoremap <Leader>mma :call DeleteMultipleAboveAndPaste()<CR>
nnoremap <Leader>mb :call DeleteBelowAndPaste()<CR>
nnoremap <Leader>mmb :call DeleteMultipleBelowAndPaste()<CR>
nnoremap <Leader>ya :call YankAboveAndPaste()<CR>
nnoremap <Leader>yma :call YankMultipleAboveAndPaste()<CR>
nnoremap <Leader>yb :call YankBelowAndPaste()<CR>
nnoremap <Leader>ymb :call YankMultipleBelowAndPaste()<CR>
" Spelling
nnoremap <Leader>sp :set spell!<CR>
" go to thirds of line
nnoremap gh :call GoToFirstThirdOfLine()<CR>
nnoremap gl :call GoToSecondThirdOfLine()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-scripts
function! MarkWindow()
  :let g:markStartLine = line('.')
  :let g:markStartCol = col('.')
  :execute "normal! L:call PlaceTempSign()\<CR>"
  :let g:markLowLine = line('.')
  :execute "normal! H:call PlaceTempSign()\<CR>"
  :let g:markHighLine = line('.')
  :execute ":"g:markStartLine
  :execute "normal!".g:markStartCol."|"
  :let g:markWindow = win_getid()
  :let g:markBuffer = bufnr('%')
  :let g:markTab = tabpagenr()
endfunction
function! MoveWindowToTab()
  " if(!exists("g:markWindow"))
  "   :let g:markWindow = -1
  " endif
  if(g:markWindow == -1)
    :echom "No marked window"
    return
  endif
  if(win_getid() == g:markWindow)
    :echom "This is the marked window... can't move..."
    return
  endif
  if(tabpagenr() == g:markTab)
    :echom "Window is already on target tab"
    return
  endif
  :vsp
  :execute "buffer" g:markBuffer
  :let s:targetWindow = win_getid()
  :execute "call win_gotoid('".g:markWindow."')"
  :close
  :execute "call win_gotoid('".s:targetWindow."')"
  :call UnMarkWindow()
  :execute ":"g:markStartLine
  :execute "normal!".g:markStartCol."|"
endfunction
function! UnMarkWindow()
  :let g:markStartLine = line('.')
  :let g:markStartCol = col('.')
  :execute ":"g:markLowLine
  :call RemoveTempSign()
  :execute ":"g:markHighLine
  :call RemoveTempSign()
  :execute ":"g:markStartLine
  :execute "normal!".g:markStartCol."|"
  :redraw!
  :let g:markWindow = -1
endfunction
" repetitve lines with replaceable variables
function! RepetitiveLine()
let s:template = input('Line template (",./" changes): ')
if(empty(s:template))
  return
endif
let s:repeatCount = input('Number of repetitions (c for continous): ')
if(empty(s:repeatCount))
  return
endif
let s:iteration = 0
let s:startLine=line('.')
while (s:iteration < s:repeatCount)
  :put =s:template
  let s:iteration+=1
endwhile
let s:endLine=line('.')
try
  let s:substituteCount = split(execute(s:startLine.",".s:endLine."s/,.\\///gn"))[0]
catch
  return
endtry
:execute ":"s:startLine - 1
:normal $
:let @/= ",./"
:execute "normal!  ni---\<right>\<right>\<right>---\<left>\<left>\<left>\<left>\<left>\<left>\<left>\<left>"
let s:iteration2 = 0
while (s:iteration2 < s:substituteCount)
  :redraw!
  :let s:replaceTerm = input("Replace with: ")
  :execute "normal! c9l".s:replaceTerm."\<ESC>"
  if(s:iteration2 != s:substituteCount -1)
    :execute "normal!  ni---\<right>\<right>\<right>---\<left>\<left>\<left>\<left>\<left>\<left>\<left>\<left>"
  endif
  :let s:iteration2+=1
endwhile
:execute ":"s:startLine
endfunction
" Moving/Editing around capitals for cammel case stuff
func! MoveToPreviousCap()
  execute "normal! ?[A-Z]\<CR>"
  :noh
endfunc
func! MoveToNextCap()
  execute "normal! /[A-Z]\<CR>"
  :noh
endfunc
func! DeleteInsideCaps()
  :execute "normal! ?[A-Z]\<CR>v/[A-Z]\<CR>hd"
  :noh
endfunc
func! ChangeInsideCaps()
  :execute "normal! ?[A-Z]\<CR>v/[A-Z]\<CR>hd"
  :startinsert
  :noh
endfunc
func! ChangeToCap()
  :execute "normal! v/[A-Z]\<CR>hd"
  :startinsert
  :noh
endfunc
func! DeleteToCap()
  :execute "normal! v/[A-Z]\<CR>hd"
  :noh
endfunc
" Easier window resizing
function! ResizeWindow()
  :let s:resizeDirection = -1
  while(s:resizeDirection != 120 && s:resizeDirection != 13 && s:resizeDirection != 27)
    :let s:resizeDirection = getchar()
    :if (s:resizeDirection == 115)
      :resize -5
    :elseif (s:resizeDirection == 116)
      :resize +5
    :elseif (s:resizeDirection == 119)
      :vertical resize +8
    :elseif (s:resizeDirection == 110)
      :vertical resize -8
    :endif
    :redraw!
  endwhile
endfunction
" move or copy files from adjacent buffers
function! GetMultipleFromAdjacentLine(direction, distance, operation)
  if(a:operation == 'd')
    :let s:promptOperation = "deletion"
  else
    :let s:promptOperation = "yanking"
  endif
  :let s:returnWindow = win_getid()
  :execute "normal! ".a:distance."\<C-w>".a:direction
  :set nu nornu
  :redraw!
  :let s:yankLineStart = input('Line to start '.s:promptOperation.' :')
  if(s:yankLineStart)
    :let s:yankLineEnd = input('Line to stop '.s:promptOperation.' :')
    if(s:yankLineEnd)
      :execute "normal! ".s:yankLineStart."G".a:operation.s:yankLineEnd."G"
      :call win_gotoid(s:returnWindow)
      :put
      :redraw!
    else
      :call win_gotoid(s:returnWindow)
    endif
  else
    :call win_gotoid(s:returnWindow)
  endif
endfunction
function! GetFromAdjacentLine(direction, distance, operation)
  :let s:yankLine = -1
  if(a:operation == 'dd')
    :let s:promptOperation = "delete"
  else
    :let s:promptOperation = "yank"
  endif
  :let s:returnWindow = win_getid()
  :execute "normal! ".a:distance."\<C-w>".a:direction
  :set nu nornu
  :redraw!
  :let s:yankLine = input('Line to '.s:promptOperation.' :')
  if(s:yankLine)
    :execute "normal! ".s:yankLine."G".a:operation
    :call win_gotoid(s:returnWindow)
    :put
  else
    :call win_gotoid(s:returnWindow)
  :endif
endfunction
" auto cammel case
function! CammelCaseVisual()
  :let s:numOfWordsToCammel = input('number of words to cammel: ')
  :let s:numPointer = 0
  :execute "normal! viw".s:numOfWordsToCammel."Egu"
  :while(s:numPointer < s:numOfWordsToCammel)
    :normal wgUlX
    :let s:numPointer+=1
  :endwhile
endfunction
" nav bar 
let g:defautlNavWidth = 40
function! ToggleNav()
  if(!exists("t:navBarActive"))  
    :let t:navBarActive=0
  endif
  if(t:navBarActive==0)
    :silent call NewNav()
    :let t:navBarActive=1
  else
    :let s:homeWindow = win_getid()
    :call CloseNav()
    :call win_gotoid(s:homeWindow)
  endif
endfunction!
function! CloseNav()
      :call win_gotoid(t:navBarWin)
      if(win_getid() == t:navBarWin)
        :execute "bwipe "bufnr('%')
        :let t:navBarActive=0
      else 
        :silent call NewNav()
      endif
endfunction
function! NewNav()
  :let t:navDir = expand('%:h') 
  :let t:navFile = expand('%:t') 
  :let t:navDir = split(t:navDir, '/')
  :execute "normal! \<C-w>n\<C-w>H"
  :exe "vertical resize ".g:defautlNavWidth
  :set wfw
  :let t:navBarWin = win_getid()
  :e.
  :normal gg
  :for dir in t:navDir
    :execute "normal! /".dir."\<CR>"
    :call netrw#LocalBrowseCheck(<SNR>94_NetrwBrowseChgDir(1,<SNR>94_NetrwGetWord()))
    " :redraw!
  :endfor
  :let @/ = t:navFile
  :normal! n
endfunction
function! NewFocusNavBar()
  if(exists("t:navBarWin"))
    :call win_gotoid(t:navBarWin)
  else
    :echo "No active nav bar"
  endif
endfunction
nnoremap<Leader>cext :call CloseScreenExtend()<CR>
function! ExtendScreenDown()
  :execute "normal! \<C-W>v\<C-w>lLzt:set scrollbind\<CR>\<C-w>h:set scrollbind\<CR>"
  :execute "set splitright" 
  :execute "2vsp ~/.vim/michaelSoft/extendwindows/middlepane"
  :execute "set wfw"
  :execute "normal! \<C-w>h"
  :execute "set splitright!"
endfunction!
function! CloseScreenExtend()
  :execute "normal! \<C-w>l\<C-w>q"
  :execute "normal! \<C-w>l:set noscrollbind\<CR>\<C-w>q:set noscrollbind\<CR>"
endfunction!
function! RemoveTempArea()
  :normal! mb
  g/###TEMP AREA/execute "normal! d/END TEMP */\<CR>dd"
  :normal! `b
endfunction
function! PlaceTempArea()
  :execute "normal! o\<esc>a#\<esc>30.\<esc>ATEMP AREA\<esc>"
  :Commentary
  :execute "normal! o\<esc>a#\<esc>30.\<esc>AEND TEMP\<esc>"
  :Commentary
endfunction
" Zooming
function! ToggleZoom()
  if(!exists("b:zoomedStatus"))
    :let b:zoomedStatus = "false"
  endif
  if(b:zoomedStatus == "false")
    :mark b|:tabnew %|normal! 'bzz
    call ZoomContext()
    let b:zoomedStatus = "true"
  else
    :mark v|:tabprevious|:normal! 'vzz
    :+tabclose
    let b:zoomedStatus = "false"
  endif
endfunction
" delete a line below or above and paste below
function! DeleteAboveAndPaste()
    :execute ":let g:yankLine = input('Line below to move: ')"
    :execute "normal! ".g:yankLine."kdd".g:yankLine."jp"
endfunction
" delete multipl lines below or above and paste below
function! DeleteMultipleAboveAndPaste()
    :execute ":let g:yankLineStart = input('Line below to start moving: ')"
    :execute ":let g:yankLineEnd = input('Line below to end moving: ')"
    :execute "normal! :-".g:yankLineStart.",-".g:yankLineEnd."d\<CR>\<C-o>p" 
endfunction
" delete a line below or above and paste below
function! DeleteBelowAndPaste()
    :execute ":let g:yankLine = input('Line below to move: ')"
    :execute "normal! ".g:yankLine."jdd".g:yankLine."kp"
endfunction
" delte multiple lines below or above and paste below
function! DeleteMultipleBelowAndPaste()
    :execute ":let g:yankLineStart = input('Line below to start moving: ')"
    :execute ":let g:yankLineEnd = input('Line below to end moving: ')"
    :execute "normal! :+".g:yankLineStart.",+".g:yankLineEnd."d\<CR>\<C-o>p" 
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
"--- quick view for script/Plugin calls
"--- easy renaming tabs to group thoughts and work spaces
"---overload enter on nav bar to open in previous window
"---merge tabs
"---join pane (tmux style)
"---snippets
"---document links
"---NextCapitalWord improve
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-TESTING AREA
" augroup insertmode
" au!
" autocmd InsertEnter * silent! set cursorcolumn
" autocmd InsertLeave * silent! set nocursorcolumn
" augroup END
func! HandlePrint(channel, msg)
  let @j = a:msg
  execute ':normal! "jpo'
  " echo 'Received: ' . a:msg
endfunc

func! HandleClear(channel, msg)
  echo 'Received: ' . a:msg
endfunc

nnoremap <Leader>dn :call DebugerNext()<CR>
function! DebugerNext()
 call ch_sendraw(g:channel, "n\n", {'callback' : 'HandleClear'})
endfunction


nnoremap <Leader>dr :call DebugerRefresh()<CR>
function! DebugerRefresh()
 normal! ggdG  
 call ch_sendraw(g:channel, "list(99)\n", {"callback": "HandlePrint"}) 
endfunction
" func! Handler(channel)
"   while ch_status(a:channel, {'part': 'out'}) == 'buffered'
"     echomsg ch_read(a:channel)
"   endwhile
" endfunc
" let job = job_start("./jobscript.sh", {'close_cb': 'Handler'})
" let job = job_start("node servers/interfaceServer.js")
" let channel = job_getchannel(job)
" call ch_sendraw(channel, "list(99)")
" echo ch_read(channel)
" call ch_sendraw(channel, "1", {'callback': 'Handler'})

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
