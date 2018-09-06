function! ManualImport()
  " get the word under cursor
  let g:manualImportWord = expand("<cword>")
  " save the position
  let g:manaulImportCurPos = getcurpos()
  " go to first import line
  norm! G
  call search("import")
  " set the enter short cut to add
  nnoremap <buffer> <CR> :call InsertManualImport(g:manualImportWord)<CR>
endfunction

function! InsertManualImport(wordToAdd)
  " find right curly brace
  execute "norm! $F}"
  " insert the word
  execute "norm! gea, ".g:manualImportWord
  " unmap the enter shortcut
  unmap <buffer> <CR>
  " return the cursor
  call setpos('.', g:manaulImportCurPos)
endfunction
