function! FixImportPath()
  norm! ^w
  execute "norm! /\\w\<CR>"
  execute "norm! v/\\s}\<CR>hy"
  norm! S
  norm! "0p
  TsuImport
  norm! dd
  silent! execute "norm! /\<C-r>0\<CR>"
  echo "Fixed import..."
endfunction
