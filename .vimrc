""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""- plugin configuration
execute "source ".$HOME."/.vim/michaelSoft/plugins.vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-configuration
execute "source".$HOME."/.vim/michaelSoft/vimConfiguration.vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          LOAD SCRIPT AND PLUGINS                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
execute "source ~/.vim/michaelSoft/scriptAndPluginManagers/generalScripts.vim"
" typescript 
execute "source ~/.vim/michaelSoft/scriptAndPluginManagers/typescript.vim"
" PHP
execute "source ~/.vim/michaelSoft/scriptAndPluginManagers/php.vim"
" JS 
execute "source ~/.vim/michaelSoft/scriptAndPluginManagers/javascript.vim"
" VIM
execute "source ~/.vim/michaelSoft/scriptAndPluginManagers/vim.vim"
" css 
execute "source ~/.vim/michaelSoft/scriptAndPluginManagers/css.vim"
" css 
execute "source ~/.vim/michaelSoft/scriptAndPluginManagers/html.vim"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         LOAD CUSTOM PLUGINS                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vi sql
execute "source ~/.vim/michaelSoft/customPlugins/ViSql/ViSql.vim"
" symfony tools
execute "source ~/.vim/michaelSoft/symfony/symfonyTools.vim"
" mr completor
execute "source ~/.vim/michaelSoft/customPlugins/mrComplete/mrComplete.vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-call script
nnoremap <Leader>mas :call MakeAsync()<CR>
" convert JS function to fat arrow function
nnoremap <Leader>> :call ConvertFunctionToFatArrow()<CR>
nnoremap <Leader>sim :call SortImportStatements()<CR>
nnoremap <Leader>reg :call SaveToRegister()<CR>
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
endfunction
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
endfunction
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
endfunction
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
endfunction
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-TESTING
execute "source".$HOME."/.vim/michaelSoft/sandbox.vim"
