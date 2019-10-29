function! EditAngularFileType(param, editType)
  if a:param == 'component'
    call SwitchToAngularFile('ts', a:editType)
  elseif a:param == 'css'
    call SwitchToAngularFile('css', a:editType)
  elseif a:param == 'html'
    call SwitchToAngularFile('html', a:editType)
  endif
endfunction

function! SwitchToAngularFile(extention, splitType)
  let filePath =  expand('%:r').'.'.a:extention
  if a:splitType == 'e'
    execute 'e '.filePath
  elseif a:splitType == 's'
    execute 'vsplit +e '.filePath
  endif
endfunction



