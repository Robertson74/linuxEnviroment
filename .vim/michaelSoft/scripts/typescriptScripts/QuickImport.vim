nnoremap <Leader>qim :call QuickImport()<CR>

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
  " find right line to add import statment
  norm! G
  call search("^import", "b")
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
  " add import based on which quote to use
  if !exists("g:importSingleQuote") || (g:importSingleQuote != 0)
    let s:quote="'"
  else
    let s:quote='"'
  endif
  execute "norm!oimport { ".g:quickImportWord." } from ".s:quote."".s:quickImportSource."".s:quote.";"
  " return cursor
  call setpos('.', g:quickImportCurPos)
endfunction
