function! FixImportPath()
  norm! ^w
  execute "norm! /\\w\<CR>"
  TsuImport
  norm! mb*#$Ndd`bpkdd
  echom "Fixed import..."
endfunction
