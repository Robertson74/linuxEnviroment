function! FormatJSON()
  :execute "'<,'>!python -m json.tool"
  :normal! gv
endfunction
