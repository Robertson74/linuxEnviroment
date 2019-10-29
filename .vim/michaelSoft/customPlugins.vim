""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Binds For Custom Pulgins                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visql
" nnoremap <Leader>dbf :call ViSqlGoToInterface()<CR> 
" nnoremap <Leader>dbn :call NewVISqlInterface('new', 'tab')<CR> 
" nnoremap <Leader>dbp :call NewVISqlInterface('last', 'tab')<CR> 
" nnoremap <Leader>dbtp :call NewVISqlInterface('lastTable', 'tab')<CR> 
" nnoremap <Leader>dbvn :call NewVISqlInterface('new', 'side')<CR> 
" nnoremap <Leader>dbvp :call NewVISqlInterface('last', 'side')<CR> 
" nnoremap <Leader>dbvtp :call NewVISqlInterface('lastsidele', 'side')<CR> 
" nnoremap <Leader>dbl :call ViSqlListSavedDBs('tab')<CR> 
" nnoremap <Leader>dbvl :call ViSqlListSavedDBs('side')<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Load Custom Plugins                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vi sql
" source ~/.vim/michaelSoft/customPlugins/ViSql/ViSql.vim
" symfony tools
" source ~/.vim/michaelSoft/symfony/symfonyTools.vim
" mr completor
" source ~/.vim/michaelSoft/customPlugins/mrComplete/mrComplete.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call script

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  EasyAng                                   "
source ~/.vim/michaelSoft/customPlugins/easyAng/easyAng.vim
nnoremap <Leader>ngst :call EditAngularFileType('component', 's')<CR> 
nnoremap <Leader>ngsc :call EditAngularFileType('css', 's')<CR> 
nnoremap <Leader>ngsh :call EditAngularFileType('html', 's')<CR> 
nnoremap <Leader>nget :call EditAngularFileType('component', 'e')<CR> 
nnoremap <Leader>ngec :call EditAngularFileType('css', 'e')<CR> 
nnoremap <Leader>ngeh :call EditAngularFileType('html', 'e')<CR> 
