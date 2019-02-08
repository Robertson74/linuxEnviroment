function! SourceAllFromDir(dir)
  let s:files = systemlist('ls '.a:dir)
    for s:file in s:files
      execute "source ".a:dir."".s:file
    endfor
endfunction

