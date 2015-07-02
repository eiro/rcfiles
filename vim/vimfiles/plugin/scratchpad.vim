" want moar ? so type :h scratchpad
"
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


