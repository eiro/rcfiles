command -buffer Diff y |enew |setf diff |put! |s/... */g diff / |.!z
command -buffer Refresh %!g s

func Git(cmd,from,to)
    exec a:from. ','. a:to. 's#...#g '. a:cmd. ' #'
    exec a:from. ','. a:to. '!z'
endf

command! -buffer -range Add call Git('add',<line1>,<line2>)
command! -buffer -range CheckOut call Git('co',<line1>,<line2>)

nnoremap <buffer> ,d :Diff<cr>
nnoremap <buffer> ,a :Add<cr>
nnoremap <buffer> ,co :CheckOut<cr>
nnoremap <buffer> ,ci :Scratchpad gitcommit<cr>
