""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  angular                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:angularFiles=systemlist('find ./ -maxdepth 1 -name "*angular*"')
if len(s:angularFiles) > 0
  call SourceAllFromDir('~/.vim/michaelSoft/scripts/frameworkSpecific/angular/scripts/')
endif
