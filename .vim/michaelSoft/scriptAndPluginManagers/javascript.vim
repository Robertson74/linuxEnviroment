""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Javascript Specific Scripts                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup jsConfig
  au!
  au FileType javascript nnoremap <Leader>ete :call EditJSTestFile()<CR>
  au FileType javascript nnoremap <Leader>lg :call ToggleWrapInConsoleLog()<CR>
  au FileType javascript nnoremap <Leader>tes :!npm run test<CR>
  au FileType javascript nnoremap <Leader>cona :call AddNewConstructorParameter(expand("<cword>"))<CR>
  au FileType javascript nnoremap <Leader>mas :call MakeAsync()<CR>
  " toggle between let and const on a line
  au FileType javascript nnoremap <Leader>let :call ToggleConstLet()<CR>
  au FileType typescript nnoremap <Leader>simp :call SortImportStatements()<CR>
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Load Javascript Scripts                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jump to test files
source ~/.vim/michaelSoft/scripts/javascriptScripts/EditJsTestFile.vim
" add a new constructor parameter
source ~/.vim/michaelSoft/scripts/javascriptScripts/AddNewConstructorParameter.vim
" quickly make a funciton async
source ~/.vim/michaelSoft/scripts/javascriptScripts/MakeAsync.vim
" toggle between let and const on line
source ~/.vim/michaelSoft/scripts/javascriptScripts/ToggleConstLet.vim
" quickly wrap or unwrap line in console log
source ~/.vim/michaelSoft/scripts/javascriptScripts/ToggleWrapInConsoleLog.vim
" sort top level import statements
source ~/.vim/michaelSoft/scripts/javascriptScripts/SortImportStatements.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Javascript Specific Plugins                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup jsPlugins
  au!
  autocmd FileType javascript nnoremap <Leader>doc :JsDoc<CR>
  autocmd FileType javascript nnoremap <Leader>fimp :ImportJSFix<CR>
  autocmd FileType javascript nnoremap <Leader>gd :ImportJSGoto<CR>
  autocmd FileType javascript nnoremap <Leader>imp :ImportJSWord<CR>
  autocmd FileType javascript nnoremap <buffer> K :TernDoc<CR>
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
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
