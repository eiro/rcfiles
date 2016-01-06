inoremap ,( <esc>bdwi\begin{}<esc>PYp^lcwend<esc>k:s/\s\+$//e<cr>A

" inoremap \F \begin{frame}{}<cr>\end{frame}<esc>k$i
" inoremap \B \begin{block}{}<cr>\end{block}<esc>k$i
" inoremap \W \begin{warning}{}<cr>\end{warning}<esc>k$i
" inoremap \T \begin{tabular}{}<cr>\end{tabular}<esc>k$i
" inoremap \A \begin{array}{}<cr>\end{array}<esc>k$i
" inoremap \I \begin{itemize}<cr>\item<cr>\end{itemize}<esc>kA
" inoremap \D \begin{description}<cr>\item<cr>\end{description}<esc>kA
" inoremap \P \pause
" inoremap \TR \textcolor{red}
" inoremap \T<R \textcolor<>{red}<c-o>F>

fun ListStartWith(prefix,list)
return filter(a:list,'stridx(v:val,a:prefix) == 0')
endf

func RtpLinesOf(path)
return readfile(findfile(a:path,&rtp))
endf

func RtpCompletionFile(A,file)
return ListStartWith(a:A,RtpLinesOf(a:file))
endf

func DictCompleterCode(file)
let l:name = substitute(a:file,'\v(^|/)(.)','\U\2','g')
exe 'func Completion'.l:name."(A,L,P)\n"
\.  "return RtpCompletionFile(a:A,'".a:file."')\n"
\.  "endf"
endf

com! -nargs=1 RtpCompleter call DictCompleterCode(<f-args>) 

RtpCompleter dict/tex/env
RtpCompleter dict/tex/use

com! -complete=customlist,CompletionDictTexEnv -nargs=1 TexEnv
\| exe "norm! i"
\. "\\begin{<args>}\n"
\. "\\end{<args>}"
\| normal kA

com! -complete=customlist,CompletionDictTexUse -nargs=1 TexUse
\| exe "norm! i\\usepackage{<args>}"
\| start

inoremap ,b <c-o>:TexEnv<space>
inoremap ,u <c-o>:TexUse<space>
