function! ImportFromTopLevelSource(importItem, importSource)
  " save cursor spot and screen spot
  let s:save_cursor = getcurpos()
  let s:save_view = winsaveview()
  " check if item is imported
  if IsItemImported(a:importItem)
    echom a:importItem." is already imported"
    call setpos('.', s:save_cursor)
    call winrestview(s:save_view)
    return
  endif
  " determine if nma-platform import statement exists
  let s:importStatmentExists = search("from.*".a:importSource)
  " if nma-platform exists add to import statement
  if s:importStatmentExists
    call AddToPlatformImport(a:importItem, a:importSource)
    " return cursor reset screen
    call setpos('.', s:save_cursor)
    call winrestview(s:save_view)
  else " else insert new importat statement
    call AddNewPlatfromImport(a:importItem, a:importSource)
    call setpos('.', s:save_cursor)
    call winrestview(s:save_view)
    norm! j
  endif
  " confirm updated imports to user
  echom "imported ".a:importItem." succesfully."
endfunction

function! AddToPlatformImport(importItem, importSource)
  " find the import line
  execute "norm! gg/".a:importSource."\<CR>"
  " find right curly bracket, move to last item
  execute "norm! F}ge"
  " put in new line
  execute "norm! a, ".a:importItem
  " return
  return
endfunction

function! AddNewPlatfromImport(importItem, importSource)
  " find path to import source
  let s:importPath = FindImportSourcePath(a:importSource)
  " if no import source path found, error
  if s:importPath == -1
    throw "No import path found for ".a:importSource
  endif
  " find line to put new import statment
  execute "norm! G?^import\<CR>"
  execute "norm! /from\<CR>"
  " add import statement
  execute "norm! oimport { ".a:importItem." } from \"".s:importPath."\"\;"
  " return
endfunction

function! FindImportSourcePath(importSource)
  " get file path
  let s:filePath = expand("%:h")
  " find import source in file path
  let s:importSourcePath = systemlist("find ./ -name '".a:importSource."'")[0]
  " get relative path
  let s:pathCommand = "node -e \"console.log(path.relative('".s:filePath."1234', '".s:importSourcePath."'))\""
  let s:relativeSourcePath = systemlist(s:pathCommand)[0]
  return s:relativeSourcePath
endfunction

function! IsItemImported(importItem)
  return search("import.* ".a:importItem." ")
endfunction
