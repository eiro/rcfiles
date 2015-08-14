nnoremap <buffer> ,d :y
\<bar>enew
\<bar>setf diff
\<bar>put!
\<bar>s/.../g diff /
\<bar>.!z
\<cr>

nnoremap <buffer> ,a :s/.../g add /
\<bar>.!z
\<cr>

nnoremap <buffer> ,c :s/.../g co /
\<bar>.!z
\<cr>
