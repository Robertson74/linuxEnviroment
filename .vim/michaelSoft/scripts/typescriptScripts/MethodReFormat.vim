function! MethodReFormat()
  let s:numOfCommas = count(getline("."), ",")
  " <CR> on first parenths
  execute "norm! ^f(a\<CR>\<ESC>=="
  " <CR> on each comma
  while s:numOfCommas > 0
    execute "norm! f,a\<CR>\<ESC>=="
    let s:numOfCommas = s:numOfCommas - 1
  endwhile
  " <CR> on last parenths
  execute "norm! ^f)i\<CR>\<ESC>=="
endfunction
