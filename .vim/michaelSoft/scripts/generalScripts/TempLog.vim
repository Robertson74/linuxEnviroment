function! TempLog(word)
  if a:word ==# 'word'
    norm! yiwo
  elseif a:word ==# 'WORD'
    norm! yiWo
  endif
  norm! p
  call PlaceTempArea()
  norm! kddkPjjddk
  call ToggleWrapInConsoleLog()
  norm! YP
  exec "s/(/('"
  exec "s/);/');"
endfunction
