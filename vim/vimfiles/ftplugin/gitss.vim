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

nnoremap <buffer> ,co :s/.../g co /
\<bar>.!z
\<cr>

nnoremap <buffer> ,ci :Scratchpad gitcommit
\<bar>.!z
\<cr>
