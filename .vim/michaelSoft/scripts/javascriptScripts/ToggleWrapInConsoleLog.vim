function! ToggleWrapInConsoleLog()
  if match(getline('.'), "console\.log") > -1
    echom "truth"
    execute "normal! 0df($F)DA;\<ESC>=="
  else
    if match(getline('.'), ";") > -1
      s/;//g
    endif
    execute "normal! Iconsole.log(\<ESC>A);\<ESC>=="
  endif
endfunction
function! ConvertFunctionToFatArrow()
  execute "normal $?function\<CR>dt(%a\<Space>=>"
endfunction
