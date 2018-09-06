function! NewImport()
  " get the word to be imported
  let s:newImportWord = expand("<cword>")
  " save the cur pos
  let s:save_cursor = getcurpos()
  " find the right line for the new import
  norm! G
  call search("^import", "b")
  " promp the user for where they want the import to come from
  let s:importSource = input("Import from where?: ")
  " create the import
    if !exists("g:importSingleQuote") || (g:importSingleQuote != 0)
      let s:quote="'"
    else
      let s:quote='"'
    endif
    execute "norm!oimport { ".s:newImportWord." } from ".s:quote."".s:importSource."".s:quote.";"
  " return the cursor
  call setpos('.', s:save_cursor)
endfunction
