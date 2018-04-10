function! RandomMarker()
  let save_cursor = getcurpos()
  call PlaceTempArea()
  execute 'norm! Sconsole.log("");'
  let s:randomNum=systemlist("echo $RANDOM")[0]
  execute 'norm! ^f"a'.s:randomNum
  call setpos('.', save_cursor)
endfunction
