function FoldParagraph ()
    " pompé de :h foldexp
    return getline(v:lnum)=~'^\s*$'&&getline(v:lnum+1)=~'\S'?'<1':1
endfunction

fu! NewFoldWhenLineMatches( lineMatches )
  if getline( v:lnum ) =~ '\v^\s*(#|$)'
    return '='
  endif

  if getline( v:lnum ) =~ a:lineMatches
    return 'a1'
  elseif getline( v:lnum + 1 ) =~ a:lineMatches
    return 's1'
  endif

  return '='
endfu
