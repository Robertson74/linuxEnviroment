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
" Plugin 'mxw/vim-jsx'
" Plugin 'chemzqm/vim-jsx-improve'
" " All sorts of typescript stuff
" Plugin 'Quramy/tsuquyomi'
" " type script syntax highlighting
Plugin 'leafgarland/typescript-vim'
" " snips and syntax
Plugin 'HerringtonDarkholme/yats.vim'
" " tsx stuff MUST BE LAST TYPESCRIPT PLUGIN LOADED
Plugin 'ianks/vim-tsx'
" Debug
" Plugin 'vim-vdebug/vdebug'
" --------
"  auto imports
Plugin 'Galooshi/vim-import-js'
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
Plugin 'pangloss/vim-javascript'
""" RUBY/RAILS ------------------------
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-rails'
""" HTML STUFF ------------------------
" ejs syntax
Plugin 'nikvdp/ejs-syntax'
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
" COC
Plugin 'neoclide/coc.nvim'
Plugin 'Shougo/echodoc.vim'
" LSP
" Plugin 'prabirshrestha/asyncomplete.vim'
" Plugin 'prabirshrestha/async.vim'
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'prabirshrestha/asyncomplete-lsp.vim'
" Plugin 'ryanolsonx/vim-lsp-typescript'
" Plugin 'ryanolsonx/vim-lsp-javascript'
" Plugin 'Shougo/neco-vim'
" Plugin 'prabirshrestha/asyncomplete-necovim.vim'
" Plugin 'prabirshrestha/asyncomplete-tscompletejob.vim' " completor for typescript
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
" Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'
" Plugin 'itchyny/lightline.vim'
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
" Plugin 'w0rp/ale'
" Fuzzy file finder
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
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
Plugin 'bignimbus/pop-punk.vim'
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
" let g:defaultColorscheme="behelit"
" let g:defaultColorscheme="forneus"
" let g:defaultColorscheme="cobalt2"
let g:defaultColorscheme="northsky"
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
" nnoremap <Leader>AT :ALEToggle<CR>:echom "ALE is ".g:ale_enabled<CR>
" let g:ale_lint_on_text_changed = 1
" let g:ale_linters = {
"       \ 'typescript': ['tslint', 'tsserver'],
"       \ 'javascript': ['eslint'],
"       \ }
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
let g:coc_node_path = '/Users/michael.robertson/.nvm/versions/node/v12.1.0/bin/node'
" let g:coc_node_path = '/Users/michaelrobertson/.nvm/versions/node/v12.2.0/bin/node'
" let g:coc_node_path = systemlist('which node')[0]
augroup cocCommands
  au!
  inoremap <silent><expr> <c-v> coc#refresh()
  nmap <silent> <Leader>gd <Plug>(coc-definition)
  nmap <silent> <Leader>gy <Plug>(coc-type-definition)
  nmap <silent> <Leader>gi <Plug>(coc-implementation)
  nmap <silent> <Leader>gr <Plug>(coc-references)
  nmap <silent> <Leader>ren <Plug>(coc-rename)
  nmap <silent> <Leader>fix <Plug>(coc-codeaction)
  nmap <silent> <Leader>cc <Plug>(coc-diagnostic-info)
  nnoremap <silent> <space>di  :<C-u>CocList diagnostics<cr>
  nmap <silent> <Leader>, <Plug>(coc-diagnostic-prev)
  nmap <silent> <Leader>. <Plug>(coc-diagnostic-next)
  " nmap <silent> <Leader>cl <Plug>(coc-codelens-action)
  nnoremap <silent> KK :call <SID>show_documentation()<CR>
  nnoremap <silent> KL :pclose<CR>
augroup END
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
" echo doc
set cmdheight=2
set noshowmode
let g:echodoc_enable_at_startup = 1
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" To make <cr> select the first completion item and confirm the completion when no item has been selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Fix autofix problem of current line
nmap KJ :call CocActionAsync('showSignatureHelp')<CR>
nmap <leader>qf  <Plug>(coc-fix-current)
"""""""""""""" Easy Motions
nmap <Leader><Leader>o <Plug>(easymotion-overwin-w)

"""""""""""""" TESTING AREA
Plugin 'metakirby5/codi.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    TODO                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>2dl :CocList todolist<cr>
nnoremap <leader>2da :CocCommand todolist.create<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    MISC                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal=0 " don't conceal json quotes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Lazy Git                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>LG :!lazygit<cr>
nnoremap <leader>gito :!git open<cr>
