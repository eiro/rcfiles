command -nargs=* Man enew|set buftype=nofile filetype=man
    \| silent 0r!man <args>

command -nargs=* Perldoc enew|set buftype=nofile filetype=man
    \| silent 0r!perldoc -t <args> || perldoc -t -f <args>
