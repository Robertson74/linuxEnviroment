function! EditJSTestFile()
  " config
  let s:testSuffix = '.test'
  let s:sourceDir = 'src'
  let s:testDir = 'test/unit'
  """"""""""""""""""""
  let s:filePath = expand('%:h')
  let s:file = expand('%:t:r')
  let s:extention = expand('%:e')
  let s:rootDir = split(s:filePath, '/')[0]
  if s:rootDir == s:testDir
    let s:switchPath = substitute(s:filePath, s:rootDir, s:sourceDir, '')
    let s:switchFile = substitute(s:file, s:testSuffix, '', '')
    silent! execute '!mkdir -p '.s:switchPath
    silent! execute '!touch '.s:switchPath.'/'.s:switchFile.'.ts'
    vsplit!
    silent! execute 'e '.s:switchPath.'/'.s:switchFile.'.ts'
    redraw!
  else
    let s:switchPath = substitute(s:filePath, s:rootDir, s:testDir, '')
    let s:switchFile = substitute(s:file, '\(.*\)', '\1'.s:testSuffix, '')
    silent! execute '!mkdir -p '.s:switchPath
    silent! execute '!touch '.s:switchPath.'/'.s:switchFile.'.ts'
    vsplit!
    silent! execute 'e '.s:switchPath.'/'.s:switchFile.'.ts'
    redraw!
  end
endfunction
