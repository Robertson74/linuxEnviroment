
vnoremap <Leader>ec <ESC>:call ExtractFromContext()<CR>
function! ExtractFromContext()
  " (.*).*=>\|function\s\S*(\|\(public\|private\)\s\S*())
  let s:funcName = input("function name: ")
  execute "'<"
  let s:startLine = line('.')
  execute "'<,'>d"
  execute "norm! O".s:funcName."();"
  norm! ==
  let s:upALevel = 0
  while s:upALevel != 1
    norm! 0
    execute "norm! ?{\\s*\\|^\\s*{\\s*$\<CR>"
    execute "norm! $b/{\<CR>"
    norm! V
    redraw!
    execute "norm! \<ESC>"
    let s:upALevel = confirm("Place here?", "&yes\n&up a layer", 1)
  endwhile
  execute "norm! \<ESC>"
  execute "norm! %o\<CR>"
  let s:funcLine = line('.')
  execute "norm! iconst ".s:funcName." = (): void => {"
  execute "norm! o}"
  norm! k
  norm! ""pk$%
  let s:endFuncLine = line('.')
  execute s:funcLine.",".s:endFuncLine."norm! =="
  execute s:startLine
endfunction
inoremap <expr> <C-J> pumvisible() ? "\<C-N>\<C-N>\<C-N>" : "\<C-J>"
inoremap <expr> <C-K> pumvisible() ? "\<C-P>\<C-P>\<C-P>" : "\<C-K>"

nnoremap <Leader>ssav :!mkdir ./.michaelSoft/<CR>:mksession! .michaelSoft/save.vim<CR>
nnoremap <Leader>srel :source ./.michaelSoft/save.vim<CR>
nnoremap <Leader>rg :!tsc && node build/src/domain/repoGen/generateRoutines/generateRepository.js<CR>



" source /home/vagrant/.vim/michaelSoft/nodeDebug/debug.vim
" nnoremap <Leader>zz :call TSRelativePathComplete()<CR>
" " fyi this only supports one path for each module e.g.
" "             "paths": {
" "this--->         "entities/*": ["./src/shared/entities/*"],
" "not this--->     "models/*": ["./src/shared/models/*", "./src/shared/models2/*"]
" "              },
" function! TSRelativePathComplete()
"   " find all classes that have a path in tsconfig
"   let s:tsconfig = system("cat ./tsconfig.json")
"   let s:jsonTsconfig = json_decode(s:tsconfig)
"   let s:paths = get(get(s:jsonTsconfig, "compilerOptions"), "paths")
"   let s:listPaths = values(s:paths)
"   let s:fileMatrix = []
"   for s:path in s:listPaths
"     let s:tsFiles = systemlist("find ".s:path[0]." | grep .ts")
"     echom string(s:tsFiles)
"     let s:tsFiles = systemlist("find ".s:path[0]." | grep .ts | xargs grep 'export'")
"     echom string(s:tsFiles)
"     for s:file in s:tsFiles
"       call add(s:fileMatrix, [s:path[0], s:file])
"     endfor
"   endfor

"   " echom string(s:fileMatrix)
"   " let s:importWord = expand(<cword>)
"   " echom s:importWord
" endfunction

" " source /home/vagrant/.vim/michaelSoft/nodeDebug/debug.vim
" nnoremap <Leader>dbs :call StartDebugSession()<CR>
" nnoremap <Leader>dbw :call GoToDebugWindow()<CR>
" nnoremap <Leader>dbc :call CloseDebugSession()<CR>

" nnoremap <Leader>qq :call TESTING()<CR>
" nnoremap <Leader>ST :call ToggleAle()<CR>
" Some stuff;
" console.log(someStuff)
" find classes and format
" let testCacheCmd = 'find ./src/ -regex ".*\.php" | grep -v "\/Resources\/" | xargs grep "^\s*class" | sed -e "s/\(.*\):\(.*\)/block,.\/\nfile,.\/\1\n\2\nendBlock,.\//" | sed -e "s/^\s*class\s*\(\S\+\).*/class,.\/\1/" > .michaelSoft/mrCompleter/classCache.mr'
" let testCacheCmd = 'find ./src/ -regex ".*\.php" | grep -v "\/Resources\/" | xargs grep "^\s*class" | sed -e "s/:/\n/" | sed -e "s/^\s*class\s*\(\S\+\).*/class,.\/\1/" > .michaelSoft/mrCompleter/classCache.mr'
" find ./src/ -regex ".*\.php" | grep -v "\/Resources\/" | xargs grep "^\s*class" | sed -e "s/:/\n/" > .michaelSoft/mrCompleter/classCache.mr

" inoremap <C-Z> <C-R>=TestCom()<CR>
" function! TestCompletor()
"   call complete(col('.'), ['testOne', 'testTwo', 'testThree'])
"   return ''
" endfunction
" func! TestCom()
"   call complete(col('.'), [{'word': 'testWord', 'menu': 'testMenu', 'info': 'SomeInfo', 'kind': 'v'}])
"   return ''
" endfunc

" get the public functions for a class file
" echo system('grep "\(.*public.*function\|^\s*function\)" '.expand('<cWORD>').' | grep -v "__construct"') | 
" get consts for class
" echo system('grep "const\s" '.expand('<cWORD>'))
" get consts and vars for class
" echo system('grep "\(const\s\|public.*\$\)" '.expand("%").' | grep -v "\sfunction\s"') 
" nnoremap <Leader>tes :call SmartComments()<CR>
" let g:SCkeywordsFilePath = "~/.vim/michaelSoft/SmartComments/"
" function! SmartComments()

"   :let s:keywords = SCGetKeywords()
"   :let s:commentLine = SCFormatCommentLine(getline('.'))
"   if type(s:commentLine) != 3
"     return
"   endif

"   for s:word in s:commentLine
"     if index(s:keywords, s:word.".sc") > -1
"       :call SCGetInstructions(s:word.".sc")
"     endif
"   endfor
" endfunction

" " //load the em

" function! SCGetInstructions(file)
"   :let s:instructionsRaw = system("sed -n '/^em/,/^\w/p' ".g:SCkeywordsFilePath."/".a:file)
"   :let g:instructionsList = split(s:instructions, '\n')
"   for s:line in g:instructionsList
"     if match(s:line, '^-commentMod') > -1
"       :echo '123'
"       echo s:line
"     elseif match(s:line, '^-insertLine') > -1
"       :echo '456'
"       echo s:line
"     endif
"   endfor
"   echom "999"
" endfunction

" function! SCGetKeywords()
"   :let s:keywords = system('ls '.s:SCkeywordsFilePath.' | sed -n "/\.sc/p"')
"   :let s:keywords = split(s:keywords)
"   return s:keywords
" endfunction

" function! SCFormatCommentLine(commentLine)
"   if match(a:commentLine, '^\s*\/\/') < 0
"     :echom "not a comment"
"     :return "false"
"   endif
"   :let s:commentLine = split(a:commentLine, "\/\/")[1]
"   :let s:commentLine = split(s:commentLine)
"   return s:commentLine
" endfunction

" function! ConverSnippetQuoteLines()
"   :normal! ^f[
"   :let s:startLine = line('.')
"   :normal! %
"   :let s:endLine = line('.')
"   :normal! %
"   :let s:quoteLoopLines = (s:endLine - s:startLine) - 1
"   :let s:quoteLoopCount = 0
"   :normal! j
"   while(s:quoteLoopCount < s:quoteLoopLines)
"     normal! I"",
