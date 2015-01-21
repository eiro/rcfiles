" A Scratchpad is a file is a persistant file where you can take notes and
" experiment things.

" Scratchpads are stored in a $VIM_SCRATCHPAD_ROOT directory
" (the default is ~/.vim-scratchpad) and not deleted when you leave your
" session so you'll come back to your tips later 


" :Scratchpad [filetype]
"
" opens a Scratchpad named after this filetype and setf this filetype.
"
" by default, the filetype of the current buffer is used. so when you are  
" editing an SQL script, those 2 commands have the same effect
"
"     :Scratchpad 
"     :Scratchpad sql

fun! Scratchpad(...)

    if !exists('$VIM_SCRATCHPAD_ROOT')
        let $VIM_SCRATCHPAD_ROOT=$HOME."/.vim-scratchpad"
    end

    let ft = get( filter( ["a:000[0]","&ft"], "exists(v:val)" ), 0)
    if exists(ft) | exec "let ft = ".ft
    else          | let ft = "default"
    endif
    exec "edit ".$VIM_SCRATCHPAD_ROOT."/".ft

    " TODO:
    " au BufNewFile .vim/scratchpad setf expand("%:t")
    " would be smarter as you can reopen the scratchpad manually 
    
    exec "setf ".ft
endf 
command -nargs=* -complete=filetype Scratchpad call Scratchpad(<f-args>)


