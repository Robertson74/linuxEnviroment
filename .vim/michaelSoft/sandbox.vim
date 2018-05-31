nnoremap <Leader>tdo :call OpenTodos()<CR>
nnoremap <Leader>tdc :call CloseToDoWins()<CR>
function! OpenTodos()
  if ToDoIsOpen() == 1
    return
  endif
  tabnew
  split +enew
  vsplit +enew
  " todo
  :e ~/.vim/michaelSoft/todo/todo
  :let g:todoWin = win_getid()
  " done
  :execute "norm! \<C-w>j"
  :e ~/.vim/michaelSoft/todo/done
  :let g:doneWin = win_getid()
  :call win_gotoid(g:todoWin)
  " waiting
  :execute "norm! \<C-w>l"
  :e ~/.vim/michaelSoft/todo/waiting
  : let g:waitingWin = win_getid()
  :call win_gotoid(g:todoWin)
  :call SetToDoCommands()
endfunction

function! ToDoIsOpen()
  if exists("g:todoWin") == 1
    call win_gotoid(g:todoWin)
    return 1
  else
    return 0
  endif
endfunction

function! CloseToDoWins()
  let s:startWin = win_getid()
  " todo
  call win_gotoid(g:todoWin)
  wq
  " done
  call win_gotoid(g:doneWin)
  wq
  " waiting
  call win_gotoid(g:waitingWin)
  wq
  "return
  call win_gotoid(s:startWin)
  unlet g:todoWin
  unlet g:waitingWin
  unlet g:doneWin
endfunction

function! SetToDoCommands()
  call win_gotoid(g:todoWin)
  call SetTodoWinCommands()
  call win_gotoid(g:doneWin)
  call SetDoneWinCommands()
  call win_gotoid(g:waitingWin)
  call SetWaitingWinCommands()
  call win_gotoid(g:todoWin)
  norm! ggjjj
endfunction

function! SetTodoWinCommands()
  map <buffer> <CR> :call MoveToDoDone()<CR>
endfunction

function! SetDoneWinCommands()
  map <buffer> <CR> :call MoveBackToToDo()<CR>
endfunction

function! SetWaitingWinCommands()
  map <buffer> <CR> :call MoveBackToToDo()<CR>
endfunction

function! MoveToDoDone()
  let s:doneItem = getline(".")
  norm! dd
  call win_gotoid(g:doneWin)
  norm! ggjj
  put=s:doneItem
  call win_gotoid(g:todoWin)
endfunction

function! MoveBackToToDo()
  let s:returnWin = win_getid()
  let s:toDoItem = getline(".")
  norm! dd
  call win_gotoid(g:todoWin)
  norm! ggjj
  put=s:toDoItem
  call win_gotoid(s:returnWin)
endfunction
