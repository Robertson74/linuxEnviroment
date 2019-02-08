""""""" flip true false
function! FlipBoolean()
  if expand('<cword>') == 'true'
    :execute "normal! ciwfalse"
  elseif expand('<cword>') == 'false'
    :execute "normal! ciwtrue"
  elseif expand('<cword>') == '1'
    :execute "normal! ciw0"
  elseif expand('<cword>') == '0'
    :execute "normal! ciw1"
  else
    :echo "Not a Boolean"
  endif
endfunction

