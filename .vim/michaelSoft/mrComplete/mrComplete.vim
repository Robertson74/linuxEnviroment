nnoremap <Leader>cd :call MRCremoveObjectCacheEntry()<CR>
"cache files
let g:MRCfilePaths = { 'filePaths': { 'MRCDIR': '.michaelSoft/mrCompleter/', 'varCacheFile': 'varCache.mr' } }
" php completer config and logic
source ~/.vim/michaelSoft/mrComplete/mrCompletePHP.vim

"testing----------------------------------------------------------
 " let g:MRCdefinitions = g:MRCdefinitionsPHP
 " inoremap <buffer> <C-C> <C-R>=MRComplete(g:MRCdefinitionsPHP)<CR>
 " $testObject->456
 " $testObject->
 " $anotherObject->
 " cammel case split a word
 " let cam = join(split(expand("<cword>"), '[a-z]\([A-Z]\)\@=\zs'), '.*')
"testing----------------------------------------------------------

" main completor funciton
function! MRComplete(MRCdefinitions)
  " get identifiers behind cursor
  let s:completionHint = MRCgetIdentifiers(get(a:MRCdefinitions, 'identifierMap'))
  if s:completionHint[0][0] == 'nothing'
    echom string(s:completionHint )
    call confirm("Can't complete this...")
    return ''
  endif

  " get object class/type automatically
  let s:objectInfo = MRCdetectObjectClass(get(a:MRCdefinitions, 'objectFormat'), get(a:MRCdefinitions, 'filePaths'))
  if empty(s:objectInfo)
    " if the object class can not be automatically detected, ask the user
    silent call MRCaddObjectClassFromUserSelection(s:objectText, get(a:MRCdefinitions, 'fileSearchingParams'), 'targeted')
    return 
  endif

  " find completions for object based on identifier
  let s:completions = MRCgetCompletionsForObject(s:objectInfo, s:completionHint[0] ,get(a:MRCdefinitions, 'findInstructions'), get(a:MRCdefinitions, 'completionTypesToOmni'))
  " find completion lists find 
  if empty(s:completions)
    call confirm("No completions found...")
    return
  endif

  " format and filter completion items
  let s:filteredCompletions = MRCformatFileterCompletions(s:completions, s:completionHint)

  if empty(s:filteredCompletions)
    :stopinsert
    call confirm("Nothing to complete for ".get(s:objectInfo[0], 'var')." with hint ".string(s:completionHint[1]))
    return
  else
    let s:hintLength = strlen(s:completionHint[1])
    :startinsert
    " add this back when hint checking is enabled
    call complete(col('.') - s:hintLength, s:filteredCompletions)
    " call complete(col('.'), s:filteredCompletions)
    return ''
  endif
endfunction
" $testObject->getP

function! MRCgetCompletionsForObject(objectInfo, completionTypes, findInstructions, completionToOmni)
  let s:omniCompletions = []
  for s:completionType in a:completionTypes
    let s:newCompletions = MRCgetCompletionsByCompletionType(a:objectInfo, s:completionType, a:findInstructions, a:completionToOmni)
    if type(s:newCompletions) == type([])
      if empty(s:omniCompletions) == 1
        let s:omniCompletions = s:newCompletions
      else
        let s:omniCompletions = add(s:omniCompletions, s:newCompletions)
      endif
    endif
  endfor
  return s:omniCompletions
endfunction

" gets completions lines by looking at find instructions and completionsType, and greping/seding the object file
function! MRCgetCompletionsByCompletionType(objectInfo, completionType, findInstructions, completionToOmni)
  " vim's number type for lists and strings, for error checking
  let s:listType = 3
  let s:stringType = 1
  " entry error checking that instructions and completionToOmni are set
  let s:instructionForType = get(a:findInstructions, a:completionType)
  let s:omniTypeForType = get(a:completionToOmni, a:completionType)
  if type(s:instructionForType) != s:listType
    echom "No completion instructions for completion type '".a:completionType."'"
    return
  elseif type(s:omniTypeForType) != s:stringType
    echoerr "No completionType to omniType mapping found for completionType ".a:completionType."'"
    return
  endif
  " holds the raw lines that come back from grep/sed
  let s:rawCompletionLines = '' 
  " final vim completion dics to be returned
  let s:completions = []
  " for each instruction found for a completion type...
  let s:findInstructions = get(a:findInstructions, a:completionType)
  for s:instruction in s:findInstructions
    " ...run a grep/sed combo to get a raw completion line on each file in the objectInfo dic
    for s:objectRecord in a:objectInfo
      let s:grepSedRawLines = system("grep '".get(s:instruction, 'grepFindCommand')."' ".get(s:objectRecord, "objectFile"). " | sed '".get(s:instruction, 'sedFormatCommand')."'")
      let s:rawCompletionLines = s:rawCompletionLines.''.s:grepSedRawLines
    endfor
  endfor
  " split all the raw lines found and convert them to vim completions, adding type from the instructions
  let s:rawLinesArr = split(s:rawCompletionLines, '\n')
  let s:rawLinesArr = sort(s:rawLinesArr)
  for s:rawLine in s:rawLinesArr
    let s:newCompletion = {'word': s:rawLine, 'kind': get(a:completionToOmni, a:completionType)}
    call add(s:completions, s:newCompletion)
  endfor
  return s:completions
endfunction

"filter completions that don't match the hint, and return
function! MRCformatFileterCompletions(completions, completionHint)
  let s:filteredCompletions = []
  for s:completion in a:completions
    if match(get(s:completion, 'word'), a:completionHint[1]) > -1
      call add(s:filteredCompletions, s:completion)
    endif
  endfor
  return s:filteredCompletions
endfunction

" formats and filters back completions to show user
" function! MRCformatFileterCompletions(completionHint, completionInfo)
"   let s:completionsFinal = []
"   for s:completionType in a:completionHint[0]
"     if s:completionType == 'method'
"       let s:completionsFinal = extend(s:completionsFinal, MRCformatMethods(get(a:completionInfo, 'methods')))
"     elseif s:completionType == 'var'
"     elseif s:completionType == 'const'
"       let s:completionsFinal = extend(s:completionsFinal, MRCformatConsts(get(a:completionInfo, 'consts')))
"     elseif s:completionType == 'class'
"     endif
"   endfor
"   let s:completionsFinal = MRCfilterCompletionByHint(s:completionsFinal, a:completionHint)
"   return s:completionsFinal
" endfunction

function! MRCformatConsts(consts)
  let s:constsCompletions = []
  for s:const in sort(a:consts)
    let s:constsCompletion = {'word': s:const, 'kind': 'v'}
    call add(s:constsCompletions, s:constsCompletion)
  endfor
  return s:constsCompletions
endfunction

" format methods into a vim completion dictionary
function! MRCformatMethods(methods)
  let s:methodCompletions = []
  for s:method in sort(a:methods)
    if match(s:method, '__construct') == -1
      let s:methodCompletion = {'word': s:method, 'kind': 'f'}
      call add(s:methodCompletions, s:methodCompletion)
    endif
  endfor
  return s:methodCompletions
endfunction

" filters out all completions that don't match the hint behind the cursor
function! MRCfilterCompletionByHint(completions, hint)
  let s:filteredCompletions = []
  if a:hint[1] == ''
    return a:completions
  endif
  let s:hintText = a:hint[1]
  for s:completionItem in s:completions
    let s:completeWord = get(s:completionItem, 'word')
    if match(s:completeWord, s:hintText) > -1
      call add(s:filteredCompletions, s:completionItem)
    endif
  endfor
  return s:filteredCompletions
endfunction

" uses objectInfo to search cache class and return relevant info
function! MRCgetCacheCompletions(objectInfo)
  let s:methods = []
  let s:vars = []
  let s:consts = []
  let s:class = []
  for obj in a:objectInfo
    let s:objectFile = get(obj, 'objectFile')
    let s:objectFile = substitute(s:objectFile, '/', '\\/', 'g')
    let s:completionItem = system("sed -n '/block,.\\//{:a;N;/endBlock,.\\//!ba; /".s:objectFile."/p}' ".g:completerCacheDir."".g:completerCacheFile)
    for s:line in split(s:completionItem, '\n')
      if match(s:line, "^method") > -1
        call add(s:methods, split(s:line, ',./')[1])
      elseif match(s:line, "^class") > -1
        call add(s:class, split(s:line, ',./')[1])
      elseif match(s:line, "^const") > -1
        call add(s:consts, split(s:line, ',./')[1])
      elseif match(s:line, "^var") > -1
        call add(s:vars, split(s:line, ',./')[1])
      endif
    endfor
  endfor
  let s:completionDic = {"methods": s:methods, "class": s:class, "vars": s:vars, "consts": s:consts}
  return s:completionDic
endfunction

" get the identifier eg the > in $object->text
function! MRCgetIdentifiers(identifierMap)
  " return if no identifer map supplied
  if empty(a:identifierMap)
    return false
  endif
  "get identifiers to find
  let s:identifiers = keys(a:identifierMap)
  let s:column = col('.') - 1
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

" gets the text of the object, then determines what class the object is
function! MRCdetectObjectClass(objectFormat, filePaths)
  " get object text
  let s:objectText = MRCgetObjectText(a:objectFormat)
  let s:objectInfo = MRCgetClassFromVarCache(s:objectText, a:filePaths)
  " TODO SEARCH FOR VARIABLES WITH MATCHING TEXT AND PRESENT TO USER FOR PICK
  " TODO SEARCH FOR CLASSES THAT ARE SIMILAR TO THE OBJECT TEXT
  " if all else fails, ask the user to pick from all classes
  return s:objectInfo
endfunction

" gets object text
" by iterating back until start symbol is found, then iterating forward till start symbol is found
function! MRCgetObjectText(objectFormat)
  if empty(a:objectFormat)
    echoe "NO OBJECT DEFINED"
    return false
  endif
  " get object beginning and ending symbols
  let s:beginObjectSymbols = get(a:objectFormat, 'objectBeginning')
  let s:endObjSymbols = get(a:objectFormat, 'objectEnd')
  " position of the cursor
  let s:cursorColumn = col('.')
  " counter for iterating back and forth
  let s:columnCounter = 1
  " line text
  let s:line = getline('.')
  " will contain object text
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

" presents classes in new buffer to user for selection, returns [class, file]
" searchType determines the scope of the search, can be 'targeted' or 'global'
function! MRCaddObjectClassFromUserSelection(objectText, searchParams, searchType)
  let s:displayText = 'What class is this object: '.a:objectText
  " file searching logic from definitions
  let s:fileDefinition = get(a:searchParams, 'searchFilesRegex')
  let s:classDefinition = get(a:searchParams, 'searchClassesRegex')
  let s:classIgnore = get(a:searchParams, 'classIgnoreRegex')
  if a:searchType == 'targeted'
    let s:fileSearchDir = get(a:searchParams, 'targetedFileSearchDir')
    " pop new tab
    tabnew
    tabmove -1
  else
    let s:fileSearchDir = get(a:searchParams, 'globalFileSearchDir')
    " delete in current buffer
    %d
  endif
  " run the search
  execute  "r!find '".s:fileSearchDir."' -regex '".s:fileDefinition."' | xargs grep '".s:classDefinition."'"
  "switch file and class based on the colon
  %s/\(.*\)\s*:\s*\(.*\)/\2:\1
  " sort the list
  %sort
  " filter only the class names
  %s/^class\s\(\S\+\).*:/\1:/
  " column out the selection so that there class-----file
  %!column -s":" -t
  " filter out the class formates to ignore
  if s:classIgnore
    execute "g/".s:classIgnore."/d"
  endif
  normal! gg
  put!=s:displayText
  stopinsert
  let g:MRCobjectSelectionText = a:objectText
  let g:MRCsearchParams = a:searchParams
  nnoremap <buffer> <CR> :call MRCselectClassFileLine(g:MRCobjectSelectionText)<CR>
  if a:searchType == 'targeted'
    nnoremap <buffer> <Leader>g :silent call MRCaddObjectClassFromUserSelection(g:MRCobjectSelectionText, g:MRCsearchParams, 'global')<CR>
  else 
    nnoremap <buffer> <Leader>g :silent call MRCaddObjectClassFromUserSelection(g:MRCobjectSelectionText, g:MRCsearchParams, 'targeted')<CR>
  endif
endfunction

" $object->te
" gets and formats a class from the classCache
function! MRCselectClassFileLine(objectText)
  let s:line = getline('.')
  let s:class =  split(s:line, '\s\+')[0]
  let s:classFile =  split(s:line, '\s\+')[1]
  bd!
  call MRCaddVarCache(s:class, s:classFile, a:objectText)
endfunction

" $objectTest2->1230
" adds line to varCache, linking the variable (objectText), the class, and the classes' file together in the cache
function! MRCaddVarCache(class, classFile, objectText)
  let s:filePaths = get(g:MRCdefinitions, 'filePaths')
  let s:completerCacheDir = get(s:filePaths, 'MRCDIR')
  let s:completerVarFile = get(s:filePaths, 'varCacheFile')
  let s:editFile = @%
  let s:editMethod = MRCfindCurrentMethod()
  let s:varText = a:objectText
  let s:objectFile = a:classFile
  let s:line = 'line'
  let s:objectClass = s:class
  let s:cacheLine = s:line.',./file:'.s:editFile.',./fileMethod:'.s:editMethod.',./varText:'.s:varText.',./objectFile:'.s:objectFile.',./class:'.s:objectClass.',./'
  " line,./file:.michaelSoft/mrCompleter/varCache.mr,./fileMethod:unknown,./varText:objectTest2,./objectFile:./src/APIBundle/Entity/APIRequest.php,./class:APIRequest,./
  execute "silent !echo ".s:cacheLine." >> ".s:completerCacheDir."".s:completerVarFile
  echom a:objectText." added to variable cache."
  set nocursorcolumn
  nohlsearch
  return
endfunction

" finds the current method name for caching purposes
" TODO abstract class finding regex
function! MRCfindCurrentMethod()
  let s:methodLine = getline(search('\(function.*(\|^\s*class\s\)','bnW'))
  if empty(s:methodLine)
    return 'unknown'
  endif
  let s:methodName = substitute(s:methodLine, '.*function\S*\s*\(\w\+\).*', '\1', '')
  return s:methodName
endfunction


" gets lines from the variable cache
" searches for a object mapping based on the current method name, filename, and object text
" cache format is as follows:
" line,./file:<FILE>,./method:<METHOD>,./varText:<VARTEXT>,./objectFile:<OBJECTFILE>,./class:<CLASSNAME>,./
function! MRCgetClassFromVarCache(objectText, filePaths)
  " get file paths
  let s:cacheDir = get(a:filePaths, 'MRCDIR')
  let s:cacheFile = get(a:filePaths, 'varCacheFile')
  let s:cachePath = s:cacheDir.''.s:cacheFile
  let s:editMethod = MRCfindCurrentMethod()
  let s:grepSearchText = 'grep ",./file:'.@%.',./fileMethod:'.s:editMethod.',./varText:'.a:objectText.'" '.s:cachePath
  let s:escapedSearchText = substitute(s:grepSearchText, '/', '\\/', 'g')
  " create cache if needed
  if empty(glob(s:cachePath))
    silent execute "mkdir -p ".s:cacheDir
    silent execute "touch ".s:cachePath
  endif
  " grep the cache file by file:method:variableText
  let s:cacheInfo = system('grep ",.\/file:'.@%.',.\/fileMethod:'.s:editMethod.',.\/varText:'.a:objectText.'" '.s:cachePath)
  " line,./file:/home/vagrant/.vim/michaelSoft/mrCompletor/mrCompleter.vim,./fileMethod:MRCselectClassFileLine,./varText:objectTest2,./objectFile:./src/CCPBundle/Entity/Chargeback.php,./class:Chargeback,./
  let s:cacheInfo = split(s:cacheInfo, '\n')
  let s:formattedCacheInfo = []
  " for each line found, convert to object dictionary
  for s:cacheLine in s:cacheInfo
    let s:cacheLineArr = split(s:cacheLine, ',./')
    let s:file = split(s:cacheLineArr[1], ':')[1]
    let s:fileMethod = split(s:cacheLineArr[2], ':')[1]
    let s:var = split(s:cacheLineArr[3], ':')[1]
    let s:objectFile = split(s:cacheLineArr[4], ':')[1]
    let s:class = split(s:cacheLineArr[5], ':')[1]
    " final object dic
    let s:cacheDic = {'file': s:file, 'var': s:var, 'objectFile': s:objectFile, 'fileMethod': s:fileMethod, 'class': s:class}
    " add to total
    call add(s:formattedCacheInfo, s:cacheDic)
  endfor
  return s:formattedCacheInfo
endfunction

function! MRCremoveObjectCacheEntry()
  "cache
  let s:filePaths = get(g:MRCfilePaths, 'filePaths')
  let s:cacheFile = get(s:filePaths, 'MRCDIR').''.get(s:filePaths, 'varCacheFile')
  "get the word under cursor
  let s:word = expand('<cword>')
  "get the method name
  let s:method = MRCfindCurrentMethod()
  "get the file name
  let s:file = @%
  "confirm cache line is found
  " echom 'grep ",.\/file:'.s:file.',.\/fileMethod:'.s:method.',.\/varText:'.s:word.'" '.s:cacheFile
  let s:grepLine = 'grep ",./file:'.s:file.',./fileMethod:'.s:method.',./varText:'.s:word.',./" '.s:cacheFile
  let s:cacheLine = system(s:grepLine)
  if len(s:cacheLine) > 1
    let s:sedLine = s:file.'.*'.s:method.'.*'.s:word
    let s:sedLine = escape(s:sedLine, '/')
    let s:sedCommand = 'sed -i "/'.s:sedLine.'/d"'
    let s:deleteResult = system(s:sedCommand.' '.s:cacheFile)
    let g:debug = s:sedCommand.' '.s:cacheFile
    call confirm('Cache line deleted for variable '.s:word)
  else 
    call confirm('Could not find cache line to delete.')
  endif
endfunction
