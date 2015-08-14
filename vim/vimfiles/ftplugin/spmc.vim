command -range -nargs=0 Close <line1>,<line2>s#\v.* (.*) .*#sympa/list/close \1# 
command -range -nargs=0 Rename <line1>,<line2>s#\v.* (.*) .*#sympa/list/mv \1 \1#
command -range -nargs=0 Who
\ <line1>,<line2>y|enew |put |%s#.* #luds by mail # |%!zsh

nnoremap ,c :Close<cr>$
nnoremap ,r :Rename<cr>$B
nnoremap ,w :Who<cr>
