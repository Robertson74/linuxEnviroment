function! UpdateFileLastModified()
  let save_cursor = getcurpos()
  let savedView = winsaveview()
  norm! gg
  try
    silent! let searchResult = search('\* lastModified')
    if searchResult != 0
      silent execute "norm! ^f:lC \<ESC>:put=strftime('%m/%d/%Y')\<CR>kJ"
    else
      " echoe "Could not update file last modified"
    endif
  catch 
    " echom "No file header with last modified"
  endtry
  call setpos('.', save_cursor)
  call winrestview(savedView)
endfunction
