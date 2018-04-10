function! LogVariable()
  let save_cursor = getcurpos()
  let s:varToTrack = expand('<cword>')
  call PlaceTempArea()
  execute "norm! Sconsole.log(".s:varToTrack.");"
  call setpos('.', save_cursor)
endfunction
