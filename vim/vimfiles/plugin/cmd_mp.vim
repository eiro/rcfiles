" The MP command ease the setting of makeprg by writting it as a shell command
" example:
" :MP perl %
" to set perl\ % as 'makeprg'

command -nargs=* -complete=shellcmd  MP  exec 'setlocal mp=' . escape(<q-args>,' ')
command -nargs=* -complete=shellcmd  MPg exec 'set      mp=' . escape(<q-args>,' ')

" recommended extra settings:
"  set aw
"  nnoremap ,c :make<cr>
