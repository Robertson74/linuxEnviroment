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
""" Typescript ----
" jsx highlight/syntax
Plugin 'chemzqm/vim-jsx-improve'
" All sorts of typescript stuff
Plugin 'Quramy/tsuquyomi'
" type script syntax highlighting
Plugin 'leafgarland/typescript-vim'
" snips and syntax
Plugin 'HerringtonDarkholme/yats.vim'
" tsx stuff MUST BE LAST TYPESCRIPT PLUGIN LOADED
Plugin 'ianks/vim-tsx'
" --------
" JS Doc
Plugin 'othree/jsdoc-syntax.vim'
Plugin 'heavenshell/vim-jsdoc'
" ANGULAR 2 CLI integration
Plugin 'bdauria/angular-cli.vim'
" Syntax for template strings
Plugin 'Quramy/vim-js-pretty-template'
" Tern/JS autocomplete
Plugin 'ternjs/tern_for_vim'
"  auto import
Plugin 'Galooshi/vim-import-js'
" Plugin 'pangloss/vim-javascript'
""" HTML STUFF ------------------------
" jade syntax
Plugin 'digitaltoad/vim-pug'
" html quick develop
Plugin 'mattn/emmet-vim'
" html5 autocomplete
Plugin 'othree/html5.vim'
""" PHP STUFF -------------------------
" php autocomplete
Plugin 'shawncplus/phpcomplete.vim'
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
" todo manager
Plugin 'vitalk/vim-simple-todo'
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
" manage buffers
Plugin 'Asheq/close-buffers.vim'
" highlight ex command ranges
Plugin 'xtal8/traces.vim'
" persistent undo warnings
Plugin 'Carpetsmoker/undofile_warn.vim'
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
Plugin 'xolox/vim-misc'
" NERDTREE
Plugin 'scrooloose/nerdtree'
" Plugin 'jceb/vim-orgmode'
""" AESTHETICS ------------------------
" color schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'chr4/jellygrass.vim'
Plugin 'xolox/vim-colorscheme-switcher'

""" FUN -------------------------------
"---------------------------------------
" END OF PLUGINS
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call plugin 
""""""""""""""ToDo
" disable defaults by default
let g:simple_todo_map_keys = 0
augroup ToDoConfig
  au!
  au bufenter *.todo nmap <buffer> <leader>i <Plug>(simple-todo-new)
  au bufenter *.todo nmap <buffer> <leader>I <Plug>(simple-todo-new-start-of-line)
  au bufenter *.todo nmap <buffer> <leader>o <Plug>(simple-todo-below)
  au bufenter *.todo nmap <buffer> <leader>O <Plug>(simple-todo-above)
  au bufenter *.todo nmap <buffer> <leader>x <Plug>(simple-todo-mark-as-done)
  au bufenter *.todo nmap <buffer> <leader>X <Plug>(simple-todo-mark-as-undone)
  au bufenter *.todo nmap <buffer> <leader>s <Plug>(simple-todo-mark-switch)
  au bufenter *.todo nmap <buffer> <leader>nd 
        \:call PortUnCompletedToDosToNewDay()<CR>
augroup END
""""""""""""""Close Buffers
nnoremap <Leader>buf :CloseBuffers<CR>
""""""""""""""color schemes
nnoremap <f8> :RandomColorScheme<CR>
" colorscheme jellygrass
" colorscheme late_evening
" hi TabLinesel ctermfg=magenta ctermbg=black
" hi Constant ctermfg=217 ctermbg=black
" hi String ctermfg=217 ctermbg=black
" hi LineNr ctermbg=black
" hi EndOfBuffer ctermbg=black
" hi ColorColumn ctermbg=black ctermfg=red
""""""""""""""undo file warm 
let g:undofile_warn_mode=2
""""""""""""""ale 
nnoremap <Leader>ST :ALEToggle<CR>:echom "ALE is ".g:ale_enabled<CR>
let g:ale_lint_on_text_changed = 0
let alt_lint_on_text_changed = 0
let g:ale_linters = { 'typescript': ['tslint', 'tsserver'] }
""""""""""""""completor
let g:completor_auto_trigger = 0
""""""""""""""PHPDoc
nnoremap <Leader>PD :call pdv#DocumentWithSnip()<CR>
""""""""""""""Ultrasnips
let g:snips_author="Michael Robertson"
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
let g:UltiSnipsExpandTrigger = "<C-Z>"
let g:UltiSnipsListSnippets = "<C-L>"
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.vim/michaelSoft/custom_snippets']
""""""""""""""Control P
let g:ctrlp_custom_ignore = '\v[\/]\.(docs)$'
let g:user_command_async=1
""""""""""""""NERD Tree
let NERDTreeShowLineNumbers=1
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
