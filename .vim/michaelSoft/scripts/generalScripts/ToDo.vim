" general todo
function! GoToGeneralToDoFile()
  silent !mkdir -p ~/.michaelSoft/todo/
  vsplit! +e ~/.michaelSoft/todo/general.todo
endfunction
" set up a new day
function! PortUnCompletedToDosToNewDay()
  " set up headers
  norm! gg
  norm! O
  norm! 80i-
  let s:date = strftime("%b %d %Y")
  put=s:date
  " set curosor positions for new day
  let s:newDayPos = getcurpos()
  " check each uncompleted task for pulling to new day
  let s:processing = "true"
  while s:processing == "true"
    /\[\s\]
    norm! V
    redraw!
    let s:bringOver = confirm("Bring task to new day?", "&yes\n&No\n&Done", 1)
    execute "norm! \<esc>"
    if s:bringOver == 3
      let s:processing = "false"
    elseif s:bringOver == 1
      let s:currentTaskInReview = getcurpos()
      norm! Y
      call setpos('.', s:newDayPos)
      norm! p
      call setpos('.', s:currentTaskInReview)
      norm! j^
    endif
  endwhile
endfunction
" project specific
" function! GoToProjectToDoFile()
"   !mkdir -p ./.michaelSoft/todo/
"   e ./.michaelSoft/todo/project.todo
" endfunction

