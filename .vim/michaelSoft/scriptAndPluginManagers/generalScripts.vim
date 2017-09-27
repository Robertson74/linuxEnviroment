""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Call Scripts                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command results to new buffer
nnoremap <Leader>cmd :call CommandToNewBuffer()<CR>
" Context Searching
nnoremap <Leader>csl :call SearchContextually("local")<CR>
nnoremap <Leader>csg :call SearchContextually("global")<CR>
" temporary line highlights
nnoremap <Leader>tsp :call PlaceTempSign()<CR>
nnoremap <Leader>tsr :call RemoveTempSign()<CR>
"my first bind
nnoremap <Leader>bl :call FlipBoolean()<CR>
" Temp areas
nnoremap <Leader>tap :call PlaceTempArea()<CR>
nnoremap <Leader>tar :call RemoveTempArea()<CR>
" Easier window resizing
nnoremap <Leader>res :silent call ResizeWindow()<CR>
" move a register from common to a saved register
nnoremap <Leader>reg :call SaveToRegister()<CR>
" zooming
nnoremap <Leader>zz :call ToogleZoomSplit()<CR>
nnoremap <Leader>zh :call ToogleZoomHorizontal()<CR>
nnoremap <Leader>zv :call ToogleZoomVertical()<CR>
" quick add snippet
vnoremap <C-Z> y:call AddQuickSnippet()<CR>
" quick reposition errors
nnoremap <Leader>err :call RepositionErrors()<CR>
" toggle between 4 and 2 spaces for a tab
nnoremap <Leader>tabs :call ToggleTabSpaces()<CR>
" quick format a page
nnoremap <Leader>for :call FormatPage()<CR>
vnoremap <Leader>fj v:call FormatJSON()<CR>
nnoremap <Leader>rm :silent call RemoteManipulate()<CR>
" set a new top line
nnoremap<Leader>nt :call MakeTop()<CR>
nnoremap <Leader>rep :call FindAndReplaceRange()<CR>
" Mark and move windows
nnoremap <Leader>mwp :call MarkWindow()<CR>
nnoremap <Leader>mwr :call UnMarkWindow()<CR>
nnoremap <Leader>mwm :call MoveWindowToTab()<CR>
"repetitive strings 
nnoremap <Leader>rli :call RepetitiveLines()<CR>
nnoremap <Leader>rst :call RepetitiveString()<CR>
" Caps as targets
nnoremap Q :silent call MoveToPreviousCap()<CR>
nnoremap <BAR> :silent call MoveToNextCap()<CR>
nnoremap dic :call DeleteInsideCaps()<CR>
nnoremap cic :call ChangeInsideCaps()<CR>
nnoremap dc :call DeleteToCap()<CR>
nnoremap cc :call ChangeToCap()<CR>
nnoremap <Leader>cam :call ConvertToCammel()<CR>
"extending windows
nnoremap<Leader>ewu :call ExtendScreenUp()<CR>
nnoremap<Leader>ewd :call ExtendScreenDown()<CR>
nnoremap<Leader>ewc :call CloseScreenExtend()<CR>
nnoremap<Leader>hii :call HighlightGroupIdentify()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Load Scripts                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/michaelSoft/scripts/generalScripts/CommandToNewBuffer.vim
source ~/.vim/michaelSoft/scripts/generalScripts/HighlightGroupIdentify.vim
source ~/.vim/michaelSoft/scripts/generalScripts/SearchContextually.vim
source ~/.vim/michaelSoft/scripts/generalScripts/TempSigns.vim
source ~/.vim/michaelSoft/scripts/generalScripts/FlipBoolean.vim
source ~/.vim/michaelSoft/scripts/generalScripts/TempAreas.vim
source ~/.vim/michaelSoft/scripts/generalScripts/ExtendWindows.vim
source ~/.vim/michaelSoft/scripts/generalScripts/ResizeWindow.vim
source ~/.vim/michaelSoft/scripts/generalScripts/CapsTarget.vim
source ~/.vim/michaelSoft/scripts/generalScripts/RepetitiveString.vim
source ~/.vim/michaelSoft/scripts/generalScripts/RepetitiveLines.vim
source ~/.vim/michaelSoft/scripts/generalScripts/MarkMoveWindows.vim
source ~/.vim/michaelSoft/scripts/generalScripts/FindAndReplaceRange.vim
source ~/.vim/michaelSoft/scripts/generalScripts/MakeTop.vim
source ~/.vim/michaelSoft/scripts/generalScripts/RemoteManipulate.vim
source ~/.vim/michaelSoft/scripts/generalScripts/FormatJSON.vim
source ~/.vim/michaelSoft/scripts/generalScripts/Zooming.vim
" move a register from common to a saved register
source ~/.vim/michaelSoft/scripts/generalScripts/SaveToRegister.vim
" quick adding snippets
source ~/.vim/michaelSoft/scripts/generalScripts/AddQuickSnippet.vim
" reposition quick fix error screen
source ~/.vim/michaelSoft/scripts/generalScripts/RepositionErrors.vim
" ishness
source ~/.vim/michaelSoft/scripts/generalScripts/ish.vim
" list out and navigate to language specific configuration
source ~/.vim/michaelSoft/scripts/generalScripts/editLangaugeConfig.vim
" Toggle between tabs being four spaces or two
source ~/.vim/michaelSoft/scripts/generalScripts/ToggleTabSpaces.vim
" quick format the page
source ~/.vim/michaelSoft/scripts/generalScripts/FormatPage.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         General Navigation                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" edit main vim director 
nnoremap <Leader>evim :vsplit ~/.vim/michaelSoft/<CR>
" edit plugins file
nnoremap <Leader>epl :vsplit ~/.vim/michaelSoft/plugins.vim<CR>
" edit plugins file
nnoremap <Leader>ebu :vsplit ~/.vim/bundle/<CR>
" edit scripts
nnoremap <Leader>escr :vsplit ~/.vim/michaelSoft/scripts/<CR>
" quick edit config
nnoremap <Leader>econf :vsplit ~/.vim/michaelSoft/vimConfiguration.vim<CR>
" list functions help
nnoremap <Leader>lf :execute "help list-functions"<CR><C-W>H
" edit language specific config
nnoremap <Leader>elan :call EditLanguageConfig()<CR>
" edit reference files
nnoremap <Leader>eref :tabnew ~/.vim/michaelSoft/references<CR>
nnoremap <Leader>fref :find ~/.vim/michaelSoft/references/*
nnoremap <Leader>vsan :vsplit +e ~/.vim/michaelSoft/sandbox.vim<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Remaps                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" completion remaps
inoremap <C-v> <C-x><C-o>
inoremap <C-f> <C-x><C-l>
inoremap <C-p> <C-x><C-p>
inoremap <C-n> <C-x><C-n>
" pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-t> <C-w>t
nnoremap <C-b> <C-w>b
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           QUICK SCRIPTS                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rotate parameters in parenthesis
nnoremap <Leader>rk :execute "normal! va(<C-v><esc>dF,%pa, <C-v><esc>F,;xxh%"<CR>
nnoremap <Leader>rj :execute "normal! va(<C-v><esc>%ldf,h%i, <C-v><esc>px%lxh%"<CR>
" quickly duplicate line
nnoremap <Leader>dl :Commentary<CR>:norm! YP<CR>:Commentary<CR>
" toggle modifiable 
nnoremap <Leader>mod :set modifiable!<CR>
" toggle format pasting
nnoremap <Leader>pas :set paste!<CR>
nnoremap <C-n> :set number! relativenumber!<CR>
nnoremap ZX :q<CR>
nnoremap ZC :q!<CR>
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
" Toggle xdebug/server
nnoremap <Leader>rs :!sudo service apache2 restart<CR>
nnoremap <Leader>txd :!bash ~/scripts/toggleXDebug.sh<CR>
" scrap buffer
nnoremap <Leader>jun1 :tabnew +e ~/temp/junk<CR>
nnoremap <Leader>jun2 :tabnew +e ~/temp/junk2<CR>
nnoremap <Leader>jun3 :tabnew +e ~/temp/junk3<CR>
nnoremap <Leader>jun4 :tabnew +e ~/temp/junk4<CR>
nnoremap <Leader>jun5 :tabnew +e ~/temp/junk5<CR>
