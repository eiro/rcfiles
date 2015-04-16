
func ZshWin()
    enew|set buftype=nofile
    imap     <buffer><cr> <esc><cr>
    nnoremap <buffer><cr> Yp!!z<cr>
    nnoremap <buffer>K  :Man <cfile><cr>
endfunc
nnoremap q! :call ZshWin()<cr> 

" add to your .zshrc:
" alias vz="vim '+call ZshWin()' +startinsert"
