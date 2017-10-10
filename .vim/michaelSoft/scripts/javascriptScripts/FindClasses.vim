function! ListClasses()
  let g:classReturnWindow = win_getid()
  :vsplit! +enew
  silent read!grep -R "export.*\(class\|interface\)" ./
  g/^$/d
  %s/.*\(class\|interface\)\s\+\(\w\+\).*/\2/
  %sort
  nnoremap <buffer> <CR> :call ListClassReturn()<CR>
endfunction
function! ListClassReturn()
  let s:word = expand("<cWORD>")
  bd!
  call win_gotoid(g:classReturnWindow)
  execute "norm! i".s:word
endfunction

function! Refactor()
endfunction
