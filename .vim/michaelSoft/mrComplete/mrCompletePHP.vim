" MAIN mrComplete definitions
let g:MRCdefinitionsPHP = {}

" paths and file names for completer related files
let g:MRCfilePaths = { 'filePaths': { 'MRCDIR': '.michaelSoft/mrCompleter/', 'varCacheFile': 'varCache.mr' } }
call extend(g:MRCdefinitionsPHP, g:MRCfilePaths)

" defines symbols MRC should look for to indicate a completion, and assosicates completion types with that symbol eg the > of $object->method
let g:MRCidentifierMapPHP = { 'identifierMap': {'>': [ 'method' ], ':': [ 'const' ], '$': [ 'nothing' ], ' ': [ 'nothing' ]} }
call extend(g:MRCdefinitionsPHP, g:MRCidentifierMapPHP)

" defines what the start of a variable/object looks like eg $variable
let g:MRCObjectFormatPHP = { 'objectFormat': { 'objectBeginning': ['$', ' '], 'objectEnd': ['-', ' ', ':', '[', '('] } }
call extend(g:MRCdefinitionsPHP, g:MRCObjectFormatPHP)

" file searching parameters
" searchFilesRegex - files to search for when presenting classes to user
" searchClassesRegex - format of classes in the files
" restrictedFileSearchDir - DIR of the first search when presenting classes for the user to pick from, should be user written code
" globalFileSearchDir - DIR or the more loose search when presenting classes to user, usually vendor files or libraries
" classIgnoreRegex - When presenting classes, ignore classes matching the following regex
let g:MRCfileSearchingParamsPHP = { 'fileSearchingParams': { 'searchFilesRegex': '.*\.php', 'searchClassesRegex': '^\s*class\s', 'targetedFileSearchDir': './src/', 'globalFileSearchDir': './', 'classIgnoreRegex': '^\S\s' } }
call extend(g:MRCdefinitionsPHP, g:MRCfileSearchingParamsPHP)

" main find instruction list
" find instructions should be regexes the mrComplete will use to find that completion type
let g:MRCfindInstructionsPHP = {}
" method instructions for how to find methods
let g:MRCmethodFindInstructionsPHP = { 'method': [ { 'grepFindCommand': '^\s*public function', 'sedFormatCommand': 's/.*function\s\(.*)\)/\1/' } ], 'const': [ { 'grepFindCommand': '^\s*const', 'sedFormatCommand': 's/^\s*const\s*\(\S*\).*/\1/'} ] }
call extend(g:MRCfindInstructionsPHP, g:MRCmethodFindInstructionsPHP)
" add find instructions to definitions
call extend(g:MRCdefinitionsPHP, { 'findInstructions': g:MRCfindInstructionsPHP })

" map completion types to vim's omni complete type
let g:MRCcompletionTypesToOmniCompleteType = { 'method': 'f' , 'const': 'd' }
call extend(g:MRCdefinitionsPHP, { 'completionTypesToOmni': g:MRCcompletionTypesToOmniCompleteType })


" trigger php config to load on php files
augroup mrCompletor
  au!
  " au BufEnter *.php let g:MRCidentifierMap = g:MRCidentifierMapPHP
  au BufEnter *.php let g:MRCdefinitions = g:MRCdefinitionsPHP
  au BufEnter *.php inoremap <buffer> <C-C> <C-R>=MRComplete(g:MRCdefinitionsPHP)<CR>
augroup END
