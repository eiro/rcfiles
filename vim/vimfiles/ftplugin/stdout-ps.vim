command -buffer Refresh
    \ %!ps o pid,ppid,uid,stat,pcpu,command
command -buffer -range KillRange
    \ <line1>,<line2>!perl -nE 'kill q(TERM),$1 if /^ *(\d+)/'
nnoremap <c-k> :!kill <cword><cr>
nnoremap <c-l> :Refresh<cr>
vnoremap K :KillRange<cr>
