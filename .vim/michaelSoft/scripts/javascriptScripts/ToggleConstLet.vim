fun! ToggleConstLet()
  if match(getline('.'), '\s*let') > -1
    execute 's/let/const/'
  elseif match(getline('.'), '\s*const') > -1
    execute 's/const/let'
  elseif match(getline('.'), '\s*var') > -1
    execute 's/var/let'
  else
    echom "No let or const"
  endif
endf
