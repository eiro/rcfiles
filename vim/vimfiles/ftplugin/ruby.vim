filetype indent off
inoremap (end <space><cr>end<esc>kA
imap (do do(end
imap (def def(end
imap (class class(end

" fu! RubyBlockStarter ( A, L, P )
"     return ["def","class" ]
" endf
" fu! B( block )
"     exec 'normal i' . a:block . '<lt>cr><lt>cr><lt>cr>'
" endf
" command! -nargs=1 -complete=customlist,RubyBlockStarter BlockStarter call B(<q-args>)
