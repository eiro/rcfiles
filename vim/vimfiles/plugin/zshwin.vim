func Zsh(from,to)
    if a:from == a:to
        m$
        $t$
        $-1s/$/ #-->/
        $!zsh
        $
    else
        echoerr "not yet implemented"
    endif
endf

command -range Zsh call Zsh(<line1>,<line2>)

func ZshWin()
    if buflisted('Zshell')
        echo "still exists, just join it"
        e Zshell
    else
        echo "i try to create it right now"
        enew
        set bt=nofile ft=zsh nofen
        file Zshell
        nnoremap <buffer>K :Man <cfile><cr>
        imap <buffer><cr> <esc><cr>
        nnoremap <buffer><cr> :set nofen<bar>.Zsh<cr>
        setlocal fdm=expr fde=NewFoldWhenLineMatches('#-->$')
        startinsert
    endif
endfunc
nnoremap q! :call ZshWin()<cr>   
