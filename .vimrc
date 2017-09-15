""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-configuration
execute "source".$HOME."/.vim/michaelSoft/vimConfiguration.vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-scripts
execute "source ".$HOME."/.vim/michaelSoft/scripts/miscellaneousScripts.vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-language specific
" typescript 
execute "source ".$HOME."/.vim/michaelSoft/languageSpecific/typescript.vim"
" PHP
execute "source ".$HOME."/.vim/michaelSoft/languageSpecific/php.vim"
" JS 
execute "source ".$HOME."/.vim/michaelSoft/languageSpecific/vim.vim"
" VIM

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-plugin configuration
" ale
" --- typescript
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call script
nnoremap <Leader>cona :call AddNewConstructorParameter(expand("<cword>"))<CR>
nnoremap <Leader>cona :call AddNewConstructorParameter(expand("<cword>"))<CR>
nnoremap <Leader>mas :call MakeAsync()<CR>
" convert JS function to fat arrow function
nnoremap <Leader>> :call ConvertFunctionToFatArrow()<CR>
" quick add snippets
vnoremap <C-Z> y:call AddQuickSnippet()<CR>
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
nnoremap <Leader>zz :call ToogleZoomSplit()<CR>
"extending windows
nnoremap<Leader>ewu :call ExtendScreenUp()<CR>
nnoremap<Leader>ewd :call ExtendScreenDown()<CR>
nnoremap<Leader>ewc :call CloseScreenExtend()<CR>
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
" quick add constructor args
function! AddNewConstructorParameter(param)
  let s:save_cursor = getcurpos()
  let s:type = input("What type is this - ".a:param." : ")
  let s:description = input("description for var: ")
  if s:type == ""
    return
  endif
  " find constructor line
  execute "normal gg/^\\s.*constructor\<CR>/{\<CR>?)\<CR>"
  " if there are agruments, put a comma in
  if match(getline('.'), ',') > -1
    execute "normal! i,\<space>".a:param.": ".s:type
  elseif
    " insert constructor param
    execute "normal! i".a:param.": ".s:type
  endif
  " assign private variable
  execute "normal! /{\<CR>othis._".a:param." = ".a:param.";\<ESC>=="
  " create private variable
  :set nornu nu
  normal! zb
  redraw!
  let s:privateLine = input("what line for private var - ".a:param." :")
  execute "normal! ".s:privateLine."gg"
  execute "normal! oprivate _".a:param.": ".s:type.";\<ESC>=="
  if s:description != ""
    execute "normal! O// ".s:description."\<ESC>=="
  endif
  call setpos('.', s:save_cursor)
endfunction
" quickly make a funciton async
function! MakeAsync()
  let save_cursor = getcurpos()
  execute "normal! ?=>\<CR>F("
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
  let s:sortCur = getcurpos()
  g/^\s*import/,/^\s*import/sort
  call setpos(".", s:sortCur)
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
function! ToogleZoomHorizontal()
  if !exists('t:zoomedStatus')
    let t:zoomedStatus = 'false'
  endif
  if t:zoomedStatus == 'true'
    execute "norm! \<C-W>="
    let t:zoomedStatus = "false"
    echo "un-zoom"
  else
    execute "norm! \<C-W>500>"
    let t:zoomedStatus = "true"
    echo "zoom"
  endif
endfunction
nnoremap <Leader>zh :call ToogleZoomHorizontal()<CR>
nnoremap <Leader>zv :call ToogleZoomVertical()<CR>
function! ToogleZoomVertical()
  if !exists('t:zoomedStatus')
    let t:zoomedStatus = 'false'
  endif
  if t:zoomedStatus == 'true'
    execute "norm! \<C-W>="
    let t:zoomedStatus = "false"
    echo "un-zoom"
  else
    execute "norm! \<C-W>500+"
    let t:zoomedStatus = "true"
    echo "zoom"
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
function! PlaceTempArea()
  :execute "normal! o\<esc>a#\<esc>30.\<esc>ATEMP AREA\<esc>"
  :Commentary
  :execute "normal! o\<esc>a#\<esc>30.\<esc>AEND TEMP\<esc>"
  :Commentary
endfunction
function! RemoveTempArea()
  let s:removeCursor = getcurpos()
  g/#TEMP AREA/,/#END TEMP/d
  call setpos(".", s:removeCursor)
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
vnoremap <Leader>ec <ESC>:call ExtractFromContext()<CR>
function! ExtractFromContext()
  " (.*).*=>\|function\s\S*(\|\(public\|private\)\s\S*())
  let s:funcName = input("function name: ")
  execute "'<"
  let s:startLine = line('.')
  execute "'<,'>d"
  execute "norm! O".s:funcName."();"
  norm! ==
  let s:upALevel = 0
  while s:upALevel != 1
    norm! 0
    execute "norm! ?{\\s*\\|^\\s*{\\s*$\<CR>"
    execute "norm! $b/{\<CR>"
    norm! V
    redraw!
    execute "norm! \<ESC>"
    let s:upALevel = confirm("Place here?", "&yes\n&up a layer", 1)
  endwhile
  execute "norm! \<ESC>"
  execute "norm! %o\<CR>"
  let s:funcLine = line('.')
  execute "norm! iconst ".s:funcName." = (): void => {"
  execute "norm! o}"
  norm! k
  norm! ""pk$%
  let s:endFuncLine = line('.')
  execute s:funcLine.",".s:endFuncLine."norm! =="
  execute s:startLine
endfunction
inoremap <expr> <C-J> pumvisible() ? "\<C-N>\<C-N>\<C-N>" : "\<C-J>"
inoremap <expr> <C-K> pumvisible() ? "\<C-P>\<C-P>\<C-P>" : "\<C-K>"

nnoremap <Leader>ssav :!mkdir ./.michaelSoft/<CR>:mksession! .michaelSoft/save.vim<CR>
nnoremap <Leader>srel :source ./.michaelSoft/save.vim<CR>
nnoremap <Leader>rg :!tsc && node build/src/domain/repoGen/generateRoutines/generateRepository.js<CR>

nnoremap <Leader>fcl :call ListClasses()<CR>
function! ListClasses()
  let g:classReturnWindow = win_getid()
  :vsplit! +enew
	:silent read! grep -R "export.*class" ./ --exclude-dir="node_modules" | sed "s/.*class\s\(\S*\).*/\1/"
  :v/[A-Za-z]/d
  :v/^[A-Za-z]/d
  :%sort
  nnoremap <buffer> <CR> :call ListClassReturn()<CR>
endfunction
function! ListClassReturn()
  let s:word = expand("<cWORD>")
  bd!
  call win_gotoid(g:classReturnWindow)
  execute "norm! i".s:word
endfunction
nnoremap <Leader>qq :call SetTempCommand()<CR>
function! SetTempCommand()
  let s:defaultShort = "qq"
  let s:commandShortcut = input("Temp command shortcut: ", s:defaultShort)
  let s:command = input("what command to bind to qq: ")
  execute "nnoremap <Leader>".s:commandShortcut." :".s:command."<CR>"
endfunction


" source /home/vagrant/.vim/michaelSoft/nodeDebug/debug.vim
" nnoremap <Leader>zz :call TSRelativePathComplete()<CR>
" " fyi this only supports one path for each module e.g.
" "             "paths": {
" "this--->         "entities/*": ["./src/shared/entities/*"],
" "not this--->     "models/*": ["./src/shared/models/*", "./src/shared/models2/*"]
" "              },
" function! TSRelativePathComplete()
"   " find all classes that have a path in tsconfig
"   let s:tsconfig = system("cat ./tsconfig.json")
"   let s:jsonTsconfig = json_decode(s:tsconfig)
"   let s:paths = get(get(s:jsonTsconfig, "compilerOptions"), "paths")
"   let s:listPaths = values(s:paths)
"   let s:fileMatrix = []
"   for s:path in s:listPaths
"     let s:tsFiles = systemlist("find ".s:path[0]." | grep .ts")
"     echom string(s:tsFiles)
"     let s:tsFiles = systemlist("find ".s:path[0]." | grep .ts | xargs grep 'export'")
"     echom string(s:tsFiles)
"     for s:file in s:tsFiles
"       call add(s:fileMatrix, [s:path[0], s:file])
"     endfor
"   endfor

"   " echom string(s:fileMatrix)
"   " let s:importWord = expand(<cword>)
"   " echom s:importWord
" endfunction

" " source /home/vagrant/.vim/michaelSoft/nodeDebug/debug.vim
" nnoremap <Leader>dbs :call StartDebugSession()<CR>
" nnoremap <Leader>dbw :call GoToDebugWindow()<CR>
" nnoremap <Leader>dbc :call CloseDebugSession()<CR>

" nnoremap <Leader>qq :call TESTING()<CR>
" nnoremap <Leader>ST :call ToggleAle()<CR>
