function! MakeTypescriptTestFile()
  let s:path = expand("%:p:h")
  let s:file =   substitute(expand("%:t"), "\.ts", ".spec.ts", "")
  execute ":!touch ".s:path."/".s:file
  execute ":vsplit +e ".s:path."/".s:file
  if len(getline(1)) == 0
    let @s="gg/export
    norm @s
  endif

  " set defaults
  let @a="anything()"
endfunction