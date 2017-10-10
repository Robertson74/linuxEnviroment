""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Typescript Specific Scripts                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup tsConfig
  au!
  au FileType typescript nnoremap <Leader>cona :call AddNewConstructorParameter(expand("<cword>"))<CR>
  au FileType typescript :set makeprg=tsc
  " replace single quotes with double
  au FileType typescript nnoremap <Leader>" :s/'/"/g"<CR>
  au FileType typescript nnoremap <Leader>' :s/"/'/g"<CR>
  "edit test file
  au FileType typescript nnoremap <Leader>ete :call EditJSTestFile()<CR>
  " toggle between let and const on a line
  au FileType typescript nnoremap <Leader>let :call ToggleConstLet()<CR>
  " quick wrap in console log
  au FileType typescript nnoremap <Leader>lg :call ToggleWrapInConsoleLog()<CR>
  " build
  au FileType typescript nnoremap <Leader>mk :make<CR>
  au FileType typescript nnoremap <Leader>npmi :!npm i -s 
  au FileType typescript nnoremap <Leader>run :!npm run start<CR>
  au FileType typescript nnoremap <Leader>san :!npm run sandbox<CR>
  au FileType typescript nnoremap <Leader>tes :!npm run test<CR>
  au FileType typescript nnoremap <Leader>mas :call MakeAsync()<CR>
  au FileType typescript nnoremap <Leader>simp :call SortImportStatements()<CR>
  au FileType typescript nnoremap <Leader>fcl :call ListClasses()<CR>
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Typscript Navigation                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup tsNavigation
  au FileType typescript nnoremap <Leader>esan :vsp +e ./src/sandbox.ts<CR>
  au FileType typescript nnoremap <Leader>epac :vsp +e ./package.json<CR>
  au FileType typescript nnoremap <Leader>etsc :vsp +e ./tsconfig.json<CR>
  au FileType typescript nnoremap <Leader>etsl :vsp +e ./tslint.json<CR>
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Load Typescript Specific Scripts                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Typescript Specific Plugins                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup typescriptPlugins
  au!
  au FileType typescript nnoremap <Leader>doc :JsDoc<CR>
  au FileType typescript nnoremap <Leader>fix :TsuQuickFix<CR>
  au FileType typescript nnoremap <Leader>gd :TsuDefinition<CR>
  au FileType typescript nnoremap <Leader>imp :TsuImport<CR>
  au FileType typescript nnoremap <Leader>ref :TsuReferences<CR>
  au FileType typescript nnoremap <Leader>ren :TsuquyomiRenameSymbol<CR>
  au FileType typescript nnoremap KK :<C-u>echo tsuquyomi#hint()<CR>
  au FileType typescript nnoremap KL :TsuquyomiSignatureHelp<CR>
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Typescript Plugin Configuration                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tsuquyomi
let g:tsuquyomi_completion_detail = 1
