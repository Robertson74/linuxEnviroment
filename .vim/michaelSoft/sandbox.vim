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
