function! ToggleColorColumn()
  if &colorcolumn
    set colorcolumn=0
    echom "No color column"
  else
    let &colorcolumn=join(range(81,999),",")
    echom "Color column"
  endif
endfunction

