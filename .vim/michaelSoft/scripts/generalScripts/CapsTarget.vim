" testMcTestingTester
function! HighlightCapsTextObject()
  " get character under cursor
  let s:cursorChar = getline('.')[col('.')-1]
  let s:cursorCharNum = char2nr(s:cursorChar)

  " get character to left
  let s:leftCursorChar = getline('.')[col('.')-2]
  let s:letfCursorCharNum = char2nr(s:leftCursorChar)

  " find start of caps object
  
  " if character to left of cursor is not a letter
  if !(s:letfCursorCharNum >= 65 && s:letfCursorCharNum <= 90) && !(s:letfCursorCharNum >= 97 && s:letfCursorCharNum <= 122)
  elseif s:cursorCharNum >= 65 && s:cursorCharNum <= 90 " if character is a capital do nothing
  elseif s:cursorCharNum >= 97 && s:cursorCharNum <= 122 " if character is lower
    execute "norm! ?\\(\\u\\\|\\W\\zs\\l\\\|^\\)\r"
  else " if character is a non word
    execute "norm! /\\w\r"
  endif

  " find end of caps object
  execute "norm! /\\(\\l\\ze\\u\\\|\\l\\ze\\W\\\|$\\)\r"

  " highlight the object
  norm! v`'
endfunction
