function! ToogleZoomHorizontal()
  if !exists('t:zoomedStatus')
    let t:zoomedStatus = 'false'
  endif
  if t:zoomedStatus == 'true'
    execute "norm! \<C-W>="
    let t:zoomedStatus = "false"
    echo "un-zoom"
  else
    execute "norm! \<C-W>500>"
    let t:zoomedStatus = "true"
    echo "zoom"
  endif
endfunction
function! ToogleZoomVertical()
  if !exists('t:zoomedStatus')
    let t:zoomedStatus = 'false'
  endif
  if t:zoomedStatus == 'true'
    execute "norm! \<C-W>="
    let t:zoomedStatus = "false"
    echo "un-zoom"
  else
    execute "norm! \<C-W>500+"
    let t:zoomedStatus = "true"
    echo "zoom"
  endif
endfunction
function! ToogleZoomSplit()
  if !exists('t:zoomedStatus')
    let t:zoomedStatus = 'false'
  endif
  if t:zoomedStatus == 'true'
    call UnZoomSplit()
    echo "un-zoom"
  elseif t:zoomedStatus == 'false'
    call ZoomSplit()
    echo "zoom"
  endif
endfunction
function! ZoomSplit()
  let s:returnWindow = win_getid()
  let t:zoomList = []

  windo call add(t:zoomList, [win_getid(), winheight('.'), winwidth('.'), winsaveview()])
  call win_gotoid(s:returnWindow)
  vertical res 1000
  res 1000
  let t:zoomedStatus = 'true'
endfunction

function! UnZoomSplit()
  if exists('t:zoomedStatus') == 0 || t:zoomedStatus == 'false'
    let t:zoomedList = []
  endif
  let s:returnWin = win_getid()
  for split in t:zoomList
    call win_gotoid(split[0])
    exec "res ".split[1]
    exec "vertical res ".split[2]
    call winrestview(split[3])
  endfor
  let t:zoomList = reverse(t:zoomList)
  for split in t:zoomList
    call win_gotoid(split[0])
    exec "res ".split[1]
    exec "vertical res ".split[2]
    call winrestview(split[3])
  endfor
  call win_gotoid(s:returnWin)
  let t:zoomedStatus = 'false'
  unlet t:zoomList
endfunction
