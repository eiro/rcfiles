fun fde#diff ()
    let l:line=getline(v:lnum)
    return
    \ l:line =~ '^diff --git' ? 1 :
    \ l:line =~ '^--- a/'   ? 2 :
    \ l:line =~ '^@@ '      ? 3 : -1
end
