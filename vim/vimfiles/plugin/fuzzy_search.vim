" :FuzzySearch A [BC] D  
"
" will: 
"
" * add the this pattern to the search history 
"
"    A.\{-}[BC].\{-}D
"
" then remove all the lines of the current buffer that doesn't match
" (you can use u to come back to full list)
"
" comparing to command_t 
" pro:
" * this is 6 lines of viml: you can handle it ! 
" * no ruby binding required 
" * you can work on every kind of input
" cons:
" * no shiny things like onfly update

fun FuzzySearch(...)

    " slurpy args, see
    " :h a:000

    " update the "last search register" (:h quote/)
    " by adding non greedy matches (:h /\{)
    " between the parts ot the fuzzy. 

    let @/ = '\c\v'.join(a:000,'.{-}') 

    " add it in the search history
    call histadd('/',@/)

    " remove all the nonmatching lines.
    " now use u to come back to the full list
    exec 'v##d'

endfun

" now you can use FuzzySearch as a command 
command! -nargs=* FuzzySearch :call FuzzySearch(<f-args>)

" with a shortcut on it
nnoremap <leader>fs :FuzzySearch 
nnoremap <leader>vd :v##d<cr>
