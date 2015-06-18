fun! SympaListConfigurationRemoteEdit(...)

    if     a:0 == 1 | exec 'r !netrw/sympa s ' . a:1
    elseif a:0 == 0 | .!netrw/sympa- s
    else
        echoerr "not implemented"
        return
    endif

    exec 'e '.getline(line('.'))
    d -
endfun

command! -nargs=? Sympa call SympaListConfigurationRemoteEdit(<f-args>)
