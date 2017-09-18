" move a register from common to a saved register
function! SaveToRegister()
  echom 'Register: '
  let s:charNum = getchar()
  let s:reg = nr2char(s:charNum)
  execute 'let @'.s:reg.'=@"'
  echo "Saved to register @".s:reg
endfunction
