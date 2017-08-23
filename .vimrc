"new install
"PluginInstall
set nocompatible              " be iMproved, required
filetype off                  " required

" plugins to checkout
" checkout https://github.com/w0rp/ale for a sync linting
" https://github.com/skywind3000/asyncrun.vim for async console commands
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
""" JS STUFF --------------------------
""" Typescript ----
" All sorts of typescript stuff
Plugin 'Quramy/tsuquyomi'
" type script syntax highlighting
Plugin 'leafgarland/typescript-vim'
" snips and syntax
Plugin 'HerringtonDarkholme/yats.vim'
" --------
" JS Doc
Plugin 'othree/jsdoc-syntax.vim'
Plugin 'heavenshell/vim-jsdoc'
" auto import
Plugin 'galooshi/vim-import-js'
" ANGULAR 2 CLI integration
Plugin 'bdauria/angular-cli.vim'
" Syntax for template strings
Plugin 'Quramy/vim-js-pretty-template'
" Tern/JS autocomplete
Plugin 'ternjs/tern_for_vim'
" javascript debuggin
" Plugin 'sidorares/node-vim-debugger'
"auto import
" Plugin 'Galooshi/vim-import-js'
" Plugin 'isRuslan/vim-es6'
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
""" HTML STUFF ------------------------
" jade syntax
Plugin 'digitaltoad/vim-pug'
" html quick develop
Plugin 'mattn/emmet-vim'
" html5 autocomplete
Plugin 'othree/html5.vim'
""" PHP STUFF -------------------------
" php autocomplete
" Plugin 'shawncplus/phpcomplete.vim'
" Plugin 'm2mdas/phpcomplete-extended'
" Plugin 'm2mdas/phpcomplete-extended-symfony'
" Twig smyntax
Plugin 'lumiliet/vim-twig'
" PHP Debugger
Plugin 'joonty/vdebug'
" php documenter 
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache'
" PHP unit testing
Plugin 'joonty/vim-phpunitqf'
" dictionary
""" no online help
let g:php_manual_online_search_shortcut = "<C-q>"
Plugin 'alvan/vim-php-manual'
""" TOOLS -----------------------------
" visual representation of cursor in document
Plugin 'gcavallanti/vim-noscrollbar'
" sorting 
Plugin 'christoomey/vim-sort-motion'
" JSON tools
Plugin 'elzr/vim-json'
" better join
Plugin 'sk1418/Join'
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
" Syntax error highlighting
" Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'
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
" Plugin 'zyedidia/vim-snake'
"---------------------------------------
" END OF PLUGINS
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-configuration
" omni complete 
set completeopt+=longest
" filetypes
au BufRead,BufNewFile *.apidoc    set filetype=apidoc
" stop the annoyting autojoin line
set textwidth=0
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType vim setlocal omnifunc=syntaxcomplete#Complete 
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-language specific
" -typescript 
augroup typescriptConfig
  au!
  " config
  autocmd FileType typescript :set makeprg=tsc
  " commands
  autocmd FileType typescript nnoremap <Leader>let :call ToggleConstLet()<CR>
  autocmd FileType typescript nnoremap KK :<C-u>echo tsuquyomi#hint()<CR>
  autocmd FileType typescript nnoremap KL :TsuquyomiSignatureHelp<CR>
  autocmd FileType typescript nnoremap <Leader>' :s/'/"/g"<CR>
  autocmd FileType typescript nnoremap <Leader>" :%s/'/"/g"<CR>
  autocmd FileType typescript nnoremap <Leader>gd :TsuDefinition<CR>
  autocmd FileType typescript nnoremap <Leader>imp :TsuImport<CR>
  autocmd FileType typescript nnoremap <Leader>ref :TsuReferences<CR>
  autocmd FileType typescript nnoremap <Leader>ren :TsuquyomiRenameSymbol<CR>
  autocmd FileType typescript nnoremap <Leader>run :!npm run start<CR>
  autocmd FileType typescript nnoremap <Leader>san :!npm run sandbox<CR>
  autocmd FileType typescript nnoremap <Leader>esan :vsp +e ./src/sandbox.ts<CR>
  autocmd FileType typescript nnoremap <Leader>mk :make<CR>
  autocmd FileType typescript nnoremap <Leader>tes :!npm run test<CR>
  autocmd FileType typescript nnoremap <Leader>lg :call ToggleWrapInConsoleLog()<CR>
  autocmd FileType typescript nnoremap <Leader>doc :JsDoc<CR>
  autocmd FileType typescript nnoremap <Leader>ete :call EditJSTestFile()<CR>
  autocmd FileType typescript nnoremap <Leader>npmi :!npm i -s 
augroup END

" PHP
augroup phpConfig
  au!
  au BufEnter *.php nnoremap <Leader>tes :Test<CR>
  au BufEnter *.php nnoremap <Leader>ete :call EditPHPTestFile()<CR>
augroup END

" JS 
augroup jsConfig
  au!
  autocmd FileType javascript nnoremap <Leader>lg :call ToggleWrapInConsoleLog()<CR>
  autocmd FileType javascript nnoremap <buffer> K :TernDoc<CR>
  autocmd FileType javascript nnoremap <Leader>tes :!npm run test<CR>
  autocmd FileType javascript nnoremap <Leader>ete :call EditJSTestFile()<CR>
  autocmd FileType javascript nnoremap <Leader>doc :JsDoc<CR>
augroup END

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
" ale
let g:ale_lint_on_text_changed = 0
" don't lint on every word change
let alt_lint_on_text_changed = 0
" --- typescript
 let g:ale_linters = { 'typescript': ['tslint', 'tsserver'] }
" JsDoc
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_underscore_private = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_user_defined_tags = {
      \ '@author': 'Michael Robertson',
      \ '@date': strftime('%Y-%m-%d'),
      \}
" control-p ignore folders
set wildignore+=*/build/*,*/node_modules/*,*/test/*,*/vendor/*,*/tests/*,*/web/*
" quick adding snippets
function! AddQuickSnippet() 
  let s:snipDir = '~/.vim/michaelSoft/custom_snippets/'
  normal! gvy
  let s:snippet = input('Snippet: ', @0)
  let s:snipKeyword = input('Keyword for the snip: ')
  let s:snipDescript = input('Description for the snip: ')
  let s:snipFiles = system('ls '.s:snipDir.'  | sed -n "/.*\.snippets/p"')
  let s:snipFiles = split(s:snipFiles)
  let s:snipMenu = []
  let s:snipMenuNum = 1
  for s:file in s:snipFiles
    call add(s:snipMenu, [s:snipMenuNum, s:file]) 
    let s:snipMenuNum+=1
  endfor
  echom 'Choose a file for the snippet to live in : '
  for s:menuItem in s:snipMenu 
    echom s:menuItem[0].' : '.s:menuItem[1]
  endfor
  let s:choice = input('choice: ')
  silent execute "!echo ' ' >> ".s:snipDir."".s:snipFiles[s:choice-1]
  silent execute "!echo 'snippet ".s:snipKeyword." \"".s:snipDescript."\"' >> ".s:snipDir."".s:snipFiles[s:choice-1]
  silent execute "!echo '".s:snippet."' >> ".s:snipDir."".s:snipFiles[s:choice-1]
  silent execute "!echo endsnippet >> ".s:snipDir."".s:snipFiles[s:choice-1]
  :redraw!
endfunction

" completor
let g:completor_auto_trigger = 0
" enables auto complete on php
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
let g:UltiSnipsListSnippets = "<C-L>"
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
" let g:syntastic_typescript_checkers = ['tslint']
" Syntastic recommended default settings
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
command! E Explore
let g:syntastic_loc_list_height = 5
" vdebug with xdebug options
" let g:vdebug_options = {}
" let g:vdebug_options["debug_file"] = "~/vdebug.log"
" let g:vdebug_options["debug_file_level"] = 2
" let g:vdebug_options["port"] = 9000
" let g:vdebug_options["path_maps"] = {"/var/www/html/repos/" : "/Users/mrobertson/vms/dev/repos/"}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call plugin 
nnoremap <Leader>mas :call MakeAsync()<CR>
" convert JS function to fat arrow function
nnoremap <Leader>> :call ConvertFunctionToFatArrow()<CR>
" quick add snippets
vnoremap <C-Z> y:call AddQuickSnippet()<CR>
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
" nnoremap <Leader>ST :SyntasticToggleMode<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-file short cuts
" php
augroup phpShortCuts
  autocmd!
  autocmd FileType php nnoremap <buffer> <Leader>epar :vsp ./app/config/parameters.yml<CR>
  autocmd FileType php nnoremap <buffer> <Leader>san :vsp ./src/APIBundle/Controller/TestingController.php<CR>
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-quick commands
nnoremap <Leader>err :call RepositionErrors()<CR>
function! RepositionErrors()
  let save_cursor = getcurpos()
  let save_window = win_getid()
  execute "normal! \<C-W>b\<C-W>J"
  if line('$') > 10
    resize 10
  else
    execute "resize ".line('$')
  endif
  call win_gotoid(save_window)
  call setpos('.', save_cursor)
endfunction
" help when in vim script
augroup vimHelp
  autocmd!
  autocmd FileType vim nnoremap <buffer> K :execute "help ".expand('<cword>')<CR>
augroup END
" list functions help
nnoremap <Leader>lf :execute "help list-functions"<CR><C-W>H
" completion
inoremap <buffer> <C-C> <C-R>=MRComplete(g:MRCdefinitionsPHP)<CR>
inoremap <C-v> <C-x><C-o>
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
nnoremap <C-n> :set number! relativenumber!<CR>
nnoremap ZX :q<CR>
nnoremap XC :q!<CR>
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
nnoremap <Leader>gref :grep -R ",./" ~/.vim/michaelSoft/references<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
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
nnoremap <Leader>vcom :!cd ~ && sudo git add .vimrc && sudo git add .vim/michaelSoft/* -f && sudo git commit -m "updating"<CR>
nnoremap <Leader>vup :!cd ~ && sudo git add .vimrc && sudo git add .vim/michaelSoft/* -f && sudo git commit -m "updating" && sudo git push github master<CR>
nnoremap <Leader>vps :!cd ~ && git push github master<CR>
nnoremap <Leader>vsy :!cd ~ && sudo git pull github master<CR>
nnoremap <Leader>v :!cd ~ && sudo git pull github master<CR>
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-source custom plugins
execute "source ".$HOME."/.vim/michaelSoft/ViSql/ViSql.vim"
execute "source ".$HOME."/.vim/michaelSoft/symfony/symfonyTools.vim"
execute "source ".$HOME."/.vim/michaelSoft/mrComplete/mrComplete.vim"
execute "source ".$HOME."/.vim/michaelSoft/fun/ish.vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-source project specific
execute "source ".$HOME."/.vim/michaelSoft/projectSpecific/nodeCCP/nodeCCP.vim"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-load custom plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call script
nnoremap <Leader>for :call FormatPage()<CR>
nnoremap <Leader>ete :call EditJSTestFile()<CR>
nnoremap <Leader>sim :call SortImportStatements()<CR>
nnoremap <Leader>reg :call SaveToRegister()<CR>

" delete non active buffers
" nnoremap <Leader>dbu :call DeleteNonActiveBuffers()<CR>
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


" Symfony tools
augroup symfonyTools
  au!
  au BufEnter *.php nnoremap <Leader>imp :call SetUpSymfonyAutoImport()<CR>
  au BufEnter *.php nnoremap <Leader>ser :silent! call SetUpSymfonyServices()<CR>
  au BufEnter *.php nnoremap <Leader>fse :silent call FindSymfonyServiceFiles()<CR>
  au BufEnter *.php nnoremap <Leader>fcl :call FindSymfonyClass()<CR>
augroup END
"typescript tools
augroup typescriptTools
  au!
  au BufEnter *.ts nnoremap <Leader>imp :TsuImport<CR>
  au BufEnter *.ts nnoremap <Leader>fix :TsuQuickFix<CR>
augroup END
" games
" nnoremap <Leader>gte :cal <SNR>15_Main()<CR>
" nnoremap <Leader>gsn :call Snake()<CR>
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
nnoremap <Leader>fr :call FindAndReplaceRange()<CR>
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
" quickly make a funciton async
function! MakeAsync()
  let save_cursor = getcurpos()
  execute "normal! ?(.*=>\<CR>"
  if match(getline('.'), 'async') == -1
    execute "normal! iasync "
  else 
    execute "normal! ?async\<CR>daw"
  endif
  call setpos('.', save_cursor)
endfunction

" quick format the page
function! FormatPage()
  let save_cursor = getcurpos()
  execute "normal! gg=G"
  call setpos('.', save_cursor)
endfunction
fun! ToggleConstLet()
  if match(getline('.'), '\s*let') > -1
    execute 's/let/const/'
  elseif match(getline('.'), '\s*const') > -1
    execute 's/const/let'
  elseif match(getline('.'), '\s*var') > -1
    execute 's/var/let'
  else
    echom "No let or const"
  endif
endf

function! ToggleWrapInConsoleLog()
  if match(getline('.'), "console\.log") > -1
    echom "truth"
    execute "normal! 0df($F)DA;\<ESC>=="
  else
    if match(getline('.'), ";") > -1
      s/;//g
    endif
    execute "normal! Iconsole.log(\<ESC>A);\<ESC>=="
  endif
endfunction
function! ConvertFunctionToFatArrow()
  execute "normal $?function\<CR>dt(%a\<Space>=>"
endfunction

function! EditJSTestFile()
  " config
  let s:testSuffix = '_spec'
  let s:sourceDir = 'src'
  let s:testDir = 'test'
  """"""""""""""""""""
  let s:filePath = expand('%:h')
  let s:file = expand('%:t:r')
  let s:extention = expand('%:e')
  let s:rootDir = split(s:filePath, '/')[0]
  if s:rootDir == s:testDir
    let s:switchPath = substitute(s:filePath, s:rootDir, s:sourceDir, '')
    let s:switchFile = substitute(s:file, s:testSuffix, '', '')
    silent! execute '!mkdir -p '.s:switchPath
    silent! execute '!touch '.s:switchPath.'/'.s:switchFile.'.ts'
    silent! execute 'e '.s:switchPath.'/'.s:switchFile.'.ts'
    redraw!
  else
    let s:switchPath = substitute(s:filePath, s:rootDir, s:testDir, '')
    let s:switchFile = substitute(s:file, '\(.*\)', '\1'.s:testSuffix, '')
    silent! execute '!mkdir -p '.s:switchPath
    silent! execute '!touch '.s:switchPath.'/'.s:switchFile.'.ts'
    silent! execute 'e '.s:switchPath.'/'.s:switchFile.'.ts'
    redraw!
  end
endfunction
function! SortImportStatements()
  let save_cursor = getcurpos()
  execute "normal! gg"
  let s:line = getline('.')
  if match(s:line, 'import') > -1
    let s:startLine =  line('.')
  else
    silent execute "normal! /import\<CR>"
    let s:startLine =  line('.')
  endif
  while match(getline('.'), '\(import\|^\s*$\)') > -1
    normal! j
  endwhile
  execute "normal! ?^\s\*import\<CR>"
  let s:endLine = line('.')
  " echom ":".s:startLine.",".s:endLine." sort\<CR>"
  let quote = '"'
  execute s:startLine.",".s:endLine."sort i'".quote."'"
  execute s:startLine.','.s:endLine.'g/"\.\//m'.s:endLine
  execute s:startLine.','.s:endLine.'g/"\.\.\//m'.s:endLine
  call setpos('.', save_cursor)
endfunction
" move a register from common to a saved register
function! SaveToRegister()
  echom 'Register: '
  let s:charNum = getchar()
  let s:reg = nr2char(s:charNum)
  execute 'let @'.s:reg.'=@"'
  echo "Saved to register @".s:reg
endfunction
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
function! ConvertToSnakeCase()
  s/\([A-Z]\)/_\l\1/g
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-TODO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-TESTING

" source /home/vagrant/.vim/michaelSoft/nodeDebug/debug.vim
nnoremap <Leader>zz :call TSRelativePathComplete()<CR>
" fyi this only supports one path for each module e.g.
"             "paths": {
"this--->         "entities/*": ["./src/shared/entities/*"],
"not this--->     "models/*": ["./src/shared/models/*", "./src/shared/models2/*"]
"              },
function! TSRelativePathComplete()
  " find all classes that have a path in tsconfig
  let s:tsconfig = system("cat ./tsconfig.json")
  let s:jsonTsconfig = json_decode(s:tsconfig)
  let s:paths = get(get(s:jsonTsconfig, "compilerOptions"), "paths")
  let s:listPaths = values(s:paths)
  let s:fileMatrix = []
  for s:path in s:listPaths
    let s:tsFiles = systemlist("find ".s:path[0]." | grep .ts")
    echom string(s:tsFiles)
    let s:tsFiles = systemlist("find ".s:path[0]." | grep .ts | xargs grep 'export'")
    echom string(s:tsFiles)
    for s:file in s:tsFiles
      call add(s:fileMatrix, [s:path[0], s:file])
    endfor
  endfor

  " echom string(s:fileMatrix)
  " let s:importWord = expand(<cword>)
  " echom s:importWord
endfunction

" source /home/vagrant/.vim/michaelSoft/nodeDebug/debug.vim
nnoremap <Leader>dbs :call StartDebugSession()<CR>
nnoremap <Leader>dbw :call GoToDebugWindow()<CR>
nnoremap <Leader>dbc :call CloseDebugSession()<CR>

nnoremap <Leader>qq :call TESTING()<CR>
nnoremap <Leader>ST :call ToggleAle()<CR>
function! ToggleAle()
  if g:ale_enabled == 1
    let g:ale_enabled = 0
    echom "ALE off"
  else 
    let g:ale_enabled = 1
    echom "ALE on"
  endif
endfunction
