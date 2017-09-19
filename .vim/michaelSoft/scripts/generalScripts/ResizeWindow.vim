function! ResizeWindow()
  :let s:resizeDirection = -1
  while(s:resizeDirection != 120 && s:resizeDirection != 13 && s:resizeDirection != 27)
    :let s:resizeDirection = getchar()
    :if (s:resizeDirection == 115)
    :resize -5
    :elseif (s:resizeDirection == 116)
    :resize +5
    :elseif (s:resizeDirection == 119)
    :vertical resize +8
    :elseif (s:resizeDirection == 110)
    :vertical resize -8
    :endif
    :redraw!
  endwhile
endfunction

