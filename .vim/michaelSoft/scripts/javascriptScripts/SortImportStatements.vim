function! SortImportStatements()
  let s:sortCur = getcurpos()
  norm! G
  execute "norm! /import\r"
  execute "norm! ?import\r"
  norm! V
  norm! ''
  silent! execute "norm! :sort\r"
  silent! call setpos(".", s:sortCur)
  echom " imports sorted..."
endfunction
