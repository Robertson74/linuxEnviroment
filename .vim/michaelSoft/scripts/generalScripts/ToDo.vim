" general todo
function! GoToGeneralToDoFile()
  silent !mkdir -p ~/.michaelSoft/todo/
  vsplit! +e ~/.michaelSoft/todo/general.todo
endfunction
" project specific
" function! GoToProjectToDoFile()
"   !mkdir -p ./.michaelSoft/todo/
"   e ./.michaelSoft/todo/project.todo
" endfunction

