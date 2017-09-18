" QUICK COMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickly duplicate line
nnoremap <Leader>dl :Commentary<CR>:norm! YP<CR>:Commentary<CR>
" toggle modifiable 
nnoremap <Leader>mod :set modifiable!<CR>
" toggle format pasting
nnoremap <Leader>pas :set paste!<CR>
" completion remaps
inoremap <C-v> <C-x><C-o>
inoremap <C-f> <C-x><C-l>
inoremap <C-p> <C-x><C-p>
inoremap <C-n> <C-x><C-n>
" panenavigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-t> <C-w>t
nnoremap <C-b> <C-w>b
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GENERAL NAVIGATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" edit plugins 
nnoremap <Leader>epl :vsplit ~/.vim/michaelSoft/<CR>
" edit bundle
nnoremap <Leader>ebu :vsplit ~/.vim/bundle/<CR>
" list functions help
nnoremap <Leader>lf :execute "help list-functions"<CR><C-W>H
" vi sql
execute "source ".$HOME."/.vim/michaelSoft/scripts/ViSql/ViSql.vim"
" symfony tools
execute "source ".$HOME."/.vim/michaelSoft/symfony/symfonyTools.vim"
" mr completor
execute "source ".$HOME."/.vim/michaelSoft/mrComplete/mrComplete.vim"
" ishness
execute "source ".$HOME."/.vim/michaelSoft/fun/ish.vim"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CALL SCRIPTS
" list out and navigate to language specific files
execute "source".$HOME."/.vim/michaelSoft/scripts/listLanguageVimFiles.vim"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SCRIPTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle between tabs being four spaces or two
nnoremap <Leader>tabs :call ToggleTabSpaces()<CR>
function! ToggleTabSpaces()
  if exists("g:tabSpaces") && g:tabSpaces == 2
    set shiftwidth=4 tabstop=4
    echom "tabs 4 spaces"
    let g:tabSpaces = 4
  else
    set shiftwidth=2 tabstop=2
    echom "tabs 2 spaces"
    let g:tabSpaces = 2
  endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" reposition quick fix error screen
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle xdebug/server
nnoremap <Leader>rs :!sudo service apache2 restart<CR>
nnoremap <Leader>txd :!bash ~/scripts/toggleXDebug.sh<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrap buffer
nnoremap <Leader>jun1 :tabnew +e ~/temp/junk<CR>
nnoremap <Leader>jun2 :tabnew +e ~/temp/junk2<CR>
nnoremap <Leader>jun3 :tabnew +e ~/temp/junk3<CR>
nnoremap <Leader>jun4 :tabnew +e ~/temp/junk4<CR>
nnoremap <Leader>jun5 :tabnew +e ~/temp/junk5<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
