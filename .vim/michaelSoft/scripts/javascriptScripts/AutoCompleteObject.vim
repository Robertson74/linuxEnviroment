function! AutoCompleteObject()
  " go to start of word and yank word
  execute "norm! viwy"
  " lowercase first letter add const move to end of word
  execute "norm! guliconst \<ESC>le"
  " add rest of setup 
  execute "norm! a: \<ESC>pa = new \<ESC>pa();"
  " go back to var
  execute "norm! ?const\<CR>w"
endfunction();
