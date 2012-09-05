" put yamllint or any yamlparser in your $PATH
" personnaly, i have
" yamllint () { perl -MYAML -e 'print Dump YAML::LoadFile("'"$1"'")' }
" in my .zshenv
" type ,c in normal mode to know if you file is valid

nnoremap ,c :!yamllint %<cr>

" the common mistakes are 
"
" forget a space after the : at the end of a key
" /:\S
" replace : by ; at the end of a key
" /^[^:]+;\s
" forget the comma when you write [ key, { a: a } ]
" /\v\[^,]+\{
" spaces at the end of line after ] or } 
" /\v[]}]\s+$
"
" put it all together: 
" now you can type ,E in normal mode to walk through 
" the common mistakes you wrote

nnoremap ,E /\v:\S<bar>\[[^,]+\{<bar>^[^:]+;\s<bar>[]}]\s+$<cr>
