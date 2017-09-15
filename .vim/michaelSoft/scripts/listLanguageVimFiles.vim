nnoremap <Leader>elan :call ListLanguageVimFiles()<CR>
function! ListLanguageVimFiles()
  let s:languageSpecificDir = $HOME."/.vim/michaelSoft/languageSpecific/"
  execute "let s:languageFiles = system('ls "s:languageSpecificDir."')"
  let s:choices = ""
  for s:file in split(s:languageFiles)
    let s:choices = s:choices."&".s:file."\n"
  endfor
  let choice = confirm("Language file to edit:", s:choices)
  execute "silent vsplit! +e ".s:languageSpecificDir."".split(s:languageFiles)[choice - 1]
endfunction
