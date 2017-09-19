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

