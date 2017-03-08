"Super globals
:let g:visqlHost = '127.0.0.1'
:let g:visqlUser = 'root'
:let g:visqlPass = 'devdb'
:let g:visqlWindow = ''
:let g:visqlSavedDatabasesFile = '~/.vim/michaelSoft/ViSql/savedDatabases'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Start up functions
" start up a new interface
function! NewVISqlInterface(instance)
  " collect credentials or use previous ones depending on instance
  if (a:instance == 'new')
    if (ViSqlCollectCredentials() == 'false')
      return
    endif
  elseif (a:instance == 'last')
    if (g:visqlHost == '' || g:visqlUser == '')
      echom "No credentials stored"
      return
    endif
  endif
  if (ViSqlCheckCredentials(g:visqlHost, g:visqlUser, g:visqlPass) == 'false')
    :redraw!
    echom 'Invalid Credentials...'
    return
  endif
  :tabnew
  "set window id variable
  :let g:visqlWindow = win_getid()
  "initialize credentials
  :let w:visqlHost = g:visqlHost
  :let w:visqlUser = g:visqlUser
  :let w:visqlPass = g:visqlPass
  :let w:visqlDatabase = ''
  :call ViSqlSetGlobalBinds()
  " prep dabases variables
  :call ViSqlSetGlobalVariables()
  " go to the tables view
  :call ViSqlDatabaseListGoToView()
endfunction


" Collect credentials
function! ViSqlCollectCredentials()
  :let g:visqlHost = input('Mysql host: ', g:visqlHost)
  if (g:visqlHost == '') | return 'false' | endif
  :let g:visqlUser = input('Mysql user: ', g:visqlUser)
  if (g:visqlUser == '') | return 'false' | endif
  :let g:visqlPass = input('Mysql password: ', g:visqlPass)
  if (g:visqlPass == '') | return 'false' | endif
  return 'true'
endfunction

" check credentials
function! ViSqlCheckCredentials(host, user, password)
  :let s:query = "show databases;"
  :let s:connectResult = system("mysql -h ".a:host." -u ".a:user." -p".a:password."  --table -e '".s:query."'")
  if (match(s:connectResult, 'ERROR') > -1)
    return 'false'
  else
    return 'true'
  endif
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-Saved Databases
" List saved Databases
function! ViSqlListSavedDBs()
  :set modifiable
  :tabnew
  :execute "r! cat ".g:visqlSavedDatabasesFile
  :call ViSqlSetSavedDBsBinds()
  :normal! ggSDBName Host User Pass
  :%!column -t
  :normal! ggYpVr-
  :normal! j
  :set nomodifiable
endfunction

" saved databases binds
function! ViSqlSetSavedDBsBinds()
  if (line('$') != 2 || line('$') != 1)
    nnoremap <buffer> <CR> :call ViSqlLoadDatabase(line('.'))<CR>
  endif
  nnoremap <buffer> qq :bd!<CR>
  nnoremap <buffer> k :call ViSqlSavedDBsNoUp()<CR>:echo ''<CR>
  nnoremap <buffer> d :call ViSqlDeleteSavedDB(line('.') - 2)<CR>
  nnoremap <buffer> n :call ViSqlNewDatabase()<CR>
  nnoremap <buffer> s :call ViSqlSortSavedDbs()<CR>
endfunction

function! ViSqlSortSavedDbs()
  :set modifiable
  if (!exists('w:visqlSavedDbSortOrder'))
    :let w:visqlSavedDbSortOrder = 'ASC'
  endif
  if (w:visqlSavedDbSortOrder ==# 'ASC')
    :execute "3,$sort u"
    :let w:visqlSavedDbSortOrder = 'DESC'
  else
    :execute "3,$sort! u"
    :let w:visqlSavedDbSortOrder = 'ASC'
  endif
  :set nomodifiable
endfunction

function! ViSqlNewDatabase()
  :let s:validCreds = 'false'
  while s:validCreds ==# 'false'
    :echom 'Creating new database record' 
    :let s:newHost = input('New Database Host: ')
    if (s:newHost ==# '') | return | endif
    :let s:newUser = input('New Database Username: ')
    if (s:newUser ==# '') | return | endif
    :let s:newPass = input('New Database Password: ')
    if (s:newPass ==# '') | return | endif
    if ViSqlCheckCredentials(s:newHost, s:newUser, s:newPass) ==# 'true'
      :let s:validCreds = 'true'
      :call ViSqlSaveDatabase(s:newHost, s:newUser, s:newPass)
      :let s:currentWindow = win_getid()
      :silent! call ViSqlListSavedDBs()
      :let s:newWindow = win_getid()
      :call win_gotoid(s:currentWindow)
      :bd!
      :call win_gotoid(s:newWindow)
    else
      :echom ' '
      :echom 'Bad databases credentials'
    endif
  endwhile
endfunction

" Delete a saved DB
function! ViSqlDeleteSavedDB(deleteLine)
  :let s:dbName = split(getline('.'))[0]
  :let s:confirmDeleteValidate = 'false'
  while s:confirmDeleteValidate == 'false'
    :let s:confirmDeleteChoice = input('Delete database credentials for database '.s:dbName.' (y/n):')
    if (match(s:confirmDeleteChoice , '\(N\|NO\|No\|n\)') == 0)
      :let s:confirmDeleteValidate = 'abort'
    elseif (match(s:confirmDeleteChoice , '\(Y\|Yes\|y\|yes\)') == 0)
      :let s:confirmDeleteValidate = 'confirmed'
    elseif (s:confirmDeleteChoice  == '')
      :let s:confirmDeleteValidate = 'abort'
    else
      :echom ''
      :echom 'Try again...'
    endif
  endwhile
  if (s:confirmDeleteValidate == 'abort' || s:confirmDeleteValidate  == '')
    return
  endif
  :let s:deleteCommand = "sed -i '".a:deleteLine."d' ".g:visqlSavedDatabasesFile
  :let s:deleteResults = system(s:deleteCommand)
  :redraw!
  :echom s:dbName.' deleted, press enter to continue...'
  :let s:currentWindow = win_getid()
  :silent! call ViSqlListSavedDBs()
  :let s:newWindow = win_getid()
  :call win_gotoid(s:currentWindow)
  :bd!
  :call win_gotoid(s:newWindow)
endfunction

" don't allow cursosr to go to header line
function! ViSqlSavedDBsNoUp()
  if (line('.') != 2)
    normal! k
  endif
  :echom '123'
endfunction

" load a databse from the saved DB file
function! ViSqlLoadDatabase(dbFileLine)
  :let s:rawDBLine = systemlist('cat '.g:visqlSavedDatabasesFile)
  :echo s:rawDBLine
  :let s:dbLineList = split(s:rawDBLine[a:dbFileLine-3])
  :echo s:dbLineList
  :let g:visqlHost = s:dbLineList[1]
  :let g:visqlUser = s:dbLineList[2]
  :let g:visqlPass = s:dbLineList[3]
  :let s:currentWindow = win_getid()
  :call NewVISqlInterface('last')
  :let s:newWindow = win_getid()
  :call win_gotoid(s:currentWindow)
  :bd!
  :call win_gotoid(s:newWindow)
endfunction

" Save a database
function! ViSqlSaveDatabase(host, user, pass)
  :let s:validDBName = 'false'
  while s:validDBName == 'false'
    :let s:databaseName = input('Name for database at '.a:host.':')
    if (match(s:databaseName, ' ') > -1)
      :echom ' '
      :echom 'No spaces allowed...'
    else
      :let s:validDBName = 'true'
    endif
  endwhile
  :let s:saveString = 'echo '.s:databaseName.' '.a:host.' '.a:user.' '.a:pass.' >> '.g:visqlSavedDatabasesFile
  :let s:saveResults = system(s:saveString)
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-database functions
" go to database list view
function! ViSqlDatabaseListGoToView()
  :let w:visqlDatabaseListHelpIsOpen = 'false'
  " set binds
  :call ViSqlDatabaseListSetBinds()
  " draw view
  :call ViSqlDatabaseListDrawView()
  " set cursor to last known position
  :call ViSqlLastCursorPositionByTerm(w:visqlDatabase)
  :redraw!
  :echom "zz for help"
endfunction

" set binds for database list view
function! ViSqlDatabaseListSetBinds()
  " go to tables view for database
  :nnoremap <buffer> <CR> :call ViSqlDatabaseListLeaveCleanup()<CR>:call ViSqlTablesListGoToView(expand('<cword>'))<CR>
  :vnoremap <buffer> <CR> :call ViSqlDatabaseListLeaveCleanup()<CR>:call ViSqlTablesListGoToView(expand('<cword>'))<CR>
  " refresh
  :nnoremap <buffer> r :call ViSqlDatabaseListGoToView()<CR>
  :vnoremap <buffer> r :call ViSqlDatabaseListGoToView()<CR>
  " toggle help
  :nnoremap <buffer> zz :call ViSqlDatabaseListToggleHelp()<CR>
  :vnoremap <buffer> zz :call ViSqlDatabaseListToggleHelp()<CR>
  " Change the sort order
  :nnoremap <buffer> s :call ViSqlDatabaseListToggleSort()<CR>
  :vnoremap <buffer> s :call ViSqlDatabaseListToggleSort()<CR>
endfunction

" unbind databases view binds
function! ViSqlDatabaseListUnbinds()
  :unmap <buffer> <CR>
  :unmap <buffer> r
  :unmap <buffer> zz
  :unmap <buffer> s
endfunction

" Help open for database list
function! ViSqlDatabaseListOpenHelp()
  :set splitbelow
  :execute "normal! \<C-W>n"
  :execute "normal! \<C-W>j"
  :set modifiable
  :%d
  :setlocal nocursorline
  :execute "normal! I Database List View Help:\<CR>"
  :execute "normal! I Key          |   Description\<CR>"
  :execute "normal! I ----------------------------\<CR>"
  :execute "normal! I Arrow Keys   |   Move around\<CR>"
  :execute "normal! I Enter        |   Select Database\<CR>"
  :execute "normal! I r            |   Refresh Databases\<CR>"
  :execute "normal! I s            |   Sort alphabetically\<CR>"
  :execute "normal! I zz           |   Toggle Help"
  :normal gg
  :resize 11
  :let s:helpId = win_getid()
  :call win_gotoid(g:visqlWindow)
  :let w:visqlDatabaseListHelpId = s:helpId
  :let w:visqlDatabaseListHelpIsOpen = 'true'
endfunction

" main draw function for dababase list view
function! ViSqlDatabaseListDrawView()
  :set modifiable
  :%d
  :call ViSqlDatabaseListDrawContent()
  :call ViSqlDatabaseListDrawHeader()
  :execute "normal! gg/+\<CR>^jjjl"
  :execute "noh"
  :set nomodifiable
endfunction

" draw header for database list view
function! ViSqlDatabaseListDrawHeader()
  :let w:visqlDatabaseCount = ViSqlCountDatabases()
  :execute "normal! ggIVI SQL\<CR>Choose a database...\<CR>\<CR>"
  :execute "normal! IResults: ".w:visqlDatabaseCount."\<CR>"
  :execute "normal! ISorted by ".w:visqldatabaseListSortOrder
endfunction

" content for database list view
function! ViSqlDatabaseListDrawContent()
  :let s:query = "show databases;"
  :let w:visqlCurrentQuery = "mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass."  --table -e '".s:query."'"
  :let s:connectResult = system(w:visqlCurrentQuery)
  :put=s:connectResult
endfunction

" Count the number of databases
function! ViSqlCountDatabases()
  :let s:query = "select count(*) from information_schema.SCHEMATA "
  :let s:countResult = system("mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass."  -e '".s:query."'")
  :let s:count = split(s:countResult, '\n')[1]
  return s:count
endfunction

" Toggle sort order of databases
function! ViSqlDatabaseListToggleSort()
  :set modifiable
  :execute "normal! gg/+\<CR>jjj"
  :let s:topDataLine = line('.')
  :execute "normal! Gk"
  :let s:bottomDataLine = line('.')
  if (w:visqldatabaseListSortOrder == "DESC")
    :execute s:topDataLine.","s:bottomDataLine."sort! i"
    :let w:visqldatabaseListSortOrder = 'ASC'
  else
    :execute s:topDataLine.","s:bottomDataLine."sort i"
    :let w:visqldatabaseListSortOrder = 'DESC'
  endif
  :execute "normal gg/\\(ASC\\|DESC\\)\<CR>"
  :execute "normal! SSorted by ".w:visqldatabaseListSortOrder
  :execute "normal! jjjj^w"
  :set nomodifiable
endfunction

" Clean up all databases view before leaving the view
function! ViSqlDatabaseListLeaveCleanup()
  :call ViSqlDatabaseListUnbinds()
  :call ViSqlDatabaseListCloseHelp()
endfunction

function! ViSqlDatabaseListToggleHelp()
  if (w:visqlDatabaseListHelpIsOpen == 'true')
    :call ViSqlDatabaseListCloseHelp()
  else
    :call ViSqlDatabaseListOpenHelp()
  endif
endfunction

function! ViSqlDatabaseListCloseHelp()
  if (w:visqlDatabaseListHelpIsOpen == 'true')
    :call win_gotoid(w:visqlDatabaseListHelpId)
    :bd!
  endif
  :let w:visqlDatabaseListHelpIsOpen = 'false'
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-tables list functions
" main tables view entrance
function! ViSqlTablesListGoToView(database)
  :let w:visqlTablesListHelpIsOpen = 'false'
  :let w:visqlDatabase = a:database
  " set binds
  :call ViSqlTablesListSetBinds()
  " draw view
  :call ViSqlTablesListDrawView()
  if (a:database == w:visqlDatabase && w:visqlTable != '')
    " set cursor to last known position
    :call ViSqlLastCursorPositionByTerm(w:visqlTable)
  else
    :let w:visqlDatabase = a:database
    if (w:visqlTableCount > 0)
      :execute "normal! gg/+\<CR>jjj^w"
    else
      :echom "No Records to display"
    endif
  endif
endfunction

"set binds for tables list view
function! ViSqlTablesListSetBinds()
  " go back to database list view 
  :nnoremap <buffer> - :call ViSqlTablesListLeaveCleanup()<CR>:call ViSqlDatabaseListGoToView()<CR>
  :vnoremap <buffer> - :call ViSqlTablesListLeaveCleanup()<CR>:call ViSqlDatabaseListGoToView()<CR>
  " go back to database list view 
  :nnoremap <buffer> r :call ViSqlTablesListGoToView(w:visqlDatabase)<CR>
  :vnoremap <buffer> r :call ViSqlTablesListGoToView(w:visqlDatabase)<CR>
  " Open help
  :nnoremap <buffer> zz :call ViSqlTablesListToggleHelp()<CR>
  :vnoremap <buffer> zz :call ViSqlTablesListToggleHelp()<CR>
  " Go to tables dataview
  :nnoremap <buffer> <CR> :call ViSqlTablesListLeaveCleanup()<CR>:call ViSqlTableDataGoToView(expand('<cword>'))<CR>
  :vnoremap <buffer> <CR> :call ViSqlTablesListLeaveCleanup()<CR>:call ViSqlTableDataGoToView(expand('<cword>'))<CR>
  " Go to tables dataview
  :nnoremap <buffer> s :call ViSqlTablesListToggleSort()<CR>
  :vnoremap <buffer> s :call ViSqlTablesListToggleSort()<CR>
  " custom query
  :nnoremap <buffer> cq :call ViSqlTablesListUnbinds()<CR>:call ViSqlSaveState('tablesList')<CR>:call ViSqlCustomQuery()<CR>
  :vnoremap <buffer> cq :call ViSqlTablesListUnbinds()<CR>:call ViSqlSaveState('tablesList')<CR>:call ViSqlCustomQuery()<CR>
endfunction

" unbind tables list binds
function! ViSqlTablesListUnbinds()
  :unmap <buffer> -
  :unmap <buffer> r
  :unmap <buffer> zz
  :unmap <buffer> <CR>
  :unmap <buffer> s
  :unmap <buffer> cq
endfunction

" Open table list help
function! ViSqlTablesListOpenHelp()
  :set splitbelow
  :execute "normal! \<C-W>n"
  :execute "normal! \<C-W>j"
  :set modifiable
  :%d
  :setlocal nocursorline
  :execute "normal! I TableList View Help:\<CR>"
  :execute "normal! I Key          |   Description\<CR>"
  :execute "normal! I ----------------------------\<CR>"
  :execute "normal! I Arrow Keys   |   Move around\<CR>"
  :execute "normal! I -            |   Go back to databse list\<CR>"
  :execute "normal! I Enter        |   Select Table\<CR>"
  :execute "normal! I r            |   Refresh Tables List\<CR>"
  :execute "normal! I s            |   Sort Tables List(Togglable)\<CR>"
  :execute "normal! I cq           |   Custom Query\<CR>"
  :execute "normal! I zz           |   Toggle Help"
  :normal gg
  :resize 11
  :let s:helpId = win_getid()
  :call win_gotoid(g:visqlWindow)
  :let w:visqlTablesListHelpId = s:helpId
  :let w:visqlTablesListHelpIsOpen = 'true'
endfunction

function! ViSqlTablesListLeaveCleanup()
  :call ViSqlTablesListUnbinds()
  :call ViSqlTablesListCloseHelp()
endfunction

" Close help for tables list view

"draw view for tables list view
function! ViSqlTablesListDrawView()
  :set modifiable
  :%d
  :call ViSqlTablesListDrawContent()
  :call ViSqlTablesListDrawHeader()
  :set nomodifiable
endfunction

" Get and draw content for tables list view
function! ViSqlTablesListDrawContent()
  :let s:query = "show tables;"
  :let s:connectResult = system("mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass."  ".w:visqlDatabase." --table -e '".s:query."'")
  :put=s:connectResult
endfunction

"draw header for tables list view
function! ViSqlTablesListDrawHeader()
  :let w:visqlTableCount = ViSqlCountTables(w:visqlDatabase)
  :execute "normal! ggIVI SQL\<CR>Choose a table...\<CR>\<CR>"
  :execute "normal! IResults: ".w:visqlTableCount."\<CR>"
  :execute "normal! ISorted by ".w:visqldatabaseListSortOrder
endfunction

" Count the number of tables
function! ViSqlCountTables(database)
  :let s:query = "select count(*) from information_schema.tables where table_schema = \"".a:database."\";"
  :let s:countResult = system("mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass." -e '".s:query."'")
  :let s:count = split(s:countResult)[1]
  :return s:count
endfunction

" Close table list help
function! ViSqlTablesListCloseHelp()
  if (w:visqlTablesListHelpIsOpen == 'true')
    :call win_gotoid(w:visqlTablesListHelpId)
    :bd!
  endif
  :let w:visqlTablesListHelpIsOpen = 'false'
endfunction

" Toggle help
function! ViSqlTablesListToggleHelp()
  if (w:visqlTablesListHelpIsOpen == 'true')
    :call ViSqlTablesListCloseHelp()
  else
    :call ViSqlTablesListOpenHelp()
  endif
endfunction

" Toggle sorting the list
function! ViSqlTablesListToggleSort()
  :set modifiable
  :execute "normal! gg/+\<CR>jjj"
  :let s:topDataLine = line('.')
  :execute "normal! Gk"
  :let s:bottomDataLine = line('.')
  if (w:visqldatabaseListSortOrder == "DESC")
    :execute s:topDataLine.","s:bottomDataLine."sort! i"
    :let w:visqldatabaseListSortOrder = 'ASC'
  else
    :execute s:topDataLine.","s:bottomDataLine."sort i"
    :let w:visqldatabaseListSortOrder = 'DESC'
  endif
  :execute "normal gg/\\(ASC\\|DESC\\)\<CR>"
  :execute "normal! SSorted by ".w:visqldatabaseListSortOrder
  :execute "normal! jjjj^w"
  :set nomodifiable
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-table data functions
function! ViSqlTableDataGoToView(table)
  if (w:visqlTable == a:table)
    :let s:revistTable = 'true'
  else
    :let s:revistTable = 'false'
    :let w:visqlTable = a:table
  endif
  " " set binds
  :call ViSqlTableDataSetBinds()
  " " draw view
  :call ViSqlTableDataDrawView()
  :let w:visqlHeaderLine = ViSqlGetHeaderLine()
  " set cursor to last known position or new position if different table
  if (s:revistTable == 'true')
    " get last cursor position
    :call setpos('.', w:lastTableDataPos)
  else
    :silent execute "normal! gg/+\<CR>jjj^w"
  endif
endfunction

" Set bind for table data view
function! ViSqlTableDataSetBinds()
  " go back to tables list view 
  :nnoremap <buffer> - :call ViSqlTableDataLeaveCleanup()<CR>:call ViSqlTablesListGoToView(w:visqlDatabase)<CR>
  :vnoremap <buffer> - :call ViSqlTableDataLeaveCleanup()<CR>:call ViSqlTablesListGoToView(w:visqlDatabase)<CR>
  " Toggle help
  :nnoremap <buffer> zz :call ViSqlTableDataToggleHelp()<CR>
  :vnoremap <buffer> zz :call ViSqlTableDataToggleHelp()<CR>
  " Replace record
  :nnoremap <buffer> <CR> :call ViSqlEditData('new')<CR>
  :vnoremap <buffer> <CR> v:call ViSqlEditData('new')<CR>
  " Edit record
  :nnoremap <buffer> a :call ViSqlEditData('alter')<CR>
  :vnoremap <buffer> a v:call ViSqlEditData('alter')<CR>
  " custom query
  :nnoremap <buffer> cq :call ViSqlTableDataLeaveCleanup()<CR>:call ViSqlSaveState('tableData')<CR>:call ViSqlCustomQuery()<CR>
  :vnoremap <buffer> cq :call ViSqlTableDataLeaveCleanup()<CR>:call ViSqlSaveState('tableData')<CR>:call ViSqlCustomQuery()<CR>
endfunction

" clean up table data view
function! ViSqlTableDataLeaveCleanup()
  :let w:lastTableDataPos = getpos('.')
  :call ViSqlTableDataUnbinds()
endfunction

" Open table list help
function! ViSqlTableDataToggleHelp()
  :set splitbelow
  :execute "normal! \<C-W>n"
  :execute "normal! \<C-W>j"
  :set modifiable
  :%d
  :setlocal nocursorline
  :execute "normal! I Table Data View Help:\<CR>"
  :execute "normal! I Key          |   Description\<CR>"
  :execute "normal! I ----------------------------\<CR>"
  :execute "normal! I Arrow Keys   |   Move around\<CR>"
  :execute "normal! I -            |   Go back to database list\<CR>"
  :execute "normal! I Enter        |   Edit Data (new record) (not implemented)\<CR>"
  :execute "normal! I a            |   Alert Data (edit existing record) (not implemented)\<CR>"
  :execute "normal! I cq           |   Custom Query\<CR>"
  :normal gg
  :resize 11
  :let s:helpId = win_getid()
  :call win_gotoid(g:visqlWindow)
  :let w:visqlTablesListHelpId = s:helpId
  :let w:visqlTablesListHelpIsOpen = 'true'
endfunction

" Unbinds for table data view
function! ViSqlTableDataUnbinds()
  :unmap <buffer> -
  :unmap <buffer> cq
endfunction

" Main set and draw view for table data
function! ViSqlTableDataDrawView()
  :set modifiable
  :%d
  :call ViSqlTableDataDrawContent()
  :call ViSqlTableDataDrawHeader()
  :set nomodifiable
endfunction

"Draw the table data header
function! ViSqlTableDataDrawHeader()
  :execute "normal! ggITable view for ".w:visqlTable."\<CR>"
  :let w:visqlTableDataCount = ViSqlCountTableDataRows(w:visqlTable)
  :execute "normal! ITotal Results: ".w:visqlTableDataCount."\<CR>"
  " :execute "normal! ISorted by ".w:visqlTableDataSortColumn." ".w:visqlTableDataSortOrder
endfunction

" Draw the table data content
function! ViSqlTableDataDrawContent()
  :let s:query = "select * from ".w:visqlTable.";"
  :let w:visqlCurrentDataViewQuery = s:query
  :let s:tableDataResult = system("mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass."  ".w:visqlDatabase." --table -e '".s:query."'")
  :put=s:tableDataResult
endfunction

" Count the number of rows on screen
function! ViSqlCountTableDataRows(table)
  :let s:query = "select count(*) from ".a:table.";"
  :let s:countResult = system("mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass." ".w:visqlDatabase." -e '".s:query."'")
  :let s:count = split(s:countResult)[1]
  :return s:count
endfunction

function! ViSqlEditData(editType)
  :echom '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  :let s:startingCursorPos = getpos('.')
  if (a:editType == 'alter')
    :let s:editData = ViSqlGetData()
  else
    :let s:editData = ''
  endif
  :let s:dataId = ViSqlGetDataId()
  :let s:idColumnName = ViSqlGetIdColumnName(w:visqlHeaderLine)
  :let s:dataColumnName = ViSqlGetDataColumnName(w:visqlHeaderLine)
  :let s:newData = ViSqlGetNewData(s:editData, s:dataColumnName, s:dataId)
  if (s:newData == '')
    return
  endif
  :let s:query = "update ".w:visqlTable." set ".s:dataColumnName."=\"".s:newData."\" where ".s:idColumnName." = ".s:dataId.";"
  :echom s:query
  :let s:updateResult = system("mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass." ".w:visqlDatabase." -e '".s:query."'")
  :set modifiable
  if (match(s:updateResult, 'ERROR') > -1)
    :execute "normal! :%d\<CR>IError updating record:\<CR>\<ESC>:put=s:updateResult\<CR>oPress enter to continue..."
  else
    :execute "normal! :%d\<CR>IUpdate Successful! \<CR>\<CR>Press enter to coninute..."
  endif
  :redraw!
  :call input('')
  :call ViSqlTableDataRefreshView()
  :set nomodifiable
  :call setpos('.', s:startingCursorPos)
  :call ViSqlSelectData()
endfunction

function! ViSqlSelectData()
  if (getline('.')[col('.') - 1] != '|')
    F|
  endif
  :normal! vf|o
endfunction

" Refresh the table data view
function! ViSqlTableDataRefreshView()
  :set modifiable
  :let s:refreshView = getpos('.')
  :%d
  :let s:refresh = system("mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass." ".w:visqlDatabase." --table -e '".w:visqlCurrentDataViewQuery."'")
  :put=s:refresh
  :call ViSqlTableDataDrawHeader()
  :set nomodifiable
  :call setpos('.', s:refreshView)
  :normal! hl
  return
endfunction

" get content of data field
function! ViSqlGetData()
  :let s:startPos = getpos('.')
  if (getline('.')[col('.') - 1] != '|')
    :normal F|
  endif
  :normal! w
  :let s:leftSideOfData = col('.')
  :normal! f|ge
  :let s:rightsideofData = col('.')
  :let s:dataLength = (s:rightsideofData - s:leftSideOfData) + 1
  :let s:data = strcharpart(getline('.'), s:leftSideOfData-1, s:dataLength)
  :call setpos('.', s:startPos)
  :normal! hl
  :return s:data
endfunction

" Get id of a row
function! ViSqlGetDataId()
  :let s:getDataStartPos = getpos('.')
  :normal! ^
  :let s:id = ViSqlGetData()
  :call setpos('.', s:getDataStartPos)
  :normal! hl
  :return s:id
endfunction

" Get column name of current data field
function! ViSqlGetDataColumnName(headerLine)
  :let s:colNameStartPos = getpos('.')
  :let s:headerPos = []
  :call add(s:headerPos, 0)
  :call add(s:headerPos, a:headerLine)
  :call add(s:headerPos, s:colNameStartPos[2])
  :call add(s:headerPos, 0)
  :call setpos('.', s:headerPos)
  :let s:columnName = ViSqlGetData()
  :call setpos('.', s:colNameStartPos)
  :normal! hl
  :return s:columnName
endfunction

" Get column name of id column
function! ViSqlGetIdColumnName(headerLine)
  :let s:getIdStartPos = getpos('.')
  :normal! ^
  :let s:columnIdName = ViSqlGetDataColumnName(a:headerLine)
  :call setpos('.', s:getIdStartPos)
  :normal! hl
  return s:columnIdName
endfunction

" Get new data for field from user
function! ViSqlGetNewData(editData, dataColumnName, dataId)
  :let s:newDataFromUser = input('New Data for COLUMN - '.a:dataColumnName.', ID - '.a:dataId.':  ', a:editData)
  return s:newDataFromUser
endfunction

function! ViSqlGetHeaderLine()
  :let s:headerLineStartPos = getpos('.')
  :execute "normal! gg/+\<CR>j"
  :let s:headerLine = line('.')
  :call setpos('.', s:headerLineStartPos)
  return s:headerLine
endfunction
" function! ViSqlEditData(editType)
"   :echom '!!!!!!!!'
"   :set modifiable
"   :let s:startingCursorPos = getpos('.')
"   :let w:lastTableDataPos = s:startingCursorPos
"   if (expand('<cWORD>') == '|')
"     :normal! l
"     :let s:startingCursorPos = getpos('.')
"   endif
"   " yank the existing data into variable
"   if (a:editType == 'change')
"     :execute "normal! F|wyt|"
"     :let s:existingData = split(@0, '\s.*$')[0]
"   endif
"   :normal! ^w
"   :let s:recordId = expand('<cWORD>')
"   :normal! 3Gw
"   :let s:primaryKeyName = expand('<cWORD>')
"   :execute "normal! gg/+\<CR>j"
"   :let s:headerLine = line('.')
"   :call setpos('.', [0,s:headerLine,s:startingCursorPos[2],0])
"   :normal! F|w
"   :let s:columnName = expand('<cWORD>')
"   if (a:editType == 'change')
"     :let s:newValue = input('New value for record "'.s:recordId.'" column "'.s:columnName.'": ', s:existingData)
"   else
"     :let s:newValue = input('New value for record "'.s:recordId.'" column "'.s:columnName.'": ')
"   endif
"   if (s:newValue == '')
"     :call setpos('.', s:startingCursorPos)
"     return
"   endif
"   :let s:query = 'update '.w:visqlTable.' set '.s:columnName.' = "'.s:newValue.'" where '.s:primaryKeyName.' = "'.s:recordId.'";'
"   :echom s:query
"   :let s:updateResult = system("! mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass." ".w:visqlDatabase." --table -e '".s:query."'")
"   if (match(s:updateResult, 'ERROR') > -1)
"     :execute "normal! :%d\<CR>IError updating record:\<CR>\<ESC>:put=s:updateResult\<CR>oPress enter to continue..."
"   else
"     :execute "normal! :%d\<CR>IUpdate Successful! \<CR>\<CR>Press enter to coninute..."
"   endif
"   :redraw!
"   :call input('')
"   :call ViSqlTableDataGoToView(w:visqlTable)
"   :set nomodifiable
"   :normal! f|vF|
" endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Custom Query functions 
" Main Custom Query
function! ViSqlCustomQuery()
  let s:query = input('query to run: ')
  if (s:query == '')
    return
  else
    :let w:visqlPreviousPos = getpos('.')
    :call ViSqlRunQuery(s:query)
    :call ViSqlSetCustomeQueryBinds()
  endif
endfunction

" Custom query runner
function! ViSqlRunQuery(query)
  :let s:cursorStart = getpos('.')
  :let s:queryResult = system("mysql -h ".w:visqlHost." -u ".w:visqlUser." -p".w:visqlPass."  ".w:visqlDatabase." --table -e '".a:query."'")
  :set modifiable
  :%d
  if (match(s:queryResult, 'ERROR') > -1)
    :execute "normal! iError in query...\<CR>"
    :put=s:queryResult
    :execute "normal! o\<CR>Press enter to exit..."
    :redraw!
    :call input('')
    :call ViSqlRefreshTableDataView()
    :call setpos('.', s:cursorStart)
  else
    if (match(s:queryResult, 'ERROR') > -1)
      :execute "normal! iQuery failed... \<CR>results:\<CR>"
    else
      :execute "normal! iQuery Succeeded \<CR>results:\<CR>"
    endif
    :put=s:queryResult
    :normal! gg
  endif
  :set nomodifiable
endfunction

function! ViSqlSetCustomeQueryBinds() 
  " go back to previous screen
  :nnoremap <buffer> - :call ViSqlCustomeQueryUnBinds()<CR>:call ViSqlRestoreState()<CR>
  :vnoremap <buffer> - :call ViSqlCustomeQueryUnBinds()<CR>:call ViSqlRestoreState()<CR>
endfunction

function! ViSqlCustomeQueryUnBinds() 
  :unmap <buffer> -
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""Miscellaneous functions 
" Save/Reload State
function! ViSqlSaveState(view)
  :let w:visqlSavedView = a:view
endfunction

function! ViSqlRestoreState()
  if (w:visqlSavedView == 'databases')
    :call ViSqlDatabaseListGoToView()
  elseif (w:visqlSavedView == 'tablesList')
    :call ViSqlTablesListGoToView(w:visqlDatabase)
  elseif (w:visqlSavedView == 'tableData')
    :call ViSqlTableDataGoToView(w:visqlTable)
  endif
endfunction

function! ViSqlSetGlobalVariables()
  :let w:visqldatabaseListSortOrder = 'DESC'
  :let w:visqlTablesListSortOrder = 'DESC'
  :let w:visqlTableDataSortOrder = 'DESC'
  :let w:visqlTable = ''

  :setlocal nowrap
endfunction

function! ViSqlLastCursorPositionByTerm(term)
  if(a:term == '')
    return 'false'
  else
    :execute "normal! /".a:term."\<CR>"
    :noh
    return 'true'
  endif
endfunction

" Focus the window containing the VISql interface
function! ViSqlGoToInterface()
  if (g:visqlWindow == '')
    :let s:result = 0
  elseif (g:visqlWindow == win_getid())
    :echom "Already on interface window..."
    :let s:result = -1
  else
    :let s:result = win_gotoid(g:visqlWindow)
  endif
  if (s:result == 0)
    :let g:visqlWindow = ''
    :echom "No interface window open..."
  elseif (s:result == 1)
    :echom "Focused ViSql Interface"
  endif
endfunction

" Global binds
function! ViSqlSetGlobalBinds()
  " Autocommand to delete buffer upon closing window
  " Exit command
  :nnoremap <buffer> qq :windo bd!<CR>
  :vnoremap <buffer> qq :windo bd!<CR>
  " arrow movement keys
  :nnoremap <buffer> <right> :normal! f\|<CR>vf\|o
  :vnoremap <buffer> <right> f\|f\|o
  :nnoremap <buffer> <left> :normal! F\|F\|<CR>vf\|o
  :vnoremap <buffer> <left> F\|oF\|o
  :nnoremap <buffer> <up> :normal! kf\|vF\|<CR>
  :vnoremap <buffer> <up> koko
  :nnoremap <buffer> <down> :normal! jf\|vF\|<CR>
  :vnoremap <buffer> <down> jojo
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
