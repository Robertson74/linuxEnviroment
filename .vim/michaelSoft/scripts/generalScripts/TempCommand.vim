function! SetTempCommand()
  let s:defaultShort = "qq"
  let s:commandShortcut = input("Temp command shortcut: ", s:defaultShort)
  let s:command = input("what command to bind to qq: ")
  execute "nnoremap <Leader>".s:commandShortcut." :".s:command."<CR>"
  if !exists('g:tempCommands')
    let g:tempCommands = []
  endif
  echom " setting..."
  call add(g:tempCommands, s:defaultShort)
endfunction

function! ClearTempCommand()
  if !exists('g:tempCommands')
    let g:tempCommands = []
  endif
  for s:cmd in g:tempCommands
    execute "unmap <Leader>".s:cmd
  endfor
  let g:tempCommands = []
  echom "cleared temp commands..."
endfunction
