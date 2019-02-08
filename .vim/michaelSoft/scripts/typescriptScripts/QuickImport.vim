function! QuickImport()
  " check that there is a quickImport file to diplay
  if !exists("g:quickImportsFile")
    echoe "No quick import file can be found"
  endif
  " get word to import
  let g:quickImportWord=expand("<cword>")
  " save cursor position
  let g:quickImportCurPos=getcurpos()
  " save window
  let g:quickImportWinNum=win_getid(winnr())
  " display quick imports
  execute "vsplit +e ".g:quickImportsFile
  " set up <CR> as add quick import button
  nnoremap <buffer> <CR> :call AddQuickImport()<CR>
endfunction

function! AddQuickImport()
  " get the quickimport line
  let s:quickImportSource=expand("<cWORD>")
  " close the window
  :bd
  " go back to window where import will be added
  call win_gotoid(g:quickImportWinNum)
  " find right line to add import statment
  norm! G
  let s:isImports=search("^import", "b")
  if (s:isImports == 0)
    norm! ggO
  else
    norm! o
  endif
  " add import based on which quote to use
  if !exists("g:importSingleQuote") || (g:importSingleQuote != 0)
    let s:quote="'"
  else
    let s:quote='"'
  endif
  execute "norm!simport { ".g:quickImportWord." } from ".s:quote."".s:quickImportSource."".s:quote.";"
  " return cursor
  call setpos('.', g:quickImportCurPos)
  norm! j
endfunction
