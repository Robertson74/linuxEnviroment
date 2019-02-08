function! RepositionErrors()
  let save_cursor = getcurpos()
  let save_window = win_getid()
  execute "normal! \<C-W>b\<C-W>J"
  set colorcolumn=0
  set wrap
  if line('$') > 3
    resize 3
  else
    resize 3
    " execute "resize ".line('$')
  endif
  call win_gotoid(save_window)
  call setpos('.', save_cursor)
endfunction
