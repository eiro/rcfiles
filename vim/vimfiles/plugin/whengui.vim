let g:WINDOWSVERSION = 0
for windowsversion in [ 'win16' , 'win32' , 'win64' , 'win95' , 'win32unix' ]
	if has(windowsversion)
		let g:WINDOWSVERSION = windowsversion
		break
	endif
endfor
if g:WINDOWSVERSION
  " alt keys are also used by vim
  set wak=yes
  map <silent> <m-space> <esc>c>:simalt ~<cr>>
else
  run ftplugin/man.vim
  set wak=no
endif


if has("gui_running")
  set go=agrLt
  colorscheme elflord
  " colorscheme darkblue
  " go=MAac seems to be good on windows
  if has("gui_win32")
      set guifont=Lucida_Console:h10:cANSI
  else
      set guifont=Monospace\ 13
  endif
else
  " elflord and evening are cool too !
  " colorscheme ron
  " colorscheme darkblue
  " set background=light
endif

