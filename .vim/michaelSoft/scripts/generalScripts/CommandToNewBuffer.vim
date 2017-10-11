fun! CommandToNewBuffer()
  let g:command_start_window = win_getid()
  let save_cursor = getcurpos()
  let s:command = input("Command: ")
  if s:command == ""
    return
  endif
  redir => s:output
  silent execute s:command
  redir END
  call setpos('.', save_cursor)
  split +enew
  execute "norm! \<C-w>J"
  silent put=s:output
  norm! ggdd
  au BufLeave <buffer> call win_gotoid(g:command_start_window)
endfun

