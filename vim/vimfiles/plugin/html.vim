" permet de clore automatiquement les balises html

inoremap </  ><esc>F<l"myiwf>a</><esc>PF>a
imap <<cr> </<cr><c-o>O
" h1 to h6 imaps 
for s:lvl in range(1,6) | exec 'imap <'.s:lvl.' <h'.s:lvl.'</' | endfor

" usage:
" http://khatar.phear.org<@ 
imap <@ <esc>BdiWi<a href="<esc>pa"</
