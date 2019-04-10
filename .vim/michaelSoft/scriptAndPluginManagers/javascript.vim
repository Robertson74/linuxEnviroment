""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Javascript Specific Scripts                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup jsConfig
  au!
  au FileType javascript nnoremap <Leader>ete :call EditJSTestFile()<CR>
  au FileType javascript nnoremap <Leader>" :s/'/"/g"<CR>
  au FileType javascript nnoremap <Leader>' :s/"/'/g"<CR>
  au FileType javascript nnoremap <Leader>lg :call ToggleWrapInConsoleLog()<CR>
  au FileType javascript nnoremap <Leader>tes :!npm run test<CR>
  au FileType typescript nnoremap <Leader>san :!npm run sandbox<CR>
  au FileType javascript nnoremap <Leader>cona :call AddNewConstructorParameter(expand("<cword>"))<CR>
  au FileType javascript nnoremap <Leader>mas :call MakeAsync()<CR>
  " toggle between let and const on a line
  au FileType javascript nnoremap <Leader>let :call ToggleConstLet()<CR>
  au FileType javascript nnoremap <Leader>simp :call SortImportStatements()<CR>
  au FileType javascript nnoremap <Leader>fcl :call ListClasses()<CR>
  au FileType javascript nnoremap <Leader>epac :e package.json<CR>
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Load Javascript Scripts                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call SourceAllFromDir('~/.vim/michaelSoft/scripts/javascriptScripts/')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Javascript Specific Plugins                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup jsPlugins
  au!
  autocmd FileType javascript nnoremap <Leader>doc :JsDoc<CR>
  autocmd FileType javascript nnoremap <Leader>fimp :ImportJSFix<CR>
  " autocmd FileType javascript nnoremap <Leader>gd :ImportJSGoto<CR>
  " autocmd FileType javascript nnoremap <Leader>imp :ImportJSWord<CR>
  " autocmd FileType javascript nnoremap <buffer> K :TernDoc<CR>
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                   javascript Plugin Configuration                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JsDoc
let g:jsdoc_additional_descriptions = 1
let g:jsdoc_input_description = 1
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_underscore_private = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_user_defined_tags = {
      \ '@author': 'Michael Robertson',
      \ '@date': strftime('%Y-%m-%d'),
      \}
" tern
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    LSP                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" npm install -g typescript typescript-language-server
