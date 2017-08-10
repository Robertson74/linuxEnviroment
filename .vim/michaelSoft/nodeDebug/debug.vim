" debug line sign
sign define debugLine text=>> linehl=Error
let g:debugSign = 857
let g:debugLine = -1

" start up the debugging process
function! StartDebug()
  call DebugStartUpChecks()
  tabnew +enew
  let g:debug_window = win_getid()
  " let g:debug_job = job_start("node debug build/src/sandbox.js", {'in_mode': 'raw', 'out_mode': 'raw'})
  let g:debug_job = job_start("node debug build/src/sandbox.js", {"mode": "raw"})
  let g:debug_channel = job_getchannel(g:debug_job)
  " call DebugDisplayFullFile()
endfunction

" close the debug window and connection
function! CloseDebugSession()
  let s:currentWindow = -1
  if win_getid() == g:debug_window
    let s:currentWindow = win_getid()
  endif
  if g:debug_window > 0
    call win_gotoid(g:debug_window)
    q!
    let g:debug_window = -1
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
  " g/^.\s*\d\+\s/s///
  if match(line('.'), '^.\?>')
    execute "sign place ".g:debugSign." line=".line('.')." name=debugLine buffer=".bufnr('%') 
    let g:debugLine = line('.')
  endif
  " silent! %s/^.\?>\s*\d\+\s//
  " call setpos('.', [0, g:debugLine, 0, 0])
endfunction

" dumps output to the file
function! DebugDisplayOutput(channel, msg)
  let g:test = a:msg
  echom a:msg
  put=a:msg
  " call DebugFormatOutput()
endfunction

" display debugging file
function! DebugDisplayFullFile()
  call win_gotoid(g:debug_window)
  %d
  call ch_sendraw(g:debug_channel, "list(1000)\r", {"callback": "DebugDisplayOutput"})
  set syntax=typescript
endfunction!
