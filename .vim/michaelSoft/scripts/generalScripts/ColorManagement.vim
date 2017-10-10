""" save a color scheme to favorites
function! SaveColorSchemeToFavorites()
  redir => s:favScheme
  colorscheme
  redir END
  let s:favScheme = substitute(s:favScheme, '\%x00', '', 'g')
  vsplit +e ~/.vim/michaelSoft/favoriteColorschemes.vim
  norm! gg
  try
    execute "norm! /".s:favScheme."\<CR>"
    let s:newFav = "false"
  catch
    let s:confirm = confirm('Add colorscheme '.s:favScheme.' to favorites list?')
    if s:confirm
      put=s:favScheme
      %sort
      let s:newFav = "true"
    else
      let s:newFav = "abort"
    endif
  endtry
  wq
  if s:newFav == "true"
    echom "Adding color scheme ".s:favScheme
  elseif s:newFav == "abort"
    echom "Not adding colorscheme ".s:favScheme
  else
    echom "Duplcate color scheme ".s:favScheme
  endif
endfunction

""" cycle between favorite schemes randomly
function! ChangeToRandomFavoriteColor()
  vsplit +e ~/.vim/michaelSoft/favoriteColorschemes.vim
  let s:randomNumber = GetRandomNumberBetweenRange(1, line('$'))
  " go to beginning of random line
  execute "norm!".s:randomNumber."G^"
  " set colorscheme
  execute "colorscheme ".expand("<cWORD>")
  q
  hi Normal ctermbg=NONE
  hi NonText ctermbg=NONE
endfunction

function! CycleColorschemes()
  echom "starting cycling"
  let g:stopColorCycle = "false"
  let timer = timer_start(1000, 'CycleColorschemesCallback', {'repeat': -1})
  nnoremap <CR> :let g:stopColorCycle = "true"<CR>
endfunction

function! CycleColorschemesCallback(timer)
  if g:stopColorCycle == "true"
    unmap <CR>
    call timer_stop(a:timer)
    echom "stoping cycling"
  else
    execute "norm \<f8>"
  endif
endfunction
