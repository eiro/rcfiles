" first, you need to create a tag file based on 
"
" dpkg -L $( aptitude search '~i ~n guile-2' -F%p ) |
"       perl -lnE 'print if /[.]scm$/ && -f' |
"       ctags -L - -f ~/.vim/ctags/guile

set tags+=~/.vim/ctags/guile

" now fuzzy completion is at work so you just need to write
" the begining of the chunks to " complete.
"
" fuzzy completion is defined as the 'ofu' (:h 'ofu) and mapped with <tab>
"

set ofu=SchemeFuzzyComplete
inoremap <tab> <c-x><c-o>

" as examples:
"
"   us-m<tab>    use-modules
"   d-d-h<tab>   declare-date-header!
"   de-di<tab>   debug-disable
"   syn-r<tab>   syntax-rules

fun! SchemeFuzzyComplete (f,b)

    if a:f
        " find the col number when the word to complete starts
        
        let l:col  = col('.')

        " remove every chars after the cursor.
        " now you can match the word to complete as the keyword 
        " at the end of the string
        let l:word = matchstr(strpart(getline('.'),0,l:col),'\v\k+\ze\)?$')
        
        " and this word starts at col ...
        return l:col - len(l:word) - 1

    else

        let l:sub = '^' . substitute(a:b,'-','[^-]*-','g')

        " so the word to complete  | returns a pattern
        " del-fun                  | ^del[^-]*-fun[^-]*-
        
        " now use this pattern to filter tags on their names
        " returns the list of the names of the tags
        return map(taglist(l:sub), 'v:val["name"]')

    endif
endfun
