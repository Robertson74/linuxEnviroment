" extend screen to another split
function! ExtendScreenUp()
  if (!exists('b:extendedUpList'))
    :let b:extendedUpList = [] 
  endif
  if(!exists('b:extendedUpWindow'))
    let b:extendedUpWindow = win_getid()
  endif
  if (!exists('b:extendedViews'))
    :let b:extendedViews = [] 
    :call add(b:extendedViews, win_getid())
  endif
  :let s:startWindow = win_getid()
  for window in b:extendedViews
    :call win_gotoid(window)
    :set noscrollbind
  endfor
  :call win_gotoid(b:extendedUpWindow)
  :vsp
  :execute "set splitright" 
  :2vsp ~/.vim/michaelSoft/extendwindows/middlePaneUp
  :execute "set nosplitright" 
  :set wfw
  :let s:divider = win_getid()
  :let b:baseWindow = s:startWindow
  :execute "normal! \<C-w>h"
  :let b:baseWindow = s:startWindow
  :let s:newExtendedUpWindow = win_getid()
  :normal! Hzb
  :call win_gotoid(s:startWindow)
  :call add(b:extendedUpList, s:divider)
  :call add(b:extendedUpList, s:newExtendedUpWindow)
  :call add(b:extendedViews, s:newExtendedUpWindow)
  :let b:extendedUpWindow = s:newExtendedUpWindow
  for window in b:extendedViews
    :call win_gotoid(window)
    :set scrollbind
    :set nowrap
  endfor
  :call win_gotoid(s:startWindow)
  :set nowrap
endfunction
""""""" Extending screen down
function! ExtendScreenDown()
  if (!exists('b:extendedDownList'))
    :let b:extendedDownList = [] 
  endif
  if(!exists('b:extendedDownWindow'))
    let b:extendedDownWindow = win_getid()
  endif
  if (!exists('b:extendedViews'))
    :let b:extendedViews= [] 
    :call add(b:extendedViews, win_getid())
  endif
  :let s:startWindow = win_getid()
  for window in b:extendedViews
    :call win_gotoid(window)
    :set noscrollbind
  endfor
  :call win_gotoid(b:extendedDownWindow)
  :execute "set splitright" 
  :vsp
  :execute "set nosplitright" 
  :2vsp ~/.vim/michaelSoft/extendwindows/middlePaneDown
  :set wfw
  :let s:divider = win_getid()
  :let b:baseWindow = s:startWindow
  :execute "normal! \<C-w>l"
  :let b:baseWindow = s:startWindow
  :let s:newExtendedDownWindow = win_getid()
  :normal! Lzt
  :call win_gotoid(s:startWindow)
  :call add(b:extendedDownList, s:divider)
  :call add(b:extendedDownList, s:newExtendedDownWindow)
  :call add(b:extendedViews, s:newExtendedDownWindow)
  :let b:extendedDownWindow = s:newExtendedDownWindow
  for window in b:extendedViews
    :call win_gotoid(window)
    :set scrollbind
    :set nowrap
  endfor
  :call win_gotoid(s:startWindow)
  :set nowrap
endfunction
""""""" close screen extend
function! CloseScreenExtend()
  if (exists('b:baseWindow'))
    :call win_gotoid(b:baseWindow)
  endif
  if (!exists('b:extendedDownList'))
    :let b:extendedDownList = [] 
  endif
  if (!exists('b:extendedUpList'))
    :let b:extendedUpList = [] 
  endif
  :let s:startWindow = win_getid()
  for window in b:extendedDownList
    :call win_gotoid(window)
    if(window == win_getid())
      :close
    endif
  endfor
  for window in b:extendedUpList
    :call win_gotoid(window)
    if(window == win_getid())
      :close
    endif
  endfor
  :call win_gotoid(s:startWindow)
  :set noscrollbind
  :let b:extendedDownWindow = win_getid()
  :let b:extendedUpWindow = win_getid()
  :let b:extendedDownList = [] 
  :let b:extendedViews = [win_getid()] 
endfunction

