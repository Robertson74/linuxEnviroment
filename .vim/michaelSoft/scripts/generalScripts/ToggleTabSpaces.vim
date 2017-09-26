function! ToggleTabSpaces()
  if exists("g:tabSpaces") && g:tabSpaces == 2
    set shiftwidth=2 tabstop=2 shiftwidth=2
    echom "tabs are 2 spaces"
    let g:tabSpaces = 2
  else
    set shiftwidth=4 tabstop=4 shiftwidth=4
    echom "tabs are 4 spaces"
    let g:tabSpaces = 4
  endif
endfunction
