superman () {
	# open a man in vim
	# you can now navigate through the manpages using
	# ctrl-] to open a manpage
	# ctrl-O (shift-o) to come back
	[ "$1" ] || return  
	local man=$1
	shift 
	vim \
		-c 'run ftplugin/man.vim' \
		-c "Man $man" \
		-c "set nohidden" \
		-c on \
		"$@"
}
compdef _man superman
nullvim () { vim -u ~/.nullvimrc "$@" }
vimhelp () { vim -c "help $1" -c on }
