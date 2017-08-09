function! SnakeTypeORMFile()
  g/^\s*@Column/d|y|put|-1s/.*public \(.*\):.*/\1/|call ConvertToSnakeCase()|s/\(.*\)/@Column({name: "\1"})/|normal! ==
endfunction
