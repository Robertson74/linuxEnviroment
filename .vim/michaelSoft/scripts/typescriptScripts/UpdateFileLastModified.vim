function! UpdateFileLastModified()
  let save_cursor = getcurpos()
  let savedView = winsaveview()
  norm! gg
  try
    silent! let searchResult = search('\* lastModified')
    if searchResult != 0
      if match(getline("."), strftime('%m/%d/%Y')) == -1
        keepjumps silent execute "norm! ^f:lC \<ESC>:put=strftime('%m/%d/%Y')\<CR>kJ"
      endif
    else
      " echoe "Could not update file last modified"
    endif
  catch 
    " echom "No file header with last modified"
  endtry
  call setpos('.', save_cursor)
  call winrestview(savedView)
endfunction
