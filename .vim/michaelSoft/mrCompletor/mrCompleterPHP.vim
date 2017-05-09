function! MRCgetIdentifiersPHP(identifierMap)
  " return if no identifer map supplied
  if empty(a:identifierMap)
    return false
  endif
  "get identifiers to find
  let s:identifiers = keys(a:identifierMap)
  let s:column = col('.')
  let s:columnCounter = 1
  let s:line = getline('.')
  let s:completionHint = ''
  while count(s:identifiers, s:line[s:column-s:columnCounter]) == 0 && col('.') != s:columnCounter - 1
    let s:completionHint = s:line[s:column-s:columnCounter].s:completionHint
    let s:columnCounter += 1
  endwhile
  let s:endChar = s:line[s:column-s:columnCounter]
  let s:typeToComplete = get(a:identifierMap, s:endChar)
  if count(s:identifiers, s:endChar) == 0
    let s:typeToComplete = [ 'nothing' ]
  else
    let s:typeToComplete = get(a:identifierMap, s:endChar)
  endif
  return [s:typeToComplete, s:completionHint]
endfunction

function! MRCgetObjectClassPHP(objectFormat)
  return "object"
endfunction

function! MRCgetObjectTextPHP(objectFormat)
  if empty(a:objectFormat)
    return false
  endif
  let s:beginObjectSymbols = a:objectFormat[0]
  let s:endObjSymbols = a:objectFormat[1]
  let s:cursorColumn = col('.')
  let s:columnCounter = 1
  let s:line = getline('.')
  let s:objectText = ''

  " iterate back till found object start symbol
  while count(s:beginObjectSymbols, s:line[s:cursorColumn-s:columnCounter]) == 0 && col('.') != s:columnCounter - 1
    let s:columnCounter += 1
  endwhile

  let s:objStartCol = s:cursorColumn-s:columnCounter
  let s:columnCounter = 1
  " iterate forward saving symbols till found object end
  while count(s:endObjSymbols, s:line[s:objStartCol+s:columnCounter]) == 0 && s:columnCounter != col('$')
    let s:objectText = s:objectText.s:line[s:objStartCol+s:columnCounter]
    let s:columnCounter += 1
  endwhile
  return s:objectText
endfunction
