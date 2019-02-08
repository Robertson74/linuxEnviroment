" quickly make a funciton async
function! MakeAsync()
  let save_cursor = getcurpos()
  execute "normal! ?=>\<CR>F("
  if match(getline('.'), 'async') == -1
    execute "normal! iasync "
  else 
    execute "normal! ?async\<CR>daw"
  endif
  call setpos('.', save_cursor)
endfunction
