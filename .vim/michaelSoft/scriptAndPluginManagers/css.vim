""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             CSS Configuration                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup cssConfig
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    LSP                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" npm install -g vscode-css-languageserver-bin
if executable('css-languageserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'css-languageserver',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
        \ 'whitelist': ['css', 'less', 'sass'],
        \ })
endif
