" switch between component/html/css
nnoremap <Leader>ansc :call AngularSwitchComponent("css", "newWindow")<CR>
nnoremap <Leader>anec :call AngularSwitchComponent("css", "edit")<CR>
nnoremap <Leader>anst :call AngularSwitchComponent("ts", "newWindow")<CR>
nnoremap <Leader>anet :call AngularSwitchComponent("ts", "edit")<CR>
nnoremap <Leader>ansh :call AngularSwitchComponent("html", "newWindow")<CR>
nnoremap <Leader>aneh :call AngularSwitchComponent("html", "edit")<CR>

" completions
nnoremap <Leader>anch :call AngularHTMLComplete()<CR>
nnoremap <Leader>anct :call AngularTagComplete()<CR>

" angular imports
nnoremap <Leader>anic :call ImportFromTopLevelSource(expand("<cword>"), "@angular/core")<CR>
nnoremap <Leader>anir :call ImportFromTopLevelSource(expand("<cword>"), "@angular/router")<CR>
