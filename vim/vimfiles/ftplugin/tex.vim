inoremap ,( <esc>bdwi\begin{}<esc>PYp^lcwend<esc>k:s/\s\+$//e<cr>A

inoremap \F \begin{frame}{}<cr>\end{frame}<esc>k$i
inoremap \B \begin{block}{}<cr>\end{block}<esc>k$i
inoremap \W \begin{warning}{}<cr>\end{warning}<esc>k$i
inoremap \T \begin{tabular}{}<cr>\end{tabular}<esc>k$i
inoremap \A \begin{array}{}<cr>\end{array}<esc>k$i
inoremap \I \begin{itemize}<cr>\item<cr>\end{itemize}<esc>kA
inoremap \D \begin{description}<cr>\item<cr>\end{description}<esc>kA

inoremap \P \pause
inoremap \TR \textcolor{red}
inoremap \T<R \textcolor<>{red}<c-o>F>
