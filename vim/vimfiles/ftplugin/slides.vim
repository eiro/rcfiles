" digraphs
" ロ = Ro
" ▢  = RO
" Dw = ◇

" :h fold.txt is a must but you'll basically use zj and zk
" \ foldmarker=▢,ロ

setlocal nonu cursorline so=999
    \ laststatus=0 fdm=marker
    \ foldmarker=▼,▲
    \ foldtext=substitute(getline(v:foldstart),'.\\v(.*)','\\1\ \ \','')

" in normal and insert mode ,, to add a slide
inoremap ,, <c-k>Dt<cr><cr><c-t><c-k>Sb <cr><c-d><cr><c-k>UT<c-o>4k<space>
nmap ,, o,,

" ,z pipe a line to zsh
nnoremap ,z :.w !zsh<cr><cr>
" ,v show images from qiv -f
nnoremap ,v :.w !xargs qiv -fm<cr><cr>
nnoremap <buffer> <PageUp> zk
nnoremap <buffer> <PageDown> zj

" Presentation mode open and close folders automatically
command -nargs=0 Presentation set fdo=all fcl=all
Presentation

" Edition mode reset default folding behavior
command -nargs=0 Edition set fcl= fdo=block,hor,mark,percent,quickfix,search,tag,undo
