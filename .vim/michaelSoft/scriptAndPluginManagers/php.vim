""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        PHP Specific Scripts                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup phpConfig
  au!
  au FileType php nnoremap <Leader>ete :call EditPHPTestFile()<CR>
  au FileType php nnoremap <Leader>epar :vsp ./app/config/parameters.yml<CR>
  au FileType php nnoremap <Leader>san :vsp ./src/APIBundle/Controller/TestingController.php<CR>
  au FileType php nnoremap <Leader>imp :call SetUpSymfonyAutoImport()<CR>
  au FileType php nnoremap <Leader>ser :silent! call SetUpSymfonyServices()<CR>
  au FileType php nnoremap <Leader>fse :silent call FindSymfonyServiceFiles()<CR>
  au FileType php nnoremap <Leader>fcl :call FindSymfonyClass()<CR>
  au FileType php nnoremap <Leader>tes :Test<CR>
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Load PHP Scripts                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call SourceAllFromDir('~/.vim/michaelSoft/scripts/phpScripts/')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        PHP Specific Plugins                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup phpPlugins
  au!
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  au FileType php inoremap <buffer> <C-C> <C-R>=MRComplete(g:MRCdefinitionsPHP)<CR>
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   PHP Plugin Configuration                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pdv_template_dir = "~/.vim/bundle/pdv/templates_snip"
" php extended config 
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_index_composer_command = "composer"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    LSP                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" npm -g install intelephense-server
au User lsp_setup call lsp#register_server({
      \ 'name': 'intelephense',
      \ 'cmd': {server_info->['node', expand('~/.npm-global/lib/node_modules/intelephense-server/lib/server.js'), '--stdio']},
      \ 'whitelist': ['php'],
      \ })
