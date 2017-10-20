function! RepeatMacoIfFail(macro, failInstructions, repeatCount)
  let counter = 0
  while counter < (a:repeatCount - 1)
    try
      execute "norm! @".a:macro
      let counter = counter + 1
    catch 
      execute "norm! @".a:failInstructions
      let counter = counter + 1
    endtry
  endwhile
endfunction

