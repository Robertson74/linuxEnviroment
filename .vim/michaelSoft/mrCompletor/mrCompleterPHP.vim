function! RefreshClass(sourceDir, excludeDirs)

endfunction

let g:MRCcompletionIdentifiers = {'>': [ 'public_methods', 'public_properties' ], ':': [ 'status_methods', 'constans' ], '$': [ 'buffer_variables' ], ' ': [ 'nothing' ]} 
inoremap <C-A> <ESC>:call IdentifierTest(MRCcompletionIdentifiers)<CR>

function! IdentifierTest(completionIdentifiers)
  "get identifiers to find
  let s:identifiers = keys(a:completionIdentifiers)
  let s:column = col('.')
  let s:columnCounter = 1
  let s:line = getline('.')
  let s:completionHint = ''
  while count(s:identifiers, s:line[s:column-s:columnCounter]) == 0 && col('.') != s:columnCounter - 1
    let s:completionHint = s:line[s:column-s:columnCounter].s:completionHint
    let s:columnCounter += 1
  endwhile
  let s:endChar = s:line[s:column-s:columnCounter]
  let s:typeToComplete = get(a:completionIdentifiers, s:endChar)
  echom string(s:typeToComplete)
  echom s:completionHint
endfunction
" $object->mulipl
" $object::te
" $someVar
