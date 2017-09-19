" quick add constructor args
function! AddNewConstructorParameter(param)
  let s:save_cursor = getcurpos()
  let s:type = input("What type is this - ".a:param." : ")
  let s:description = input("description for var: ")
  if s:type == ""
    return
  endif
  " find constructor line
  execute "normal gg/^\\s.*constructor\<CR>/{\<CR>?)\<CR>"
  " if there are agruments, put a comma in
  if match(getline('.'), ',') > -1
    execute "normal! i,\<space>".a:param.": ".s:type
  elseif
    " insert constructor param
    execute "normal! i".a:param.": ".s:type
  endif
  " assign private variable
  execute "normal! /{\<CR>othis._".a:param." = ".a:param.";\<ESC>=="
  " create private variable
  :set nornu nu
  normal! zb
  redraw!
  let s:privateLine = input("what line for private var - ".a:param." :")
  execute "normal! ".s:privateLine."gg"
  execute "normal! oprivate _".a:param.": ".s:type.";\<ESC>=="
  if s:description != ""
    execute "normal! O// ".s:description."\<ESC>=="
  endif
  call setpos('.', s:save_cursor)
endfunction
