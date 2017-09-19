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
source ~/.vim/michaelSoft/scripts/phpScripts/EditPHPTestFile.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        PHP Specific Plugins                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup phpConfig
  au!
  autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
  au FileType php inoremap <buffer> <C-C> <C-R>=MRComplete(g:MRCdefinitionsPHP)<CR>
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   PHP Plugin Configuration                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" php extended config 
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_index_composer_command = "composer"
