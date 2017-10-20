function! ToggleColorColumn()
  if &colorcolumn
    set colorcolumn=0
    echom "No color column"
  else
    let &colorcolumn=join(range(81,999),",")
    hi ColorColumn ctermbg=black
    hi ColorColumn ctermfg=red
    echom "Color column"
  endif
endfunction

