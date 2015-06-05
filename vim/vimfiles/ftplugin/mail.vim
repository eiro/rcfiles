" complete adresses from aliases files
set dict+=~/.mutt/aliases/*
" add @, - and . to complete email adresses
set isk+=.,@-@,---
MP mutt -H %
nnoremap <buffer> ,s :w !mutt -H -<cr>

func RTTicket ()
    %g#\v^Subject:.{-}(\d+)](.*)#y a
    enew
    set bt=nofile ft=rt_tk 
    file Ticket\ RT
    0put
    1s,,rt show \1,
    1!zsh
endf

command RTTicket call RTTicket()
