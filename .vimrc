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
Plugin 'VundleVim/Vundle.vim'
""" JS STUFF --------------------------
" auto import
Plugin 'galooshi/vim-import-js'
" ANGULAR 2 CLI integration
Plugin 'bdauria/angular-cli.vim'
" All sorts of typescript stuff
Plugin 'Quramy/tsuquyomi'
" Syntax for template strings
Plugin 'Quramy/vim-js-pretty-template'
" Tern/JS autocomplete
Plugin 'ternjs/tern_for_vim'
" type script syntax highlighting
Plugin 'leafgarland/typescript-vim'
" javascript debuggin
" Plugin 'sidorares/node-vim-debugger'
"auto import
" Plugin 'Galooshi/vim-import-js'
" Plugin 'isRuslan/vim-es6'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
""" HTML STUFF ------------------------
" html quick develop
Plugin 'mattn/emmet-vim'
" html5 autocomplete
Plugin 'othree/html5.vim'
""" PHP STUFF -------------------------
" php autocomplete
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'joonty/vim-phpunitqf'
" Twig smyntax
Plugin 'evidens/vim-twig'
" PHP Debugger
Plugin 'joonty/vdebug'
" php documenter 
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
" PHP unit testing
" enables auto complete on php
" Plugin 'm2mdas/phpcomplete-extended'
" Plugin 'm2mdas/phpcomplete-extended-symfony'
autocmd  FileType  php set omnifunc=phpcomplete#CompletePHP
" dictionary
""" no online help
let g:php_manual_online_search_shortcut = "<C-q>"
Plugin 'alvan/vim-php-manual'
""" TOOLS -----------------------------
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" more readable indents
Plugin 'nathanaelkane/vim-indent-guides'
" git gutter
Plugin 'airblade/vim-gitgutter'
" status bar plugin
Plugin 'vim-airline/vim-airline'
" undo/redo tree structure
Plugin 'sjl/gundo.vim'
" easy comments
Plugin 'tpope/vim-commentary'
" tag browser
Plugin 'majutsushi/tagbar'
" auto complete
Plugin 'maralla/completor.vim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete.vim'
" Syntax error highlighting
Plugin 'scrooloose/syntastic'
" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'
" File information display
Plugin 'Shougo/unite.vim'
"Git wrapper
Plugin 'tpope/vim-fugitive'
""" NATIVE UPGRADES -------------------
" autocomplete for quotes and the like
Plugin 'raimondi/delimitmate'
" extended dot functionality
Plugin 'tpope/vim-repeat.git'
" extended tag matching with %
Plugin 'tmhedberg/matchit'
" Makes Async available
Plugin 'Shougo/vimproc.vim'
" Adds functionality to change surrounding characters
Plugin 'tpope/vim-surround'
" easy motions
Plugin 'easymotion/vim-easymotion'
" Better text objects
Plugin 'wellle/targets.vim'
""" MISCELLANEOUS ---------------------
" NERDTREE
Plugin 'scrooloose/nerdtree'
" Plugin 'jceb/vim-orgmode'
""" AESTHETICS ------------------------
" color schemes
Plugin 'flazz/vim-colorschemes'
""" FUN -------------------------------
" tetris
Plugin 'vim-scripts/TeTrIs.vim'
" snake
Plugin 'zyedidia/vim-snake'
"---------------------------------------
" END OF PLUGINS
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-configuration
" syntax highlighting
syntax on
" gui configuration
" --- sand COLORING
" colorscheme sand
" hi Folded ctermfg=Green ctermbg=DarkGrey
" hi LineNr ctermfg=red
" hi CursorLineNr ctermbg=magenta
" hi CursorLineNr ctermfg=green
" hi Search ctermbg=White ctermfg=Black
" --- jhdark COLORING
colorscheme jhdark
" custom colors
" allow backspacing over start of 'insertmode'; necesssary for delimitmate " backspace
set backspace=indent,eol,start
" column when in insert mode
autocmd InsertEnter * silent! set cursorcolumn
autocmd InsertLeave * silent! set nocursorcolumn
" no swap files
set noswapfile
" lower n always search down
noremap <expr> n 'Nn'[v:searchforward]
noremap <expr> N 'nN'[v:searchforward]
set breakindent
" Netrw top level tree set to dir where vim was opened
" execute "normal! :silent Ntree" $PWD
" Netrw list style to long tree form
let g:netrw_liststyle= 3
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
" typescript
let g:tsuquyomi_completion_detail = 1
" tern
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
" NERD Tree
let NERDTreeShowLineNumbers=1
" php documentor 
let g:snips_author="Michael Robertson"
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
" snippets 
let g:UltiSnipsExpandTrigger = "<C-Z>"
let g:UltiSnipsListSnippets = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"
" dir for custom snips
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.vim/michaelSoft/custom_snippets']
" control p 
let g:ctrlp_custom_ignore = '\v[\/]\.(docs)$'
let g:user_command_async=1
" php extended config 
let g:phpcomplete_parse_docblock_comments = 1
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
" let g:vdebug_options = {}
" let g:vdebug_options["debug_file"] = "~/vdebug.log"
" let g:vdebug_options["debug_file_level"] = 2
" let g:vdebug_options["port"] = 9000
" let g:vdebug_options["path_maps"] = {"/var/www/html/repos/" : "/Users/mrobertson/vms/dev/repos/"}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call plugin 
" PHPUnit
augroup phpunit
  au!
  au BufEnter *.php nnoremap <Leader>tes :Test<CR>
augroup END
" tern 
autocmd FileType javascript nmap <buffer> K :TernDoc<CR>
" typescript 
autocmd FileType typescript nmap <buffer> K : <C-u>echo tsuquyomi#hint()<CR>
" PHPDoc
nnoremap <Leader>PD :call pdv#DocumentWithSnip()<CR>
" NERTDTree
nnoremap <Leader>N :NERDTreeToggle<CR>
nnoremap <Leader>LN :NERDTreeFind<CR>
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
nnoremap <Leader>san :vsp ./src/APIBundle/Controller/TestingController.php<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-quick commands
" list functions help
nnoremap <Leader>lf :execute "help list-functions"<CR><C-W>H
" completion
inoremap <C-c> <C-x><C-o>
inoremap <C-f> <C-x><C-l>
inoremap <C-p> <C-x><C-p>
inoremap <C-n> <C-x><C-n>
" yY and yy slight changes
nnoremap yy y$
nnoremap yY y0
" edit plugins 
nnoremap <Leader>epl :vsplit ~/.vim/michaelSoft/<CR>
" edit bundle
nnoremap <Leader>ebu :vsplit ~/.vim/bundle/<CR>
" Toggle xdebug/server
nnoremap <Leader>rs :!sudo service apache2 restart<CR>
nnoremap <Leader>txd :!bash ~/scripts/toggleXDebug.sh<CR>
" change fold methods
nnoremap <Leader>sfm :let &foldmethod="manual"<CR>
nnoremap <Leader>sfi :let &foldmethod="indent"<CR>:echo "foldlevel = ".&foldlevel<CR>
nnoremap <Leader>sfu :let &foldnestmax+=1<CR>:echo "foldNestLevel = ".&foldnestmax<CR>
nnoremap <Leader>sfd :let &foldnestmax-=1<CR>:echo "foldNestLevel = ".&foldnestmax<CR>
" scrap buffer
nnoremap <Leader>jun1 :tabnew +e ~/temp/junk<CR>
nnoremap <Leader>jun2 :tabnew +e ~/temp/junk2<CR>
nnoremap <Leader>jun3 :tabnew +e ~/temp/junk3<CR>
nnoremap <Leader>jun4 :tabnew +e ~/temp/junk4<CR>
nnoremap <Leader>jun5 :tabnew +e ~/temp/junk5<CR>
" toggle modifiable 
nnoremap <Leader>mod :set modifiable!<CR>
" toggle format pasting
nnoremap <Leader>pas :set paste!<CR>
" panenavigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-t> <C-w>t
nnoremap <C-b> <C-w>b
nnoremap <C-n> <C-w>p
nnoremap ZX :q<CR>
nnoremap XZ :q!<CR>
" tab navigation 
nnoremap zl :tabnext<CR>
nnoremap zh :tabprev<CR>
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tu :tabmove +1<CR>
nnoremap <Leader>td :tabmove -1<CR>
"Obscure/UN Obscure doc
nnoremap <Leader>hid :normal! mmggg?G`m<CR>
" Search/edit/find reference files
nnoremap <Leader>gref :grep -R "" ~/.vim/michaelSoft/references gn<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
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
" find trailing spaces
nnoremap <Leader>ts /\S\zs\s\+$<cr>
"turn off highlighting
nnoremap <C-_> :noh<CR>
nnoremap <Leader>no :noh<CR>
" vim edit rc and resource
nnoremap <Leader>vup :!cd ~;git add .vimrc && sudo git add .vim/michaelSoft/* -f && git commit -m "updating" && git push github master;<CR>
nnoremap <Leader>vps :!cd ~ && git push github master;<CR>
nnoremap <Leader>vsy :!cd ~;git pull github master;<CR>
nnoremap <Leader>vvv :tabnew ~/.vimrc<CR>:tabmove $<CR>
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


source /home/vagrant/.vim/michaelSoft/ViSql/ViSql.vim
source /home/vagrant/.vim/michaelSoft/SymfonyAutoImport/symfonyAutoLoad.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-load custom plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call script
" delete non active buffers
nnoremap <Leader>dbu :call DeleteNonActiveBuffers()<CR>
" edit php test file
nnoremap <Leader>ete :call EditPHPTestFile()<CR>
"my first bind
nnoremap <Leader>bl :call FlipBoolean()<CR>
" folidng 
nnoremap <Leader>fl :call ForceFoldLevel()<CR>
" zooming
nnoremap <Leader>z :call ToogleZoomSplit()<CR>
"extending windows
nnoremap<Leader>ewu :call ExtendScreenUp()<CR>
nnoremap<Leader>ewd :call ExtendScreenDown()<CR>
nnoremap<Leader>ewc :call CloseScreenExtend()<CR>
" Symfony auto import

augroup import
  au!
  au BufEnter *.php nnoremap <Leader>imp :call SetUpSymfonyAutoImport()<CR>
  au BufEnter *.php nnoremap <Leader>ser :silent! call SetUpSymfonyServices()<CR>
  au BufEnter *.ts nnoremap <Leader>imp :TsuImport<CR>
augroup END
" games
nnoremap <Leader>gte :cal <SNR>15_Main()<CR>
nnoremap <Leader>gsn :call Snake()<CR>
" format json
vnoremap <Leader>fj v:call FormatJSON()<CR>
" visql
nnoremap <Leader>dbf :call ViSqlGoToInterface()<CR> 
nnoremap <Leader>dbn :call NewVISqlInterface('new', 'tab')<CR> 
nnoremap <Leader>dbp :call NewVISqlInterface('last', 'tab')<CR> 
nnoremap <Leader>dbtp :call NewVISqlInterface('lastTable', 'tab')<CR> 
nnoremap <Leader>dbvn :call NewVISqlInterface('new', 'side')<CR> 
nnoremap <Leader>dbvp :call NewVISqlInterface('last', 'side')<CR> 
nnoremap <Leader>dbvtp :call NewVISqlInterface('lastsidele', 'side')<CR> 
nnoremap <Leader>dbl :call ViSqlListSavedDBs('tab')<CR> 
nnoremap <Leader>dbvl :call ViSqlListSavedDBs('side')<CR> 
"node debugger
nnoremap <Leader>df :call SetDebugLaunchFile()<CR>
nnoremap <Leader>dw :call SetDebugWord()<CR>
nnoremap <Leader>dl :call SetDebugLine()<CR>:call SetDebugFile()<CR>
nnoremap <Leader>dd :call NodeDebugMon()<CR>
nnoremap <Leader>da :call SetDebugWord()<CR>:call SetDebugLine()<CR>:call SetDebugFile()<CR>:call NodeDebugMon()<CR>
"VI SQL
" nnoremap <Leader>dbs :call VIsqlLogin()<CR>
"remote manipulation of lines
nnoremap <Leader>rm :silent call RemoteManipulate()<CR>
" set a new top line
nnoremap<Leader>nt :call MakeTop()<CR>
" Peeks 
nnoremap <Leader>pss :call PeakSymfonySnippets()<CR>
nnoremap <Leader>psp :call PeakPHPSnippets()<CR>
nnoremap <Leader>psc :call PeekScriptCalls()<CR>
"repetitive strings 
nnoremap <Leader>rli :call RepetitiveLines()<CR>
nnoremap <Leader>rst :call RepetitiveString()<CR>
nnoremap <Leader>frp :call FindAndReplaceRange()<CR>
" Mark and move windows
nnoremap <Leader>mwp :call MarkWindow()<CR>
nnoremap <Leader>mwr :call UnMarkWindow()<CR>
nnoremap <Leader>mwm :call MoveWindowToTab()<CR>
" Capitals movement/editing
nnoremap Q :silent call MoveToPreviousCap()<CR>
nnoremap <BAR> :silent call MoveToNextCap()<CR>
nnoremap dic :call DeleteInsideCaps()<CR>
nnoremap cic :call ChangeInsideCaps()<CR>
nnoremap dc :call DeleteToCap()<CR>
nnoremap cc :call ChangeToCap()<CR>
"resize window
nnoremap <Leader>res :silent call ResizeWindow()<CR>
" auto camel case
nnoremap <Leader>cam :call CammelCaseVisual()<CR>
" nav bar
" nnoremap <Leader>tn :call ToggleNav()<CR>
" nnoremap <Leader>fn :call NewFocusNavBar()<CR>
" Temp areas
nnoremap <Leader>tap :call PlaceTempArea()<CR>
nnoremap <Leader>tar :call RemoveTempArea()<CR>
" Context Searching
nnoremap <Leader>csl :call SearchContextually("local")<CR>
nnoremap <Leader>csg :call SearchContextually("global")<CR>
" temporary line highlights
nnoremap <Leader>tsp :call PlaceTempSign()<CR>
nnoremap <Leader>tsr :call RemoveTempSign()<CR>
" Spelling
nnoremap <Leader>sp :set spell!<CR>
" go to thirds of line
nnoremap gh :call GoToFirstThirdOfLine()<CR>
nnoremap gl :call GoToSecondThirdOfLine()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-scripts
" clear non active buffers
function! DeleteNonActiveBuffers()
  let s:abortChoice = getchar('Delete non active buffers? (y/n)')
  if s:abortChoice != 121
    return
  endif
  redir => s:buffers | ls | redir END
  let s:buffersArray = split(s:buffers, '\n')
  " for s:bufferLine in s:buffersArray
  "   echo split(s:bufferLine)[0]
  " endfor
  for s:bufferLine in s:buffersArray
    if match(s:bufferLine, '^\s*\d\+\s\{,4}\S*a') == -1
      let s:bufferNumber = split(s:bufferLine)[0]
      execute "bd ".s:bufferNumber
    endif
  endfor
endfunction
" find and edit test file (php)
function! EditPHPTestFile()
  let s:testDir = './tests/'
  let s:testFile = expand('%:t:r').'Test.'.expand('%:e')
  let s:testFilePath = system('find '.s:testDir.' -name "'.s:testFile.'"')
  let s:testFilePath = split(s:testFilePath)
  if empty(s:testFilePath)
    echo 'No test file '.s:testFile.' found. Create it? (y/n)'
    let s:choice = getchar()
    if s:choice != 121
      echo 'Aborting...'
      return
    else
      let s:testFilePath = substitute(expand('%'), '^.*/\(.*Bundle\)', s:testDir.'\1', '')
      let s:testFilePath = substitute(s:testFilePath, '\w\+\.php', '', '')
      execute '!mkdir '.s:testFilePath.' -p'
      execute '!touch '.s:testFilePath.''.s:testFile
      execute 'vsplit +e '.s:testFilePath.''.s:testFile
      return
    endif
  else
    let s:testFilePath = s:testFilePath[0]
    execute "vsplit +e "s:testFilePath
  endif
endfunction
function! ToogleZoomSplit()
  if !exists('t:zoomedStatus')
    let t:zoomedStatus = 'false'
  endif
  if t:zoomedStatus == 'true'
    call UnZoomSplit()
    echo "un-zoom"
  elseif t:zoomedStatus == 'false'
    call ZoomSplit()
    echo "zoom"
  endif
endfunction
function! ZoomSplit()
  let s:returnWindow = win_getid()
  let t:zoomList = []

  windo call add(t:zoomList, [win_getid(), winheight('.'), winwidth('.'), winsaveview()])
  call win_gotoid(s:returnWindow)
  vertical res 1000
  res 1000
  let t:zoomedStatus = 'true'
endfunction

function! UnZoomSplit()
  if exists('t:zoomedStatus') == 0 || t:zoomedStatus == 'false'
    let t:zoomedList = []
  endif
  let s:returnWin = win_getid()
  for split in t:zoomList
    call win_gotoid(split[0])
    exec "res ".split[1]
    exec "vertical res ".split[2]
    call winrestview(split[3])
  endfor
  let t:zoomList = reverse(t:zoomList)
  for split in t:zoomList
    call win_gotoid(split[0])
    exec "res ".split[1]
    exec "vertical res ".split[2]
    call winrestview(split[3])
  endfor
  call win_gotoid(s:returnWin)
  let t:zoomedStatus = 'false'
  unlet t:zoomList
endfunction

function! ForceFoldLevel()
  :let s:level = input('Fold level: ')
  if (s:level == '')
    return
  endif
  :execute "let &foldlevel=".s:level
  :execute "let &foldnestmax=".(s:level+1)
endfunction
function! PeakSymfonySnippets()
  :split +e $HOME/.vim/bundle/vim-snippets/UltiSnips/php_symfony2.snippets
  :g/^snippet/p
  :bd!
endfunction
function! PeakPHPSnippets()
  :split +e $HOME/.vim/bundle/vim-snippets/snippets/php.snippets
  :g/^snippet/p
  :bd!
endfunction
function! FormatJSON()
  :execute "'<,'>!python -m json.tool"
  :normal! gv
endfunction
" delete, move, or copy a line remotely(without using the cursor)
function! RemoteManipulate()
  :let s:startWindow = win_getid()
  :let s:startline = line('.')
  :let s:moveCommand = 'y'
  :let s:putCommand = 'put'
  :let s:adjacentWindow = ''
  :set nu nornu
  :redraw!
  :let s:targetString = input('Move target: ')
  let s:testVar = match(s:targetString,'\d\?[hjkl]')
  if (match(s:targetString,'\d\?[hjkl]') == 0) 
    :noautocmd execute "normal! \<C-w>".s:targetString."\<CR>"
    :let s:adjacentWindow = s:targetString
    :set nu nornu
    :redraw!
    :let s:targetString = input('Adjacent move target: ')
  endif
  if (match(s:targetString, '-') > -1)
    :let s:targetString = substitute(s:targetString, '-', ',', '')
  endif
  if (match(s:targetString,'m') > -1)
    :let s:moveCommand = 'd'
    :let s:targetString = split(s:targetString, 'm')[0]
  elseif (match(s:targetString, 'd') > -1)
    :let s:putCommand = ''
    :let s:moveCommand = 'd'
    :let s:targetString = split(s:targetString, 'd')[0]
  elseif ( match( s:targetString, 's' ) > -1 )
    :let s:putCommand = 'swap'
    :let s:targetString = split( s:targetString, 's' )[0]
  elseif ( match( s:targetString, 'y' ) > -1 )
    :let s:putCommand = 'none'
    :let s:targetString = split( s:targetString, 'y' )[0]
  endif
  :execute s:targetString.''.s:moveCommand
  :execute 'call win_gotoid('.s:startWindow.')'
  :set nu nornu
  :execute "normal! :".s:startline."\<CR>"
  :redraw!
  if (s:putCommand == 'put')
    :let s:targetLine = input('Line to move to: ')
    if (s:targetLine == '')
      :let s:targetLine = line('.')
    endif
    :execute s:targetLine.'|'.s:putCommand
  elseif ( s:putCommand == 'swap' )
    :let s:swapString = input( 'Swap lines: ' )
    if (match(s:swapString, '-') > -1)
      :let s:swapString = substitute(s:swapString, '-', ',', '')
    endif
    if ( s:swapString == '' )
      :let s:swapString = line( '.' )
    endif
    :let s:yankedLine = @0
    :execute "normal! :".s:swapString."y\<CR>"
    :let s:yankedSwapLine = @0
    :execute "normal! :".s:swapString."d\<CR>"
    :normal! k
    :execute "put =s:yankedLine"
    if (s:adjacentWindow != '')
      :noautocmd execute "normal! \<C-w>".s:adjacentWindow."\<CR>"
    endif
    :execute "normal! :".s:targetString."d\<CR>"
    if ( match( s:targetString, ',' ) > -1 )
      :let s:targetString = split ( s:targetString, ',' )[0]
    endif
    :normal! k
    :execute "put =s:yankedSwapLine"
    :execute 'call win_gotoid('.s:startWindow.')'
  endif
  :execute "normal! :".s:startline."\<CR>"
  :set nu rnu
endfunction
" sets a new top line for the window
function! MakeTop()
  :let s:currentLine = line('.')
  :let s:newTop = input('New top line: ')
  :execute 'normal! mb'
  :execute s:newTop
  :let s:newTop = line('.')
  :execute 'normal! zt'
  if (s:currentLine > s:newTop)
    :execute 'normal! `b'
  endif
endfunction
function! SnipVarDump()
  :execute "normal! ovar_dump();"
  :normal! ==^f)a
  :startinsert
endfunction
" quick view of script available to call
function! PeekScriptCalls()
  :vsp +e $MYVIMRC
  :normal! gg
  :/-call/,/-scripts/g/./echo getline('.')
  :execute "normal! \<C-w>q"
endfunction
" string with variable repeats
function! RepetitiveString() 
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
  let @b = s:template
  while (s:iteration < s:repeatCount)
    :execute "normal! a\<C-r>b\<ESC>"
    let s:iteration+=1
  endwhile
  let s:endLine=line('.')
  let s:endPosition=col('.')
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
    if (s:replaceTerm == "")
      return
    endif
    :execute "normal! c9l".s:replaceTerm."\<ESC>"
    if(s:iteration2 != s:substituteCount -1)
      :execute "normal!  ni---\<right>\<right>\<right>---\<left>\<left>\<left>\<left>\<left>\<left>\<left>\<left>"
    endif
    :let s:iteration2+=1
  endwhile
  :execute "normal! ".s:endPosition."|"
endfunction
function! FindAndReplaceRange()
  :let s:find = input('find: ')
  if (s:find == "")
    return
  endif
  :let s:replace = input('and replace with: ')
  if (s:replace == "")
    return
  endif
  :let s:range = input('from here to: ')
  if (s:range == "")
    return
  endif
  :execute ".,".s:range."s/".s:find."/".s:replace."/gc"
endfunction
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
function! RepetitiveLines()
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
    if (s:replaceTerm == "")
      return
    endif
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
" extend screen to another split
function! ExtendScreenUp()
  if (!exists('b:extendedUpList'))
    :let b:extendedUpList = [] 
  endif
  if(!exists('b:extendedUpWindow'))
    let b:extendedUpWindow = win_getid()
  endif
  if (!exists('b:extendedViews'))
    :let b:extendedViews = [] 
    :call add(b:extendedViews, win_getid())
  endif
  :let s:startWindow = win_getid()
  for window in b:extendedViews
    :call win_gotoid(window)
    :set noscrollbind
  endfor
  :call win_gotoid(b:extendedUpWindow)
  :vsp
  :execute "set splitright" 
  :2vsp ~/.vim/michaelSoft/extendwindows/middlePaneUp
  :execute "set nosplitright" 
  :set wfw
  :let s:divider = win_getid()
  :let b:baseWindow = s:startWindow
  :execute "normal! \<C-w>h"
  :let b:baseWindow = s:startWindow
  :let s:newExtendedUpWindow = win_getid()
  :normal! Hzb
  :call win_gotoid(s:startWindow)
  :call add(b:extendedUpList, s:divider)
  :call add(b:extendedUpList, s:newExtendedUpWindow)
  :call add(b:extendedViews, s:newExtendedUpWindow)
  :let b:extendedUpWindow = s:newExtendedUpWindow
  for window in b:extendedViews
    :call win_gotoid(window)
    :set scrollbind
    :set nowrap
  endfor
  :call win_gotoid(s:startWindow)
  :set nowrap
endfunction!
""""""" Extending screen down
function! ExtendScreenDown()
  if (!exists('b:extendedDownList'))
    :let b:extendedDownList = [] 
  endif
  if(!exists('b:extendedDownWindow'))
    let b:extendedDownWindow = win_getid()
  endif
  if (!exists('b:extendedViews'))
    :let b:extendedViews= [] 
    :call add(b:extendedViews, win_getid())
  endif
  :let s:startWindow = win_getid()
  for window in b:extendedViews
    :call win_gotoid(window)
    :set noscrollbind
  endfor
  :call win_gotoid(b:extendedDownWindow)
  :execute "set splitright" 
  :vsp
  :execute "set nosplitright" 
  :2vsp ~/.vim/michaelSoft/extendwindows/middlePaneDown
  :set wfw
  :let s:divider = win_getid()
  :let b:baseWindow = s:startWindow
  :execute "normal! \<C-w>l"
  :let b:baseWindow = s:startWindow
  :let s:newExtendedDownWindow = win_getid()
  :normal! Lzt
  :call win_gotoid(s:startWindow)
  :call add(b:extendedDownList, s:divider)
  :call add(b:extendedDownList, s:newExtendedDownWindow)
  :call add(b:extendedViews, s:newExtendedDownWindow)
  :let b:extendedDownWindow = s:newExtendedDownWindow
  for window in b:extendedViews
    :call win_gotoid(window)
    :set scrollbind
    :set nowrap
  endfor
  :call win_gotoid(s:startWindow)
  :set nowrap
endfunction!
""""""" close screen extend
function! CloseScreenExtend()
  if (exists('b:baseWindow'))
    :call win_gotoid(b:baseWindow)
  endif
  if (!exists('b:extendedDownList'))
    :let b:extendedDownList = [] 
  endif
  if (!exists('b:extendedUpList'))
    :let b:extendedUpList = [] 
  endif
  :let s:startWindow = win_getid()
  for window in b:extendedDownList
    :call win_gotoid(window)
    if(window == win_getid())
      :close
    endif
  endfor
  for window in b:extendedUpList
    :call win_gotoid(window)
    if(window == win_getid())
      :close
    endif
  endfor
  :call win_gotoid(s:startWindow)
  :set noscrollbind
  :let b:extendedDownWindow = win_getid()
  :let b:extendedUpWindow = win_getid()
  :let b:extendedDownList = [] 
  :let b:extendedViews = [win_getid()] 
endfunction!
""""""" Temporary areas
function! RemoveTempArea()
  :normal! mb
  :normal! `b
endfunction
function! PlaceTempArea()
  :execute "normal! o\<esc>a#\<esc>30.\<esc>ATEMP AREA\<esc>"
  :Commentary
  :execute "normal! o\<esc>a#\<esc>30.\<esc>AEND TEMP\<esc>"
  :Commentary
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
""""""" open doc in code
" nnoremap <Leader>!c :!code %<CR>
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
"false 0 1 true
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
" nnoremap <Leader>dd :call NodeDebug()<CR>
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

nnoremap <Leader>ish :tabnew ~/.vim/michaelSoft/ish/ish.txt\|set nornu nonu\|silent sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|sleep 80m\|+1\|:q!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-TODO
"--- look into Neovim and use Deoplete 
"
"--- php command line based debugger
"--- modularize vimrc
"--- find and replace quick command
"--- mysql integration
"    todo
"      multiple tabs
"      view data on a subset of columns
"      view range of databased on column eg between id values or date ranges
"      pagination
"      edit table structure
"    BUGS
"      running a query with no output back (deleteing a record) will cause a blank screen, with enter attempting to edit a non existant record. It should refresh the table view
"--- curl integration component
"--- link variables together (eg x = 10 y = 10 z = 10 can all be changed at once)
"--- easy renaming tabs to group thoughts and work spaces
"--- overload enter on nav bar to open in previous window
"--- merge tabs
"--- document links
"--- NextCapitalWord improve
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-TESTING AREA
nnoremap <Leader>fse :silent call FindSymfonyServiceFiles()<CR>
function! FindSymfonyServiceFiles()
  vsplit +enew
  normal! <C-W>H
  execute 'r!find ./src/**/Service -regex ".*\.php"'
  %s/\(^.*\/\)\(\w\+\.php\)/\2:\1\2
  %!column -s":" -t
  %sort
  :$
  normal! o
  r! find ./src/ -name "services.yml"
endfunction
nnoremap <Leader>fcl :call ClassSearch()<CR>
function! ClassSearch()
  let g:returnWindow = win_getid()
  let s:searchTerm = input("Class to serach for: ")
  if empty(s:searchTerm)
    return
  endif
  let s:searchCommand = 'find ./ -regex ".*\.php" ! -path "./var/*" ! -path "./tests/*" ! -path "./web/*" | xargs grep "^\(abstract\)\?\s*class.*\w*'.s:searchTerm.'\w*"'
  let s:searchResults = system(s:searchCommand)
  if match(s:searchResults, 'class') == -1
    echom "...No results..."
    return
  endif
  tabnew +enew
  %d
  put=s:searchResults
  silent %s/\(^.*\):\(.*\)/\2:\1/g
  silent %s/\(^class \w\+\).*:/\1:/g
  silent %!column -s":" -t
  silent %sort
endfunction
" nnoremap <Leader>tes :call SmartComments()<CR>
let g:SCkeywordsFilePath = "~/.vim/michaelSoft/SmartComments/"
function! SmartComments()

  :let s:keywords = SCGetKeywords()
  :let s:commentLine = SCFormatCommentLine(getline('.'))
  if type(s:commentLine) != 3
    return
  endif

  for s:word in s:commentLine
    if index(s:keywords, s:word.".sc") > -1
      :call SCGetInstructions(s:word.".sc")
    endif
  endfor
endfunction

" //load the em

function! SCGetInstructions(file)
  :let s:instructionsRaw = system("sed -n '/^em/,/^\w/p' ".g:SCkeywordsFilePath."/".a:file)
  :let g:instructionsList = split(s:instructions, '\n')
  for s:line in g:instructionsList
    if match(s:line, '^-commentMod') > -1
      :echo '123'
      echo s:line
    elseif match(s:line, '^-insertLine') > -1
      :echo '456'
      echo s:line
    endif
  endfor
  echom "999"
endfunction

function! SCGetKeywords()
  :let s:keywords = system('ls '.s:SCkeywordsFilePath.' | sed -n "/\.sc/p"')
  :let s:keywords = split(s:keywords)
  return s:keywords
endfunction

function! SCFormatCommentLine(commentLine)
  if match(a:commentLine, '^\s*\/\/') < 0
    :echom "not a comment"
    :return "false"
  endif
  :let s:commentLine = split(a:commentLine, "\/\/")[1]
  :let s:commentLine = split(s:commentLine)
  return s:commentLine
endfunction

function! ConverSnippetQuoteLines()
  :normal! ^f[
  :let s:startLine = line('.')
  :normal! %
  :let s:endLine = line('.')
  :normal! %
  :let s:quoteLoopLines = (s:endLine - s:startLine) - 1
  :let s:quoteLoopCount = 0
  :normal! j
  while(s:quoteLoopCount < s:quoteLoopLines)
    normal! I""xA",j
    :let s:quoteLoopCount += 1
  endwhile
  normal! k^f,x
endfunction

function! ConvertSnippetToVsCode()
  :let s:loopCount = 0
  :let s:snippetCount = split(execute('%s/^snippet//gn'))[0]
  :normal! gg
  while(s:loopCount < s:snippetCount)
    :execute 'normal! /^snippetdawi"ea": {}xiO"prefix": k^ya"j$pa,o"body": []xjdd/^endsnippetp0i"description":o},kO],kdd'
    :execute "normal! ?[\<CR>"
    :call ConverSnippetQuoteLines()
    :let s:loopCount += 1
  endwhile
  execute "normal! /},\<CR>lx"
endfunction

" nnoremap <Leader>aw :call Wash()<CR>
" nnoremap <Leader>awu :call WashUndo()<CR>
function! Wash()
  :let s:end = 'false'
  while(s:end == 'false')
    :call WashDirection()
    :call WashWord()
  endwhile
endfunction

function! WashUndo()
  :earlier 1f
endfunction

function! WashDirection()
  :let s:directions = ['h', 'j', 'k', 'l', '^', '$', 'w', 'b', 'e']
  :let s:finalTweakOptions = ['W', 'B']
  :let s:random = GetRandomNumber("0-".len(s:directions))
  :let s:direction = s:directions[s:random-1]
  if(s:direction != '$')
    :let s:range = "2-5"
    :let s:random = GetRandomNumber(s:range)
    :let s:direction = s:random.s:direction
  endif
  :execute "normal! ".s:direction
  :let s:finalTweak = s:finalTweakOptions[GetRandomNumber("0-1")]
  :execute "normal! ".s:finalTweak
  :call WashTimer('long')
endfunction

function! GetRandomNumber(range)
  :let s:random = system('shuf -i '.a:range.' -n 1')
  :let s:random = substitute(s:random, '\n', '', '')
  return s:random
endfunction

function! WashWord()
  " get a word
  :let s:words = [' function ', ' let MIDsData = array() ', ' x < 10 ', ' return ', ' undefined ', ' filter.filter(x) ', ' chrisify($this) ', ' if(infinity * infinity = NULL) {', ' object.prototype  ', ' let result = integration.getResult() ']
  " for each letter
  :let s:range = "0-".(len(s:words)-1)
  :let s:word = s:words[GetRandomNumber(s:range)]
  " write word
  for s:letter in split(s:word, '\zs')
    :execute "normal! a".s:letter
    :call WashTimer('short')
  endfor
  return
endfunction

function! WashTimer(length)
  if(a:length == 'short')
    :let s:range = "5-100"
  elseif (a:length == 'long')
    :let s:range = "100-700"
  endif
  :let s:random = system('shuf -i '.s:range.' -n 1')
  :let s:random = substitute(s:random, '\n', '', '')
  :redraw
  :echo 'sleep '.s:random.'m'
  :execute 'sleep '.s:random.'m'
endfunction

" nnoremap <Leader>te :call CurlManager()<CR>
" function! CurlManager()
"   :let s:url = GetURL()
"   :let s:method = GetMethod()
"   :let s:header = GetHeader()
"   :call FireCurlCall(s:url, s:method, s:header)
" endfunction
" function! FireCurlCall(url, method, header)
"   :let s:curlCommand = "r!curl '".a:url."' -X '".a:method."' -H '".a:header."' -D -"
"   :put=s:curlCommand
"   :execute s:curlCommand
"   :execute "normal! ?------------\<CR>jjd2jO"
"   :execute "normal! ?-------------\<CR>"
" endfunction
" function! GetURL()
"   return 'http://localhost:80/repos/ccp_be/web/app_dev.php/api/testing'
" endfunction
" function! GetMethod()
"   return 'GET'
" endfunction
" function! GetHeader()
"   return 'apikey:kuRmnPl59gUZVQdVCvdiUmV/mNfOp6A/Q9LqTP6Lw18='
" endfunction
" augroup insertmode
" au!
" augroup END
" func! HandlePrint(channel, msg)
"   let @j = a:msg
"   execute ':normal! "jpo'
"   " echo 'Received: ' . a:msg
" endfunc

" func! HandleClear(channel, msg)
"   echo 'Received: ' . a:msg
" endfunc

" nnoremap <Leader>dn :call DebugerNext()<CR>
" function! DebugerNext()
"  call ch_sendraw(g:channel, "n\n", {'callback' : 'HandleClear'})
" endfunction


" nnoremap <Leader>dr :call DebugerRefresh()<CR>
" function! DebugerRefresh()
"  normal! ggdG  
"  call ch_sendraw(g:channel, "list(99)\n", {"callback": "HandlePrint"}) 
" endfunction
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
