# rpm -qa ?
alias dpkg/installed='dpkg-query -Wf '\''${Package}\n'\'

# > cpan_to_dpkg_name Test::More
# lib-test-more-perl
dpkg/pm_name () { print -l lib${^${(L)@//::/-}}-perl }

dpkg-comesfrom () {
	typeset -aU _p
	# et si tu mettais o au bon endroit ?
	_p=( ${${(fo)"$( dpkg -S "$@" )"}%:*} ) 
	print -l $_p 
}

