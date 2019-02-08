function! ResourceVimRc()
  redir @x
  colorscheme
  redir END
  " execute "source ~/.vimrc"
  source $MYVIMRC
  execute "colorscheme ".split(@x)[0]
endfunction
