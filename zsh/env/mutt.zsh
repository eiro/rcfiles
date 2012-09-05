mms () {
    local draft=$1
    shift
    mutt -H ~/.mutt/dratfs/$draft "$@" 
}

box () {
    mutt -F ~/local/etc/mutt/accounts/$1 ${argv[2,-1]}
}
