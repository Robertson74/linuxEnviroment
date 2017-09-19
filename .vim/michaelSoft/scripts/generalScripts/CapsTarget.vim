" Moving/Editing around capitals for cammel case stuff
func! MoveToPreviousCap()
  execute "normal! ?[A-Z]\<CR>"
  :noh
endfunc
func! MoveToNextCap()
  execute "normal! /[A-Z]\<CR>"
  :noh
endfunc
func! DeleteInsideCaps()
  :execute "normal! ?[A-Z]\<CR>v/[A-Z]\<CR>hd"
  :noh
endfunc
func! ChangeInsideCaps()
  :execute "normal! ?[A-Z]\<CR>v/[A-Z]\<CR>hd"
  :startinsert
  :noh
endfunc
func! ChangeToCap()
  :execute "normal! v/[A-Z]\<CR>hd"
  :startinsert
  :noh
endfunc
func! DeleteToCap()
  :execute "normal! v/[A-Z]\<CR>hd"
  :noh
endfunc
