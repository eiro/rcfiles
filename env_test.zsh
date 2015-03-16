uzu devel/TAP :all
uzu ldap
lf=ldap/filter

my_env_works () {
    local got expected

    got=$( $lf/minify <<< "
        (| (uid=a)
           (uid=b))" )
    expected="(|(uid=a)(uid=b))"
    is $got $expected "ldap minification works" ||
        note "got $got"

    local x

    # based on Huffman principle, those are the commands 
    # i need to survive (i use them in vim also)

    for x ( E s z sz g rt t lfm ) {
        shush whence $x; ok "$x is ready for action"
    }

} 


prove my_env_works   
