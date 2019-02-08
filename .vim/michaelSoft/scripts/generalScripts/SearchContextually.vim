""""""" Context Searching
:let g:searchContextDefault = 0
function! SearchContextually(searchType)
  :let b:searchTerm = input('Search for: ')
  if !empty(b:searchTerm)
    :let b:searchContext = input('Context lines around search: ')
    :normal! mm
    if empty(b:searchContext)
      :let b:searchContext = g:searchContextDefault
    endif
    if a:searchType == "local"
      :execute "silent lgrep \"".b:searchTerm."\" % -A ".b:searchContext." -B ".b:searchContext
    endif
    if a:searchType == "global"
      :let a:searchDir = input('DIR to search: ')
      if empty(a:searchDir)
        :let a:searchDir = "./"
      endif
      :execute "silent grep -R \"".b:searchTerm."\" ".a:searchDir." -A ".b:searchContext." -B ".b:searchContext
    endif
    :normal! 'm
    :let @/ = b:searchTerm
    :redraw!
    if a:searchType == "local"
      :lopen
    elseif a:searchType == "global"
      :copen
    endif
    :resize 30
    :execute ":call search(@/)"
    :execute ":call matchadd('Search', @/)"
    :call PlaceSignAtPatternMatch("contextMarker", "^|| --")
  endif
endfunction

:sign define contextMarker linehl=Error
function! PlaceSignAtPatternMatch(signName, contextPattern)
  :let a:lineNumber = 1
  while a:lineNumber <= line('$') 
    if match(getline(a:lineNumber), a:contextPattern) != -1
      :exec ":sign place ".a:lineNumber." line=".a:lineNumber." name=".a:signName." buffer=".bufnr('%')
    endif
    :let a:lineNumber = a:lineNumber + 1
  endwhile
endfunction

