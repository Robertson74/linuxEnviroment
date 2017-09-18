nnoremap <Leader>err :call RepositionErrors()<CR>
function! RepositionErrors()
  let save_cursor = getcurpos()
  let save_window = win_getid()
  execute "normal! \<C-W>b\<C-W>J"
  if line('$') > 10
    resize 10
  else
    execute "resize ".line('$')
  endif
  call win_gotoid(save_window)
  call setpos('.', save_cursor)
endfunction
