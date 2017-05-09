source ~/.vim/michaelSoft/mrCompletor/mrCompleterPHP.vim
augroup phpunit
  au!
  au BufEnter *.php g:MRCidentifierMap = g:MRCcidentifierMapPHP
augroup END

let g:completerCacheDir = ".michaelSoft/mrCompleter/"
let g:completerCacheFile = "classCache.mr"
let g:completerVarFile = "varCache.mr"

let g:MRCidentifierMapPHP = {'>': [ 'method', 'var' ], ':': [ 'method', 'const' ], '$': [ 'nothing' ], ' ': [ 'nothing' ]} 
let g:MRCObjectFormatPHP = [['$', ' '], ['-', ' ', ':', '[']]
let g:MRCidentifierMap = g:MRCidentifierMapPHP

inoremap <C-A> <ESC>:call MRComplete('PHP')<CR>

function! MRComplete(fileType)
  " get identifiers behind cursor
  let s:completionHint = MRCgetIdentifiers(a:fileType)
  if s:completionHint[0][0] == 'nothing'
    echom "Can't complete this..."
    echo s:completionHint
    return
  endif
  " get object class/type
  let s:objectInfo = MRCgetObjectClass(a:fileType)
  " find completion lists
  let s:completionInfo = MRCgetCacheCompletions(s:objectInfo)
  " return completions
endfunction

" uses objectInfo from varCache to access 
" /home/vagrant/.vim/michaelSoft/mrCompletor/mrCompleter.vim,./var:CCPObject,./objectFile:./src/bundle/someFile.php,./class:CCPObject
" $CCPObject->123
" $CCPtest->444q
function! MRCgetCacheCompletions(objectInfo)
  " s:file = s:objectInfo[0]

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
  if a:fileType == 'PHP'
    let s:objectInfo = MRCgetObjectClassPHP(s:objectText)
  endif
  return s:objectInfo
endfunction

function! MRCgetObjectText(fileType)
  if a:fileType == 'PHP'
    let s:objectText = MRCgetObjectTextPHP(g:MRCObjectFormatPHP)
  endif
  return s:objectText
endfunction

function! MRCgetClassFromCache(objectText)
  let s:varFile = g:completerCacheDir.''.g:completerVarFile
  if empty(glob(s:varFile))
    silent execute "!touch ".s:varFile
  endif
  let s:cacheInfo = system("grep ".@%.",.\/var:".a:objectText.",.\/ ".s:varFile)
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
  echom string(s:formattedCacheInfo)
  return s:cacheInfo
endfunction
" $CCPObject->123
" $CCPtest->444q
