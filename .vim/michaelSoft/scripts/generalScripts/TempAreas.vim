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
  silent! call ReactivateLines()
  call setpos(".", s:removeCursor)
endfunction

function! DeactivateLine()
  " norm! I
  :Commentary
endfunction

function! DeactivateMultipleLines()
  let s:linesToDisable = input('Which lines to disable? ')
  execute s:linesToDisable.'call DeactivateLine()'
endfunction

function! ReactivateLines()
  g/----!/execute "norm! :s/----! //\<CR>:Commentary\<CR>=="
endfunction
