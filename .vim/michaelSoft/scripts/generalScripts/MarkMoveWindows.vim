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
