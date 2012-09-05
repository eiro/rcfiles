" TODO: reussir a faire marcher ca :
"set keywordprg=info libc\ --vi-keys\ --index-search=%
"
" pe des autoload pour ne pas redefinir tout ca 

if exists('g:did_ftplugin_c')
    finish
endif

let g:did_ftplugin_c = 1 

function CompileC()
    if ( glob(getcwd().'/\(GNUMakefile\|Makefile\)') )
	make
    else
	let $CC='gcc'
	let $CFLAGS='-Wall -std=c99'
	" launch CFLAGS='-Wall -std=c99' CC=gcc make file
	make %:r
    end
endfunction

function ExecuteNewBinary()
    if expand('%:h')
	exec "!%:h/%:r"
    else
	exec "!./%:r"
    end
endfunction

" nnoremap ,e :!%:r<cr>
nnoremap ,c :call CompileC()<cr>
nnoremap ,e :call ExecuteNewBinary()<cr>

inoremap #" #include ""<left>
inoremap #< #include <><left>

set fdm=syntax

nnoremap ,f :call SwitchCFolding()<cr>

function SwitchCFolding()
    if &fdm == 'syntax'
	set fdm=expr fde=CPPFoldExpr()
    else
	set fdm=syntax
    endif
endfunction

function CPPFoldExpr()
    let line_before = getline( v:lnum - 1 )
    let line_after  = getline( v:lnum + 1 )
    let match_start = '^\v\s*#(if|else)'
    let match_end = '^\v\s*#(else|end)' 
    let current_level = '='
    let open_level    = 'a1'
    let close_level   = 's1'

    if line_before =~  match_start
	if line_after =~ match_end
	    return current_level
	else
	    return open_level
	endif
    elseif line_after =~ match_end
	if line_before =~ match_start
	    return current_level
	else
	    return close_level
	endif
    endif

    return current_level

endfunction

let b:did_ftplugin=1
