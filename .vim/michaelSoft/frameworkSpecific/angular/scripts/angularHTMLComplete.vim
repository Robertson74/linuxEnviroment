nnoremap <Leader>anh :call AngularHTMLComplete()<CR>
nnoremap <Leader>ant :call AngularTagComplete()<CR>

function! AngularTagComplete()
  let s:save_cursor=getcurpos()
  call search("<", "b")
  let s:selector=expand("<cWORD>")
  let s:selector=substitute(s:selector, "<", "", "")
  let s:selector=substitute(s:selector, ">.*", "", "")
  call setpos('.', s:save_cursor)
  let s:completeOptions=AngularComplete(s:selector)
  call AngularPresentCompleteResults(s:completeOptions)
endfunction

function! AngularHTMLComplete()
  let s:file=expand("%:t")
  let s:componentFile=substitute(s:file, "html", "ts", "")
  let s:filePath=expand("%:h")
  let s:componentPath=s:filePath."/".s:componentFile
  let s:selectorLine=systemlist("grep 'selector:' ".s:componentPath)[0]
  let s:selector=substitute(s:selectorLine, ".*: ", "", "")
  let s:selector=substitute(s:selector, "'", "", "g")
  let s:selector=substitute(s:selector, '"', "", "g")
  let s:selector=substitute(s:selector, ',', "", "g")
  let s:completeOptions=AngularComplete(s:selector)
  call AngularPresentCompleteResults(s:completeOptions)
endfunction

function! AngularPresentCompleteResults(completeOptions)
  silent split +enew
  silent put=a:completeOptions
  norm! gg
  nnoremap <buffer> <CR> :call AddAngularCompleteOption()<CR>
endfunction

function! AddAngularCompleteOption()
  let s:selectedComplete=expand("<cword>")
  bd!
  execute "norm! a".s:selectedComplete
endfunction


function! AngularComplete(selector)
  let s:componentFile=systemlist("grep -R 'selector.*".a:selector."' ./src") 
  if len(s:componentFile) == 0
    echoerr "no component file found"
  elseif len(s:componentFile) > 1
    echoerr "multiple component files found"
  else
    let s:componentFile=s:componentFile[0]
  endif
  let s:componentFile=substitute(s:componentFile, ":.*", "", "")
  let completeLines=systemlist('grep "public.*\(:\|(\)" '.s:componentFile)
  return completeLines
endfunction

