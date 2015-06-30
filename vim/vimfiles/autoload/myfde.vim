fun! myfde#diff(line)
    return
    \ a:line =~ '^diff --git' ? '>1' :
    \ a:line =~ '^@@ '        ? '>2' : '='
endf
