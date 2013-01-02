
" <F2> to switch to byte/data
nnoremap <F2> :call XXD_toogle_pos()<cr>

" :D string search string in data (handle the \n)
command! -nargs=+ D call XXD_DataSearch(<q-args>)

" :B string search string in bytes (handle the \n)
command! -nargs=+ B call XXD_ByteSearch(<q-args>)

fun! XXD_toogle_pos ()
    let p = getpos('.')
    if     p[2] == 51 | let p[2] = 10
    elseif p[2] == 52 | let p[2] = 12
    elseif p[2] == 53 | let p[2] = 15
    elseif p[2] == 54 | let p[2] = 17
    elseif p[2] == 55 | let p[2] = 20
    elseif p[2] == 56 | let p[2] = 22
    elseif p[2] == 57 | let p[2] = 25
    elseif p[2] == 58 | let p[2] = 27
    elseif p[2] == 59 | let p[2] = 30
    elseif p[2] == 60 | let p[2] = 32
    elseif p[2] == 61 | let p[2] = 35
    elseif p[2] == 62 | let p[2] = 37
    elseif p[2] == 63 | let p[2] = 40
    elseif p[2] == 64 | let p[2] = 42
    elseif p[2] == 65 | let p[2] = 45
    elseif p[2] == 66 | let p[2] = 47
    elseif p[2] >  66 | echoerr "WTF ????"
    elseif p[2] < 12  | let p[2] = 51
    elseif p[2] < 15  | let p[2] = 52
    elseif p[2] < 17  | let p[2] = 53
    elseif p[2] < 20  | let p[2] = 54
    elseif p[2] < 22  | let p[2] = 55
    elseif p[2] < 25  | let p[2] = 56
    elseif p[2] < 27  | let p[2] = 57
    elseif p[2] < 30  | let p[2] = 58
    elseif p[2] < 32  | let p[2] = 59
    elseif p[2] < 35  | let p[2] = 60
    elseif p[2] < 37  | let p[2] = 61
    elseif p[2] < 40  | let p[2] = 62
    elseif p[2] < 42  | let p[2] = 63
    elseif p[2] < 45  | let p[2] = 64
    elseif p[2] < 47  | let p[2] = 65
    elseif p[2] < 51  | let p[2] = 66
    endif
    call setpos('.',p)
endfun

function! XXD_DataSearch (s)
    let chars = split( a:s ,'\zs')
    " '\v.{50}.*\zs' don't search in first cols
    " '%(\n.{50})?' ignore the first cols
    let @/ = '\v.{50}.*\zs'.join(chars,'%(\n.{50})?')
    call search(@/)
endfunction

function! XXD_ByteSearch (s)
    let chars = split( a:s ,'..\zs')
    let lastcol = '.{18}'
    let addrcol = '\d{7}: '
    let ignore = '%(' . lastcol . '\n' . addrcol . ')?'
    let @/ = '\v'.join(chars, ignore).'\ze.{18}'
    call search(@/)
endfunction
