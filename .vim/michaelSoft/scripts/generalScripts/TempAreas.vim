""""""" Temporary areas
function! PlaceTempArea()
  :exe "norm! o\<ESC>S\<ESC>30i#"
  norm! ATEMP AREA
  :Commentary
  :exe "norm! o\<ESC>S\<ESC>30i#"
  norm! AEND TEMP AREA
  :Commentary
  norm! O
  norm! S
endfunction
function! RemoveTempArea()
  let s:removeCursor = getcurpos()
  g/####TEMP AREA/,/####END TEMP/d
  call setpos(".", s:removeCursor)
endfunction

