" set list listchars=tab:>-
set sw=4 tabstop=4 noexpandtab 

fun FTExec()
	MP python3 %
	make
	cwin
endfun

fun FTCheck()
	MP python3 -c "import py_compile,sys; sys.stderr=sys.stdout; py_compile.compile(r'%')"
endfun

fun FTTidy()
	set efm=%f:%l:%m mp=pep8\ %
	make
	cwin
endfun

fun Pep8()
	w
	%w !autopep8 -> /tmp/ap8
	vert bo diffsplit /tmp/ap8
endfun

command E call FTExec()
command C call FTCheck()
command T call FTTidy()
command P call Pep8()
