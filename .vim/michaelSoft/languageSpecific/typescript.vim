" typescript specific commands
augroup typescriptConfig
  au!
  " config
  autocmd FileType typescript :set makeprg=tsc
  " commands
  au FileType typescript nnoremap <Leader>let :call ToggleConstLet()<CR>
  au FileType typescript nnoremap KK :<C-u>echo tsuquyomi#hint()<CR>
  au FileType typescript nnoremap KL :TsuquyomiSignatureHelp<CR>
  au FileType typescript nnoremap <Leader>' :s/'/"/g"<CR>
  au FileType typescript nnoremap <Leader>" :%s/'/"/g"<CR>
  au FileType typescript nnoremap <Leader>gd :TsuDefinition<CR>
  au FileType typescript nnoremap <Leader>imp :TsuImport<CR>
  au FileType typescript nnoremap <Leader>ref :TsuReferences<CR>
  au FileType typescript nnoremap <Leader>ren :TsuquyomiRenameSymbol<CR>
  au FileType typescript nnoremap <Leader>run :!npm run start<CR>
  au FileType typescript nnoremap <Leader>san :!npm run sandbox<CR>
  au FileType typescript nnoremap <Leader>esan :vsp +e ./src/sandbox.ts<CR>
  au FileType typescript nnoremap <Leader>mk :make<CR>
  au FileType typescript nnoremap <Leader>tes :!npm run test<CR>
  au FileType typescript nnoremap <Leader>lg :call ToggleWrapInConsoleLog()<CR>
  au FileType typescript nnoremap <Leader>doc :JsDoc<CR>
  au FileType typescript nnoremap <Leader>ete :call EditJSTestFile()<CR>
  au FileType typescript nnoremap <Leader>npmi :!npm i -s 
  au FileType typescript nnoremap <Leader>imp :TsuImport<CR>
  au FileType typescript nnoremap <Leader>fix :TsuQuickFix<CR>
augroup END

" Typescript Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""-plugin configuration
" need to set typescript tsx files to typescript.tsx for syntax/indenting to work
autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescript.tsx

" tsuquyomi
let g:tsuquyomi_completion_detail = 1
