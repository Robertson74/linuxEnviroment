" nnoremap <Leader>qq :call Testing()<CR>
" function! Testing()
"   vsplit +enew
"   let s:nodeModules = systemlist("cat ./package.json")
"   silent put=s:nodeModules
"   execute "norm! ggd/dependencies\<CR>"
"   silent v/\s\s\s\s/d
"   silent %s/:.*//
"   silent %s/"//g
"   %sort u
"   %norm! ==
"   silent g/@types\//call RemoveDuplicateType()
"   norm! gg
"   " au BufLeave <buffer> bd!
"   nnoremap <buffer> <CR> :call FindExportsAndList(expand("<cWORD>"))<CR>
" endfunction

" function! RemoveDuplicateType()
"   let s:lib = substitute(getline('.'), '.*/', '', '')
"   try
"     let searchResult = search('^'.s:lib)
"     if searchResult > 0
"       norm! dd
"     endif
"   catch 
"   endtry
" endfunction

" function! UpdateImportHeaders()
" endfunction

" function! InsertSelectedElement()
" endfunction

" function! SearchFilesForExportedPackages(library, files)
"   let s:allExports = []
"   for s:file in a:files
"     let s:exportLines = systemlist('grep "^\s*export" node_modules/'.a:library.'/'.s:file)
"     call extend(s:allExports, s:allExports)
"   endfor
"   return s:exportLines
" endfunction

" function! FindFilesWithRelevantExports()
" endfunction

" function! FindMainFileExportsFile(library)
"   " let mainFile = systemlist('cat node_modules/'.a:library.'/package.json')
"   let s:mainFileLine = systemlist('cat node_modules/'.a:library.'/package.json | grep "\"main\":"')
"   if (len(s:mainFileLine) == 1)
"     if (len(s:mainFileLine[0]) > 13)
"       let s:mainFileName = split(s:mainFileLine[0], '"')[3]
"       return substitute("lib/ts-mockito.js", "\\..*", ".d.ts", "")
"     endif
"   endif
"   return "index.js"
" endfunction

" function! FindExportsAndList(library)
"   " find main file
"   let s:mainFile = FindMainFileExportsFile(a:library)
"   " find index.d.ts
"   let s:indexFile = "index.d.ts"
"   " find all files that have relevant exports (including index.d)
"   let s:exportFiles = [ s:indexFile ]
"   " let s:exportFiles = FindFilesWithRelevantExports()
"   " grep files for exports
"   let s:exports = SearchFilesForExportedPackages(a:library, s:exportFiles)
"   " list exports
"   call ListExports(s:exports)
"   " bind enter to select Export
"   nnoremap <buffer> <CR> :call SelectExport(expand("<cWORD>"))<CR>
" endfunction

" function! SelectExport(export)
"   call confirm("Selected ".a:export)
" endfunction

" function! ListExports(exports)
"   %d
"   put=a:exports
"   norm! gg
" endfunction

" function! FindIndexFile()
" endfunction

" " list packages
" " select package
" " find main file
" " find index.d.ts
" " find all files that have releavant exports (including index.d)
" " grep files for exports
" " list exports
" " select exports
" " insert the selected element
" " update import headers


" " how to get the export name
" "     could be -

" " export funciton
" " export type
" " export interface
" " export class

" " export { stuff, stuff } from 
" " export { stuff } from 
" " export { stuff, stuff } <nothing here>
" " export { stuff } <nothing here>

" " export * from "blah"

" " export = module
" " s/.*{\(.*\)}.*/\1
" " if match(getline('.'), ',') > -1
" "   s/,/\r/g
" " endif
