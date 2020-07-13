" switch between component/html/css
nnoremap <Leader>ansc :call AngularSwitchComponentFile("css", "newWindow")<CR>
nnoremap <Leader>anec :call AngularSwitchComponentFile("css", "edit")<CR>
nnoremap <Leader>anst :call AngularSwitchComponentFile("component", "newWindow")<CR>
nnoremap <Leader>anet :call AngularSwitchComponentFile("component", "edit")<CR>
nnoremap <Leader>ansh :call AngularSwitchComponentFile("html", "newWindow")<CR>
nnoremap <Leader>aneh :call AngularSwitchComponentFile("html", "edit")<CR>
nnoremap <Leader>ansm :call AngularSwitchComponentFile("module", "newWindow")<CR>
nnoremap <Leader>anem :call AngularSwitchComponentFile("module", "edit")<CR>

" completions
nnoremap <Leader>anch :call AngularHTMLComplete()<CR>
nnoremap <Leader>anct :call AngularTagComplete()<CR>

" angular imports
nnoremap <Leader>anic :call ImportFromTopLevelSource(expand("<cword>"), "@angular/core")<CR>
nnoremap <Leader>anir :call ImportFromTopLevelSource(expand("<cword>"), "@angular/router")<CR>
