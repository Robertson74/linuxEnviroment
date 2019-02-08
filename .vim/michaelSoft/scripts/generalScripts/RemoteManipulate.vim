" delete, move, or copy a line remotely(without using the cursor)
function! RemoteManipulate()
  :let s:startWindow = win_getid()
  :let s:startline = line('.')
  :let s:moveCommand = 'y'
  :let s:putCommand = 'put'
  :let s:adjacentWindow = ''
  :set nu nornu
  :redraw!
  :let s:targetString = input('Move target: ')
  let s:testVar = match(s:targetString,'\d\?[hjkl]')
  if (match(s:targetString,'\d\?[hjkl]') == 0) 
    :noautocmd execute "normal! \<C-w>".s:targetString."\<CR>"
    :let s:adjacentWindow = s:targetString
    :set nu nornu
    :redraw!
    :let s:targetString = input('Adjacent move target: ')
  endif
  if (match(s:targetString, '-') > -1)
    :let s:targetString = substitute(s:targetString, '-', ',', '')
  endif
  if (match(s:targetString,'m') > -1)
    :let s:moveCommand = 'd'
    :let s:targetString = split(s:targetString, 'm')[0]
  elseif (match(s:targetString, 'd') > -1)
    :let s:putCommand = ''
    :let s:moveCommand = 'd'
    :let s:targetString = split(s:targetString, 'd')[0]
  elseif ( match( s:targetString, 's' ) > -1 )
    :let s:putCommand = 'swap'
    :let s:targetString = split( s:targetString, 's' )[0]
  elseif ( match( s:targetString, 'y' ) > -1 )
    :let s:putCommand = 'none'
    :let s:targetString = split( s:targetString, 'y' )[0]
  endif
  :execute s:targetString.''.s:moveCommand
  :execute 'call win_gotoid('.s:startWindow.')'
  :set nu nornu
  :execute "normal! :".s:startline."\<CR>"
  :redraw!
  if (s:putCommand == 'put')
    :let s:targetLine = input('Line to move to: ')
    if (s:targetLine == '')
      :let s:targetLine = line('.')
    endif
    :execute s:targetLine.'|'.s:putCommand
  elseif ( s:putCommand == 'swap' )
    :let s:swapString = input( 'Swap lines: ' )
    if (match(s:swapString, '-') > -1)
      :let s:swapString = substitute(s:swapString, '-', ',', '')
    endif
    if ( s:swapString == '' )
      :let s:swapString = line( '.' )
    endif
    :let s:yankedLine = @0
    :execute "normal! :".s:swapString."y\<CR>"
    :let s:yankedSwapLine = @0
    :execute "normal! :".s:swapString."d\<CR>"
    :normal! k
    :execute "put =s:yankedLine"
    if (s:adjacentWindow != '')
      :noautocmd execute "normal! \<C-w>".s:adjacentWindow."\<CR>"
    endif
    :execute "normal! :".s:targetString."d\<CR>"
    if ( match( s:targetString, ',' ) > -1 )
      :let s:targetString = split ( s:targetString, ',' )[0]
    endif
    :normal! k
    :execute "put =s:yankedSwapLine"
    :execute 'call win_gotoid('.s:startWindow.')'
  endif
  :execute "normal! :".s:startline."\<CR>"
  :set nu rnu
endfunction
