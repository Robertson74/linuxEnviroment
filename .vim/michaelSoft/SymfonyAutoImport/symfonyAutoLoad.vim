function! SetUpSymfonyAutoImport()
  " set return window/position
  :let g:importReturnWindow = win_getid()
  :let g:importReturnLine = getcurpos()
  " open window for entity list
  :vsplit enew
  " set bind to select an entity
  :nnoremap <buffer> <CR> :call ImportFile(g:importReturnWindow, g:importReturnLine)<CR>
  " populate entity list
  :set modifiable
  :%d
  :silent r! find src/**/Entity/ -name "*.php" -type f
  :normal! gg
  :set nu rnu
endfunction

function! ImportFile(returnWindow, returnLine)
  :let s:importFile = getline('.')
  :let s:importBundle = matchstr(s:importFile, '\w\+Bundle')
  :let s:importEntity = matchstr(s:importFile, '\w\+\.php')
  :let s:importEntity =split(s:importEntity, '\.')[0]
  :let s:useStatement = "use ".s:importBundle."\\Entity\\".s:importEntity.';'
  :q!
  :call win_gotoid(a:returnWindow)
  :execute "normal! GG/^use\<CR>"
  while match(getline('.'), '^use') > -1
    normal! j
  endwhile
  :normal k
  :put=s:useStatement
  :execute "normal! /use.*".s:importEntity.";\<CR>"
  :call setpos('.', [a:returnLine[0], a:returnLine[1]+1, a:returnLine[2], a:returnLine[3]])
  :redraw!
  :echom 'imported file succesfully, print entity? '
  :let s:printEntity = getchar()
  if (s:printEntity == 121)
    :execute "normal! a".s:importEntity
    :startinsert!
  endif
  :unlet g:importReturnWindow
  :unlet g:importReturnLine
endfunction
