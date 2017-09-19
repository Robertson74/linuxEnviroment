function! AddQuickSnippet() 
  let s:snipDir = '~/.vim/michaelSoft/custom_snippets/'
  normal! gvy
  let s:snippet = input('Snippet: ', @0)
  let s:snipKeyword = input('Keyword for the snip: ')
  let s:snipDescript = input('Description for the snip: ')
  let s:snipFiles = system('ls '.s:snipDir.'  | sed -n "/.*\.snippets/p"')
  let s:snipFiles = split(s:snipFiles)
  let s:snipMenu = []
  let s:snipMenuNum = 1
  for s:file in s:snipFiles
    call add(s:snipMenu, [s:snipMenuNum, s:file]) 
    let s:snipMenuNum+=1
  endfor
  echom 'Choose a file for the snippet to live in : '
  for s:menuItem in s:snipMenu 
    echom s:menuItem[0].' : '.s:menuItem[1]
  endfor
  let s:choice = input('choice: ')
  silent execute "!echo ' ' >> ".s:snipDir."".s:snipFiles[s:choice-1]
  silent execute "!echo 'snippet ".s:snipKeyword." \"".s:snipDescript."\"' >> ".s:snipDir."".s:snipFiles[s:choice-1]
  silent execute "!echo '".s:snippet."' >> ".s:snipDir."".s:snipFiles[s:choice-1]
  silent execute "!echo endsnippet >> ".s:snipDir."".s:snipFiles[s:choice-1]
  :redraw!
endfunction
