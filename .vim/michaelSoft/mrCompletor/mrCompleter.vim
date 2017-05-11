source ~/.vim/michaelSoft/mrCompletor/mrCompleterPHP.vim

let g:completerCacheDir = ".michaelSoft/mrCompleter/"
let g:completerCacheFile = "classCache.mr"
let g:completerVarFile = "varCache.mr"

let g:MRCidentifierMapPHP = {'>': [ 'method', 'var' ], ':': [ 'const' ], '$': [ 'nothing' ], ' ': [ 'nothing' ]} 
let g:MRCObjectFormatPHP = [['$', ' '], ['-', ' ', ':', '[']]
let g:MRCidentifierMap = g:MRCidentifierMapPHP

augroup mrCompletor
  au!
  au BufEnter *.php let g:MRCidentifierMap = g:MRCidentifierMapPHP
  au BufEnter *.php inoremap <buffer> <C-_> <C-R>=MRComplete('PHP')<CR>
augroup END


function! MRComplete(fileType)
  " get identifiers behind cursor
  let s:completionHint = MRCgetIdentifiers(a:fileType)
  if s:completionHint[0][0] == 'nothing'
    echom string(s:completionHint )
    call confirm("Can't complete this...")
    return ''
  endif

  " get object class/type
  let s:objectInfo = MRCgetObjectClass(a:fileType)
  if empty(s:objectInfo)
    return ''
  endif

  " find completion lists
  let s:completionInfo = MRCgetCacheCompletions(s:objectInfo)
  if empty(s:completionInfo)
    call confirm("No completions found...")
    return
  endif

  " format and filter completion items
  let s:completions = MRCformatFileterCompletions(s:completionHint, s:completionInfo)

  " $CCPObject->getTransactionsForMid($mid)
  " $CCPtest->444q
  " $CCPtest::
  " return completions
  if empty(s:completions)
    :stopinsert
    call confirm("Nothing to complete for ".get(s:objectInfo[0], 'var')." with hint ".string(s:completionHint[1]))
    return ''
  else
    let s:hintLength = strlen(s:completionHint[1])
    :startinsert
    call complete(col('.') - s:hintLength, s:completions)
    return ''
  endif
endfunction

" formats and filters back completions to show user
function! MRCformatFileterCompletions(completionHint, completionInfo)
  let s:completionsFinal = []
  for s:completionType in a:completionHint[0]
    if s:completionType == 'method'
      let s:completionsFinal = extend(s:completionsFinal, MRCformatMethods(get(a:completionInfo, 'methods')))
    elseif s:completionType == 'var'
    elseif s:completionType == 'const'
      let s:completionsFinal = extend(s:completionsFinal, MRCformatConsts(get(a:completionInfo, 'consts')))
    elseif s:completionType == 'class'
    endif
  endfor
  let s:completionsFinal = MRCfilterCompletionByHint(s:completionsFinal, a:completionHint)
  return s:completionsFinal
endfunction

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

function! MRCgetIdentifiers(fileType)
  if a:fileType == 'PHP'
    let s:identifiers = MRCgetIdentifiersPHP(g:MRCidentifierMapPHP)
  endif
  return s:identifiers
endfunction

function! MRCgetObjectClass(fileType)
  let s:objectText = MRCgetObjectText(a:fileType)
  let s:objectInfo = MRCgetClassFromCache(s:objectText)
  if !empty(s:objectInfo)
    return s:objectInfo
  endif
  "ask for class and add to var cache if none is found in var cache
  if a:fileType == 'PHP'
    let s:objectInfo = MRCgetObjectInfoFromUser(s:objectText)
  endif
  return s:objectInfo
endfunction

" ask user to provide the object class
function! MRCgetObjectInfoFromUser(objectText)
  " present classes from cache
  let s:classes = system('grep "\(file,.\/\|class,.\/\|^$\)" '.g:completerCacheDir.''.g:completerCacheFile)
  tabnew
  tabmove -1
1 put=s:classes
  silent %s/,.\//:/g
  normal! gg
  " let user select
  :stopinsert
  let s:displayText = 'What class is this object: '.a:objectText
  put!=s:displayText
  normal! j
  let g:MRCobjectText = a:objectText
  nnoremap <buffer> <CR> :call MRCgetClassCacheLine(g:MRCobjectText)<CR>
endfunction

" gets and formats a class from the classCache
function! MRCgetClassCacheLine(objectText)
  let s:class = getline('.')
  let s:file = getline(search('file:', "b"))
  bd!
  let s:classFile = [s:class, s:file]
  call MRCaddVarCache(s:classFile, a:objectText)
endfunction

" adds line to varCache 
" needs [class, file] and object text
function! MRCaddVarCache(classFile, objectText)
  let s:line = 'line'
  let s:editFile = @%
  let s:var = a:objectText
  let s:objectFile = split(a:classFile[1], ':')[1]
  let s:fileMethod = MRCfindCurrentMethod()
  let s:class = split(a:classFile[0], ':')[1]
  let s:cacheLine = s:line.',./'.s:editFile.',./var:'.s:var.',./objectFile:'.s:objectFile.',./fileMethod:'.s:fileMethod.',./class:'.s:class.',./'
" line,.//home/vagrant/.vim/michaelSoft/mrCompletor/mrCompleter.vim,./var:aObj,./objectFile:./src/bundle/someFile.php,./fileMethod:someMethod,./class:AnotherObject,./
" $CCPObject->123
" $CCPtest->444q
  execute "silent !echo ".s:cacheLine." >> ".g:completerCacheDir."".g:completerVarFile
  call confirm(a:objectText." added to variable cache.")
  set nocursorcolumn
  nohlsearch
  return ''
endfunction

function! MRCfindCurrentMethod()
  let s:methodLine = getline(search('\(function.*(\|^\s*class\s\)','bnW'))
  if empty(s:methodLine) || s:methodLine == 0
    return 'unknown'
  endif
  let s:methodName = substitute(s:methodLine, '.*function\S*\s*\(\w\+\).*', '\1', '')
  return
  return s:methodName
endfunction

function! MRCgetObjectText(fileType)
  if a:fileType == 'PHP'
    let s:objectText = MRCgetObjectTextPHP(g:MRCObjectFormatPHP)
  endif
  return s:objectText
endfunction

function! MRCgetClassFromCache(objectText)
  " TODO
  " implement method checking. e.g.: check if there is a variable for this method, if not, check if there is one for this file
  let s:varFile = g:completerCacheDir.''.g:completerVarFile
  if empty(glob(s:varFile))
    silent execute "!touch ".s:varFile
  endif
  let s:editMethod = MRCfindCurrentMethod()
  let s:cacheInfo = system("grep ".@%.",.\/var:".a:objectText.",.\/.*fileMethod:".s:editMethod." ".s:varFile)
  " line,./src/APIBundle/Controller/TestingController.php,./var:verIntServ,./objectFile:./src/CCPBundle/Service/CCPVerifiIntegrationService.php,./fileMethod:0,./class:CCPVerifiIntegrationService,./
  let s:cacheInfo = split(s:cacheInfo, '\n')
  let s:formattedCacheInfo = []
  for s:cacheLine in s:cacheInfo
    let s:cacheLineArr = split(s:cacheLine, ',./')
    let s:file = s:cacheLineArr[1]
    let s:var = s:cacheLineArr[2]
    let s:var = split(s:var, ':')[1]
    let s:objectFile = s:cacheLineArr[3]
    let s:objectFile = split(s:objectFile, ':')[1]
    let s:fileMethod = s:cacheLineArr[4]
    let s:fileMethod = split(s:fileMethod, ':')[1]
    let s:class = s:cacheLineArr[5]
    let s:class = split(s:class, ':')[1]

    let s:cacheDic = {'file': s:file, 'var': s:var, 'objectFile': s:objectFile, 'fileMethod': s:fileMethod, 'class': s:class}
    call add(s:formattedCacheInfo, s:cacheDic)
  endfor
  return s:formattedCacheInfo
endfunction

let g:MRCdefinitions = {'files': '.*\.php', 'classes': '^\s*class\s', 'restrictedFileSearchDir': './src/', 'globalFileSearchDir': './', 'classIgnoreRegex': '^\S\s'}
" presents classes in new buffer to user for selection, returns [class, file]
function! MRCpresentClassesForSelection(definitions, globalSearchFlag)
  " file searching logic from definitions
  let s:fileDefinition = get(a:definitions, 'files')
  let s:classDefinition = get(a:definitions, 'classes')
  let s:classIgnore = get(a:definitions, 'classIgnoreRegex')
  if a:globalSearchFlag
    let s:fileSearchDir = get(a:definitions, 'globalFileSearchDir')
  else
    let s:fileSearchDir = get(a:definitions, 'restrictedFileSearchDir')
  endif
  " pop new tab
  tabnew
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
  echom s:classIgnore
  call confirm('')
  if s:classIgnore
    execute "g/".s:classIgnore."/d"
  endif
  normal! gg
endfunction
" $CCPObject->123
" $CCPtest->444q
