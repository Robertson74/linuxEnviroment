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
