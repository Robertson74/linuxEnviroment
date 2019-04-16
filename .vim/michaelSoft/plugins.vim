set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"let Vundle manage Vundle, required
" 
Plugin 'VundleVim/Vundle.vim'
""" JS STUFF --------------------------
""" Typescript ----
" jsx highlight/syntax
Plugin 'mxw/vim-jsx'
" Plugin 'chemzqm/vim-jsx-improve'
" " All sorts of typescript stuff
" Plugin 'Quramy/tsuquyomi'
" " type script syntax highlighting
Plugin 'leafgarland/typescript-vim'
" " snips and syntax
Plugin 'HerringtonDarkholme/yats.vim'
" " tsx stuff MUST BE LAST TYPESCRIPT PLUGIN LOADED
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
" Plugin 'ternjs/tern_for_vim'
"  auto import
" Plugin 'Galooshi/vim-import-js'
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
" Plugin 'm2mdas/phpcomplete-extended'
" Plugin 'm2mdas/phpcomplete-extended-symfony'
" Twig smyntax
Plugin 'lumiliet/vim-twig'
" PHP Debugger
" Plugin 'joonty/vdebug'
" php documenter 
" Plugin 'tobyS/vmustache'
" PHP unit testing
" Plugin 'joonty/vim-phpunitqf'
" dictionary
""" no online help
" let g:php_manual_online_search_shortcut = "<C-q>"
" Plugin 'alvan/vim-php-manual'
""" TOOLS -----------------------------
" expand slection
Plugin 'terryma/vim-expand-region'
" LSP
" Plugin 'neoclide/coc.nvim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'ryanolsonx/vim-lsp-typescript'
Plugin 'ryanolsonx/vim-lsp-javascript'
Plugin 'Shougo/neco-vim'
Plugin 'prabirshrestha/asyncomplete-necovim.vim'
Plugin 'prabirshrestha/asyncomplete-tscompletejob.vim' " completor for typescript
" hex color preview
Plugin 'etdev/vim-hexcolor'
" stack overflow 
" Plugin 'james9909/stackanswers.vim'
" todo manager
" Plugin 'vitalk/vim-simple-todo'
" visual representation of cursor in document
" Plugin 'gcavallanti/vim-noscrollbar'
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
" Plugin 'maralla/completor.vim'
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
" Plugin 'Asheq/close-buffers.vim'
" highlight ex command ranges
Plugin 'xtal8/traces.vim'
" persistent undo warnings
Plugin 'Carpetsmoker/undofile_warn.vim'
" autocomplete for quotes and the like
" Plugin 'raimondi/delimitmate'
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

""" DEPENDENCIES ------------------------
""" Trials ----------------------------
"---------------------------------------
" END OF PLUGINS
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call plugin 
""""""""""""""Close Buffers
nnoremap <Leader>buf :CloseBuffers<CR>
""""""""""""""color schemes
" IDK WHY BUT THESE SETTING FIX A LOT OF COLOR SCHEMES
let g:defaultColorscheme="forneus"
" let g:defaultColorscheme="cobalt2"
execute "colorscheme ".g:defaultColorscheme
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
let g:colorscheme_switcher_define_mappings = 0
let g:colorscheme_switcher_keep_background = 1
nnoremap <f8> :RandomColorScheme<CR> <BAR> :hi NonText ctermbg=NONE<CR> <BAR> :hi Normal ctermbg=NONE<CR> <BAR> :colorscheme<CR>
"ocolorscheme late_evening
" hi TabLinesel ctermfg=magenta ctermbg=black
" hi Constant ctermfg=217 ctermbg=black
" hi String ctermfg=217 ctermbg=black
" hi LineNr ctermbg=black
" hi EndOfBuffer ctermbg=black
" hi ColorColumn ctermbg=black ctermfg=red
let &colorcolumn=join(range(101,999),",")
hi ColorColumn ctermbg=black
hi ColorColumn ctermfg=red
""""""""""""""undo file warm 
let g:undofile_warn_mode=2
""""""""""""""ale 
nnoremap <Leader>ST :ALEToggle<CR>:echom "ALE is ".g:ale_enabled<CR>
let g:ale_lint_on_text_changed = 0
let alt_lint_on_text_changed = 0
let g:ale_linters = { 'typescript': ['tslint', 'tsserver'] }
""""""""""""""PHPDoc
nnoremap <Leader>PD :call pdv#DocumentWithSnip()<CR>
""""""""""""""Ultrasnips
set rtp+=~/.vim/michaelSoft/
let g:snips_author="Michael Robertson"
let g:UltiSnipsExpandTrigger = "<C-Z>"
let g:UltiSnipsListSnippets = "<C-L>"
let g:UltiSnipsJumpForwardTrigger = "<C-J>"
let g:UltiSnipsJumpBackwardTrigger = "<C-K>"
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsSnippetDirectories = [ $HOME.'/.vim/michaelSoft/custom_snippets/' ]
" let g:UltiSnipsSnippetDirectories=["custom_snippets"]
let g:UltiSnipsEditSplit = "vertical"
""""""""""""""Control P
let g:ctrlp_custom_ignore = '\v[\/]\.(docs)$'
let g:user_command_async=1
""""""""""""""NERD Tree
let NERDTreeWinSize=50
let NERDTreeQuitOnOpen=1
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
"""""""""""""" COC
" augroup lspCommands
"   au!
"   inoremap <silent><expr> <c-v> coc#refresh()
"   nmap <silent> <Leader>gd <Plug>(coc-definition)
"   nmap <silent> <Leader>gy <Plug>(coc-type-definition)
"   nmap <silent> <Leader>gi <Plug>(coc-implementation)
"   nmap <silent> <Leader>gr <Plug>(coc-references)
"   nmap <silent> <Leader>ren <Plug>(coc-rename)
"   nmap <silent> <Leader>fix <Plug>(coc-codeaction)
"   nmap <silent> <Leader>cc <Plug>(coc-diagnostic-info)
"   nnoremap <silent> <space>dl  :<C-u>CocList diagnostics<cr>
"   nmap <silent> <Leader>, <Plug>(coc-diagnostic-prev)
"   nmap <silent> <Leader>. <Plug>(coc-diagnostic-next)
"   nmap <silent> <Leader>cl <Plug>(coc-codelens-action)
"   nnoremap <silent> K :call <SID>show_documentation()<CR>
" augroup END
" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"""""""""""""" LSP
" NPM INSTALL FOR LANGUAGE SPECIFIC SERVER
" npm install -g vscode-css-languageserver-bin
" npm -g install intelephense-server
" npm install -g typescript typescript-language-server
imap <c-v> <Plug>(asyncomplete_force_refresh)
let g:asyncomplete_auto_completeopt=1
set completeopt+=preview
augroup lspCommands
  au!
  nnoremap <Leader>fix :LspCodeAction<CR>
  nnoremap <Leader>cc :LspDocumentDiagnostics<CR>
  nnoremap <Leader>cd :cclose<CR>
  nnoremap <Leader>sgd :vsplit<CR>:LspDefinition<CR>
  nnoremap <Leader>gd :LspDefinition<CR>
  nnoremap <Leader>gr :LspReferences<CR>
  nnoremap <Leader>ren :LspRename<CR>
  nnoremap <Leader>st :LspStatus<CR>
  nnoremap KK :LspHover<CR>
  nnoremap KL :pclose<CR>
augroup END
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "j"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "k"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" for asyncomplete.vim log
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/.vim/logs/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/.vim/logs/asyncomplete.log')
"""""""""""""" Easy Motions
nmap <Leader><Leader>o <Plug>(easymotion-overwin-w)

