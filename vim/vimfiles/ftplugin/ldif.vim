set nofoldenable fdm=expr fde=LDIF_fold_expr()

function LDIF_fold_expr()
    if getline( v:lnum ) =~ '\S'
	if getline( v:lnum - 1 ) !~ '\S'
	    return 'a1'
	elseif getline( v:lnum + 1 ) !~ '\S'
	    return 's1'
	endif
    endif
    return '='
endfunc
