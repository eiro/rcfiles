dot2 () {
	if (( $+2 )) {
		local format=$1 f=$2
		shift 2
		# todo: add all supported formats
		[[ $format == (sv|pn)g ]] || {
			print -u2 invalid output format $format
			return 1 
		}
		dot "$@" -T$format -o $f:t:r.$format $f 
	} elif (( $+1 )) {
		local file=$1
		shift
		dot "$@" -T$file:e -o $file
	} else {
		print -u2 'usages:'
		print -u2 'dot2 outputformat inputfile'
		print -u2 'dot2 outputfile'
	}
}

