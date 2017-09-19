""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Vim Development Config                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" help when in vim script
augroup vimHelp
  autocmd!
  autocmd FileType vim setlocal omnifunc=syntaxcomplete#Complete 
  autocmd FileType vim nnoremap <buffer> K :execute "help ".expand('<cword>')<CR>
augroup END
