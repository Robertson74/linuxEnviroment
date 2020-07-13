function! AngularSwitchComponentFile(fileType, editOrNewWindow)
  " get the path head
  let s:path=expand("%:h")
  " get filename no ext
  let s:fileName=expand("%:t:r:r")
  " switch to file with the new component file
  if a:fileType == "component"
    if a:editOrNewWindow == "newWindow"
      execute "vsplit +e ".s:path."/".s:fileName.".component.ts"
    else
      execute "e ".s:path."/".s:fileName.".component.ts"
    endif
  elseif a:fileType == "html"
    if a:editOrNewWindow == "newWindow"
      execute "vsplit +e ".s:path."/".s:fileName.".component.html"
    else
      execute "e ".s:path."/".s:fileName.".component.html"
    endif
  elseif a:fileType == "module"
    if a:editOrNewWindow == "newWindow"
      execute "vsplit +e ".s:path."/".s:fileName.".module.ts"
    else
      execute "e ".s:path."/".s:fileName.".module.ts"
    endif
  elseif a:fileType == "css"
    if a:editOrNewWindow == "newWindow"
      execute "vsplit +e ".s:path."/".s:fileName.".component.css"
    else
      execute "e ".s:path."/".s:fileName.".component.css"
    endif
  endif
endfunction
