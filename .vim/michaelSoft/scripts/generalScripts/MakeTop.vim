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

