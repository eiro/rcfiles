" set fdm=expr foldexpr=getline(v:lnum)=~'^diff\\s\\+--git\\>'?'>1':1
set fdm=expr fde=myfde#diff(getline(v:lnum))
set inex=substitute(v:fname,'^[ab]/','','')
