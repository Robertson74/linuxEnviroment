function! RefreshClass(sourceDir, excludeDirs)

endfunction

let completionIdentifiers = [ ['>', [ 'public_methods', 'public_properties' ] ], [':', [ 'status_methods', 'constans' ] ], ['$', [ 'buffer_variables' ] ], [' ', [ 'nothing' ] ] ]
inoremap <C-A> <ESC>:call IdentifierTest(completionIdentifiers)<CR>
function! IdentifierTest(completionIdentifiers)
  let s:identifiers = []
  for s:completion in a:completionIdentifiers
   call add(s:identifiers, s:completion[0])
  endfor
  let s:identifiers = ['>', ':', '$', ' ']
  let s:column = col('.')
  let s:columnCounter = 1
  let s:line = getline('.')
  let s:searchHint = ''
  while count(s:identifiers, s:line[s:column-s:columnCounter]) == 0 && col('.') != s:columnCounter - 1
    let s:searchHint = s:line[s:column-s:columnCounter].s:searchHint
    let s:columnCounter += 1
  endwhile
  let s:endChar = s:line[s:column-s:columnCounter]
  echom s:searchHint
  echom s:endChar
  echom index(s:identifiers[s:endChar]
endfunction
" $object->mulipl
" $object::
" $someVar
