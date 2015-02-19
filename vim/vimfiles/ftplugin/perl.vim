set tags+=~/local/var/ctags/perl/INC
MP perl % 



" for d ($( perl -E'say for grep -d,@INC' )) {
"     cd $d; find * -type d | sed s,/,::,g
" }

