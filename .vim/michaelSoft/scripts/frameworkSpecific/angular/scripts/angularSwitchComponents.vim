nnoremap <Leader>ansc :call AngularSwitchComponent("css", "newWindow")<CR>
nnoremap <Leader>anec :call AngularSwitchComponent("css", "edit")<CR>
nnoremap <Leader>anst :call AngularSwitchComponent("ts", "newWindow")<CR>
nnoremap <Leader>anet :call AngularSwitchComponent("ts", "edit")<CR>
nnoremap <Leader>ansh :call AngularSwitchComponent("html", "newWindow")<CR>
nnoremap <Leader>aneh :call AngularSwitchComponent("html", "edit")<CR>

function! AngularSwitchComponent(switchToExt, editOrNewWindow)
  " get the path head
  let s:path=expand("%:h")
  " get filename no ext
  let s:fileNameNoExt=expand("%:t:r")
  " switch to file with the new extention
  if a:editOrNewWindow == "newWindow"
    execute "vsplit +e ".s:path."/".s:fileNameNoExt.".".a:switchToExt
  elseif a:editOrNewWindow == "edit"
    execute "e ".s:path."/".s:fileNameNoExt.".".a:switchToExt
  endif
endfunction
