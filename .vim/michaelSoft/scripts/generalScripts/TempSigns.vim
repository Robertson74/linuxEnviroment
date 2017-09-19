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
