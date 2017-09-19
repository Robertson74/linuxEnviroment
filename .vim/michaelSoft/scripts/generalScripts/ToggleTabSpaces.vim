function! ToggleTabSpaces()
  if exists("g:tabSpaces") && g:tabSpaces == 2
    set shiftwidth=4 tabstop=4
    echom "tabs 4 spaces"
    let g:tabSpaces = 4
  else
    set shiftwidth=2 tabstop=2
    echom "tabs 2 spaces"
    let g:tabSpaces = 2
  endif
endfunction
