nnoremap <Leader>qq :call Testing()<CR>
function! Testing()
  vsplit +enew
  let s:nodeModules = systemlist("cat ./package.json")
  silent put=s:nodeModules
  call search('"dependencies": {')
  norm! ggdndd
  call search("}")
  norm! dG
  silent %s/":.*//
  silent %s/\/.*//
  silent %s/^\s*"//
  %sort u
  au BufLeave <buffer> bd!
  nnoremap <buffer> <CR> :let g:nodeModulesFocusedDir = expand("<cWORD>")<CR>:call ListExports(g:nodeModulesFocusedDir)<CR>
endfunction

function! ListExports(dir)
  %d
  let s:exports = systemlist("find ./node_modules/" . a:dir . " -name *.d.ts | xargs grep '^export' | sed s/.*:export//")
  silent put=s:exports

endfunction
