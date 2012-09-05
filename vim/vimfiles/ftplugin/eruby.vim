" from http://www.ruby-doc.org/stdlib/libdoc/erb/rdoc/
" <% Ruby code -- inline with output %>
" <%= Ruby expression -- replace with result %>
" <%# comment -- ignored -- useful in testing %>
" % a line of Ruby code -- treated as <% line %> (optional -- see ERB.new)
" %% replaced with % if first thing on a line and % processing is used
" <%% or %%>

for head in ['<space>','#','=','%' ]
    exec "inoremap <%".head." <%".head."  %><c-o>2h"
endfor
