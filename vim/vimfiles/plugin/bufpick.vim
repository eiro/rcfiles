" BufPick: use buffers as menu 
fun! BufPickClose()
    exec g:BufPickCtx[-1]["post"]
    let x=@p
    let @p=getline('.')
    bd!
    normal "pp
    call setreg('p',x)
    call cursor(g:BufPickCtx[-1]["pos"])
    call remove(g:BufPickCtx,-1)
endf 

fun! BufPick(pre,post)
    if !exists('g:BufPickCtx') | let g:BufPickCtx  = [] | endif
    call add( g:BufPickCtx, { "pos": getpos('.'), "post": a:post } )
    new
    set bt=nofile cursorline
    exec "nnoremap <buffer> <cr> :call BufPickClose()<cr>"
    exec a:pre
endf

command! -nargs=* BufPick  exec 'call BufPick(' . escape(<q-args>,' ')

