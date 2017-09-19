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

