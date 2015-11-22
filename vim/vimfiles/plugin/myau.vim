au BufNewFile *.xsl 0r~/.vim/templates/xsl.xsl
au BufNewFile *.pl,*.t 0r~/.vim/templates/perl.pl | norm G
au BufNewFile *.pm 0r~/.vim/templates/perl.pm
au BufRead slapd.conf setf slapd
au BufRead *.go setf go
au BufRead *.psgi setf perl
au BufRead *.ferm,*ferm.conf setf ferm
au BufNewFile,BufRead */itsalltext/wiki.* setf dokuwiki

au BufNewFile,BufRead *mutt/* if ! &ft | set ft=muttrc | endif
au BufNewFile,BufRead *.tt2.*,tt2.*,*.tt2 runtime macros/tt2.vim
au BufNewFile,BufRead *.tt2html
			\ set ft=html |
			\ runtime macros/tt2.vim
au BufNewFile *.html 0r ~/.vim/templates/html5.html

au BufRead psql.edit* setf sql

au BufNewFile,BufRead * exec 'setlocal dict+=~/.vim/dicts/'.&ft.'/*'
au BufNewFile,BufRead Vagrantfile setf ruby
au FilterWritePre * if &diff | colorscheme mydiff | endif
