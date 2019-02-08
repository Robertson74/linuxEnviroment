" find and edit test file (php)
function! EditPHPTestFile()
  let s:testDir = './tests/'
  let s:testFile = expand('%:t:r').'Test.'.expand('%:e')
  let s:testFilePath = system('find '.s:testDir.' -name "'.s:testFile.'"')
  let s:testFilePath = split(s:testFilePath)
  if empty(s:testFilePath)
    echo 'No test file '.s:testFile.' found. Create it? (y/n)'
    let s:choice = getchar()
    if s:choice != 121
      echo 'Aborting...'
      return
    else
      let s:testFilePath = substitute(expand('%'), '^.*/\(.*Bundle\)', s:testDir.'\1', '')
      let s:testFilePath = substitute(s:testFilePath, '\w\+\.php', '', '')
      execute '!mkdir '.s:testFilePath.' -p'
      execute '!touch '.s:testFilePath.''.s:testFile
      execute 'vsplit +e '.s:testFilePath.''.s:testFile
      return
    endif
  else
    let s:testFilePath = s:testFilePath[0]
    execute "vsplit +e "s:testFilePath
  endif
endfunction
