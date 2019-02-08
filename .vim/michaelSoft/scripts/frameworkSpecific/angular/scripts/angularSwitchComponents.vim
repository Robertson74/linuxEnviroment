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
