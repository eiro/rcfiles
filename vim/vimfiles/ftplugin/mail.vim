" complete adresses from aliases files
set dict+=~/.mutt/aliases/*
" add @, - and . to complete email adresses
set isk+=.,@-@,---
MP mutt -H %
nnoremap <buffer> ,s :w !mutt -H -<cr>
