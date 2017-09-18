nnoremap <Leader>for :call FormatPage()<CR>
function! FormatPage()
  let save_cursor = getcurpos()
  execute "normal! gg=G"
  call setpos('.', save_cursor)
endfunction
