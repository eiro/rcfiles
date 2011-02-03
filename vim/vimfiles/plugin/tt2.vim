inoremap %%[ [%  %]<c-o>2h
inoremap %%] %][%<c-o>h

inoremap %%# [% INCLUDE  %]<c-o>2h
inoremap ;;# INCLUDE ;<esc>i

inoremap %%P [% PROCESS  %]<c-o>2h
inoremap ;;P PROCESS ;<esc>i

inoremap %%C [% CASE  %]<c-o>2h
inoremap %%M [% MACRO  %]<c-o>2h
inoremap %%E [% ELSE  %]<c-o>2h
inoremap %%EI [% ELSIF  %]<c-o>2h
            
inoremap ;;C CASE ;<esc>i
inoremap ;;M MACRO ;<esc>i
inoremap ;;E ELSE ;<esc>i
inoremap ;;EI ELSIF ;<esc>i
            
inoremap %%W [% WRAPPER  %]<cr>[% END %]<esc>k$2hi
inoremap %%S [% SWITCH  %]<cr>[% END %]<esc>k$2hi
inoremap %%F [% FOR  %]<cr>[% END %]<esc>k$2hi
inoremap %%B [% BLOCK  %]<cr>[% END %]<esc>k$2hi
inoremap %%I [% IF  %]<cr>[% END %]<esc>k$2hi
inoremap %%U [% UNLESS  %]<cr>[% END %]<esc>k$2hi

inoremap ;;W WRAPPER ;<cr>END;<esc>k$i
inoremap ;;S SWITCH ;<cr>END;<esc>k$i
inoremap ;;F FOR ;<cr>END;<esc>k$i
inoremap ;;B BLOCK ;<cr>END;<esc>k$i
inoremap ;;I IF ;<cr>END;<esc>k$i
inoremap ;;U UNLESS ;<cr>END;<esc>k$i
