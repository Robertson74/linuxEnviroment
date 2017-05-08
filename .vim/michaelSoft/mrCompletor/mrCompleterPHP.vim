function! RefreshClass(sourceDir, excludeDirs)

endfunction

inoremap <C-A> <ESC>:call IdentifierTest()<CR>
function! IdentifierTest()
  let s:identifiers = ['>', ':', '$', ' ']
  let s:column = col('.')
  let s:columnCounter = 1
  let s:line = getline('.')
  let s:searchHint = ''
  while count(s:identifiers, s:line[s:column-s:columnCounter]) == 0 && col('.') != s:columnCounter - 1
    let s:searchHint = s:line[s:column-s:columnCounter].s:searchHint
    let s:columnCounter += 1
  endwhile
  echom s:searchHint
endfunction
" $object->mulipl
" $object::
" $someVar
