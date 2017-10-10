function! GetRandomNumberBetweenRange(num1, num2)
  execute "let s:randomNumber = system('echo $(( ( RANDOM % ".a:num2." )  + ".a:num1." ))')"
  let s:randomNumber = substitute(s:randomNumber, '\%x00', '', 'g')
  return s:randomNumber
endfunction
