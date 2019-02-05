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
  au FileType typescript nnoremap <Leader>san :!ts-node src/sandbox.ts<CR>
  au FileType typescript nnoremap <Leader>tes :!npm run test<CR>
  au FileType typescript nnoremap <Leader>mas :call MakeAsync()<CR>
  au FileType typescript nnoremap <Leader>simp :call SortImportStatements()<CR>
  au FileType typescript nnoremap <Leader>fcl :call ListClasses()<CR>
  au FileType typescript nnoremap <Leader>fimp :call FixImportPath()<CR>
  au FileType typescript nnoremap <Leader>aco :call AutoCompleteObject()<CR>
  au FileType typescript nnoremap <Leader>uflm :call UpdateFileLastModified()<CR>
  au FileType typescript nnoremap <Leader>rcl :call RandomMarker()<CR>
  au FileType typescript nnoremap <Leader>lvar :call LogVariable()<CR>
  au FileType typescript nnoremap <Leader>rfm :call MethodReFormat()<CR>
  au FileType typescript nnoremap <Leader>mtt :call MakeTypescriptTestFile()<CR>
  au FileType typescript nnoremap <Leader>gch :call GitChooseHead()<CR>
  au FileType typescript nnoremap <Leader>mim :call ManualImport()<CR>
  au FileType typescript nnoremap <Leader>nim :call NewImport()<CR>
  au FileType typescript nnoremap <Leader>eqim :execute "vsplit +e ".g:quickImportsFile<CR>
  au FileType typescript nnoremap <Leader>qim :call QuickImport()<CR>

augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          Typescript Auto Commands                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup tsAutoCommands
  autocmd BufWrite *.ts call UpdateFileLastModified()
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
call SourceAllFromDir('~/.vim/michaelSoft/scripts/typescriptScripts/')
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        Typescript Specific Plugins                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup typescriptPlugins
  au!
  au FileType typescript nnoremap <Leader>doc :JsDoc<CR>
  au FileType typescript nnoremap <Leader>fix :TsuQuickFix<CR>
  au FileType typescript nnoremap <Leader>gd :TsuDefinition<CR>
  au FileType typescript nnoremap <Leader>sgd :vsplit<CR>:TsuDefinition<CR>
  au FileType typescript nnoremap <Leader>imp :TsuImport<CR>
  au FileType typescript nnoremap <Leader>ref :TsuReferences<CR>
  au FileType typescript nnoremap <Leader>rel :TsuReloadProject<CR>
  au FileType typescript nnoremap <Leader>ren :TsuquyomiRenameSymbol<CR>
  au FileType typescript nnoremap KK :<C-u>echo tsuquyomi#hint()<CR>
  au FileType typescript nnoremap KL :TsuquyomiSignatureHelp<CR>
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Typescript Plugin Configuration                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tsuquyomi
au FileType typescript au! tsuquyomi_geterr
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_single_quote_import=1
augroup tsuFixes
  au!
  autocmd InsertLeave,BufWritePost *.ts,*.tsx call tsuquyomi#asyncGeterr()
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Custom script config                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:importSingleQuote=1
