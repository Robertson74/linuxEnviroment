" debug line sign
sign define debugLine text=>> linehl=Error
let g:debugSign = 857
let g:debugLine = -1

" start up the debugging process
function! StartDebugSession()
  call DebugStartUpChecks()
  tabnew +enew
  call DebugSetBinds()
  let g:debug_window = win_getid()
  " let g:debug_job = job_start("node debug build/src/sandbox.js", {"mode": "raw", "callback": "DebugDisplayOutput"})
  let g:debug_job = job_start("node debug build/src/sandbox.js", {"mode": "raw"})
  let g:debug_channel = job_getchannel(g:debug_job)
  sleep 1
  call DebugDisplayFullFile()
endfunction

" close the debug window and connection
function! CloseDebugSession()
  let s:currentWindow = -1
  if win_getid() != g:debug_window
    let s:currentWindow = win_getid()
  endif
  if g:debug_window > 0
    if win_gotoid(g:debug_window) == 1
      q!
      let g:debug_window = -1
    endif
  endif
  call job_stop(g:debug_job)
  if s:currentWindow > 0
    call win_gotoid(s:currentWindow)
  endif
endfunction

" check variables before starting the debugging process
function! DebugStartUpChecks()
  if exists("g:debug_window")
    if win_gotoid(g:debug_window) > 0
      :q!
    endif
  else
    let g:debug_window = -1
  endif
  if exists("g:debug_channel")
    if ch_status(g:debug_channel) != "closed"
      call ch_close(g:debug_channel)
    endif
  endif
endfunction

" send a command to the debugger
function! DebugSendCommand(cmd)
  call ch_sendraw(g:debug_channel, a:cmd."\r")
  sleep 500m
  call DebugDisplayFullFile()
endfunction

" jump to the debugging windows
function! GoToDebugWindow()
  if g:debug_window > 0 
    call win_gotoid(g:debug_window) 
  else 
    echom "no debug window" 
  endif
endfunction

" format the debugging window
function! DebugFormatOutput()
  %s/.\(.*\)/\1/
  silent! g/bug>/d
  " g/^\.\?>/execute "sign place ".g:debugSign." line=".line('.')." name=debugLine buffer=".bufnr('%') 
  set syntax=typescript
  set nonu nornu
endfunction

" dumps output to the file
function! DebugDisplayOutput(channel, msg)
  %d
  put=a:msg
  call DebugFormatOutput()
endfunction

" display debugging file
function! DebugDisplayFullFile()
  call win_gotoid(g:debug_window)
  call ch_sendraw(g:debug_channel, "list(1000)\r", {"callback": "DebugDisplayOutput"})
endfunction!

function! DebugSetBinds()
  nnoremap <buffer> r :call DebugDisplayFullFile()<CR>
  nnoremap <buffer> n :call DebugSendCommand("n")<CR>
endfunction
