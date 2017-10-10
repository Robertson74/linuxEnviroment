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

function! QuickAddSnippetSetUp()
  echom "Adding a snippet"
  " get lines of snippet to add
  set nornu nu
  redraw!
  let s:snipRange = input("Snippet range: ")
  " let s:snipRange = substitute(s:startLine, "-", ",", "")
  set rnu nu
  " present snippets for edit 
  execute s:snipRange."y"
  vsplit +enew
  norm! ggiSaveSnip ${1:exampleVar}
  norm! osnippet snipName "snipDescription"
  norm! gpoendsnippet
  norm! 2G
  nnoremap <buffer> <CR> :call SnipQuickAddButton()<CR>
endfunction

function! SnipQuickAddButton()
  if line('.') == 1
    call QuickAddSnippet()
  else
    norm! <CR>
  endif
endfunction

function! QuickAddSnippet()
  g/^snippet/,/endsnippet/y
  bd!
  let s:snippetFiles = []
  for s:dir in g:UltiSnipsSnippetDirectories
    let s:files = systemlist("ls -R ".s:dir)
    let s:files = remove(s:files, 1, -1)
    for s:file in s:files
      execute "call add(s:snippetFiles, '".s:dir."".s:file."')"
    endfor
  endfor
  let s:snippetFileChoices = []
  let s:counter = 1
  for s:snippetFile in s:snippetFiles
    let s:snip = get(split(s:snippetFile, "/"), -1)
    let s:snip = s:counter.": ".s:snip
    call add(s:snippetFileChoices, s:snip)
    let s:counter = s:counter + 1
  endfor
  let s:fileChoice = inputlist(s:snippetFileChoices)
  let s:snippetAddFile =  s:snippetFiles[s:fileChoice - 1]
  execute "vsplit +e ".s:snippetAddFile
  norm! Gp
  norm! O
  norm! j
endfunction
