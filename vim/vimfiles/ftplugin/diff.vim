set fdm=expr foldexpr=getline(v:lnum)=~'^diff\\s\\+--git\\>'?'>1':1
set inex=substitute(v:fname,'^[ab]/','','')
