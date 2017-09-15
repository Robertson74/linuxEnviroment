" javascript specific commands
augroup jsConfig
  au!
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript nnoremap <Leader>imp :ImportJSWord<CR>
  autocmd FileType javascript nnoremap <Leader>fimp :ImportJSFix<CR>
  autocmd FileType javascript nnoremap <Leader>gd :ImportJSGoto<CR>
  autocmd FileType javascript nnoremap <Leader>doc :JsDoc<CR>
  autocmd FileType javascript nnoremap <Leader>ete :call EditJSTestFile()<CR>
  autocmd FileType javascript nnoremap <Leader>lg :call ToggleWrapInConsoleLog()<CR>
  autocmd FileType javascript nnoremap <Leader>tes :!npm run test<CR>
  autocmd FileType javascript nnoremap <buffer> K :TernDoc<CR>
augroup END
" javascript Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-plugin configuration
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
