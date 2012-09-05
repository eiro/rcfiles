# from 
# http://www.tinybox.net/2008/02/01/latex-vers-png-pour-des-images-de-formules-math%C3%A9matiques-dans-les-sites-web/

math_formula () {
local dest=${1:?need a destfile}
local tmp=$( mktemp -d )
pushd $tmp
{ cat << A
\documentclass{article}
\usepackage{amsmath}
\usepackage{mathenv}
\pagestyle{empty}
\begin{document}
\begin{math}
A
cat
cat << B
\end{math}
\end{document}
B
} > test.latex
latex -interaction=nonstopmode test.latex &&
    dvips test.dvi &&
    convert -density 240 -trim -transparent white test.ps test.png &&
    popd && 
    mv $tmp/test.png $dest &&
    rm -rf $tmp
}
