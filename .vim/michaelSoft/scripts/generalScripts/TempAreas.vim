""""""" Temporary areas
function! PlaceTempArea()
  :exe "norm! o\<ESC>30i#\<ESC>ATEMP AREA\<ESC>=="
  :Commentary
  :exe "norm! o\<ESC>30i#\<ESC>AEND TEMP\<ESC>=="
  :Commentary
  :norm! O
  :norm! S
  :startinsert
endfunction
function! RemoveTempArea()
  let s:removeCursor = getcurpos()
  g/####TEMP AREA/,/####END TEMP/d
  call setpos(".", s:removeCursor)
endfunction

