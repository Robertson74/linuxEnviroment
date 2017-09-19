function! SortImportStatements()
  let s:sortCur = getcurpos()
  g/^\s*import/,/^\s*import/sort
  call setpos(".", s:sortCur)
endfunction
