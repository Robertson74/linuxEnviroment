function! UpdateFileLastModified()
  let save_cursor = getcurpos()
  norm! gg
  let searchResult = search('\* lastModified')
  if searchResult
    execute "norm! ^f:lC \<ESC>:put=strftime('%m/%d/%Y')\<CR>kJ"
    echom "Updated file last modified"
  else
    echoe "Could not update file last modified"
  endif
  call setpos('.', save_cursor)
endfunction
