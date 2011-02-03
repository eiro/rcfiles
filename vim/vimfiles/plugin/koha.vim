" if vim is in a koha root
if isdirectory('C4')
	" Verb: ( n = navigate, o = open ) 
	" Adjective: ( o = opac, i = intranet ) 
	" Noon: ( t = template, n = include ) 
	
	let g:koha_itmpl='koha-tmpl/intranet-tmpl/prog/en/modules' " intranet templates
	let g:koha_iinc='koha-tmpl/intranet-tmpl/prog/en/includes' " intranet includes
	let g:koha_otmpl='koha-tmpl/opac-tmpl/prog/en/modules' " opac templates
	let g:koha_oinc='koha-tmpl/opac-tmpl/prog/en/includes' " opac includes

	" so to open an intranet template, go on it with cursor and type ,oit
	
	nnoremap ,nit :e <c-r>=g:koha_itmpl<cr>
	nmap ,oit ,nit/<c-r><c-f>
	nnoremap ,nii :e <c-r>=g:koha_iinc<cr>
	nmap ,oii ,nii/<c-r><c-f>

	nnoremap ,not :e <c-r>=g:koha_otmpl<cr>
	nmap ,oot ,not/<c-r><c-f>
	nnoremap ,noo :e <c-r>=g:koha_oinc<cr>
	nmap ,ooi ,ooi/<c-r><c-f>


	" add include in the path ... so gf works inside templates
	exec 'set path+='.g:koha_iinc

endif
