uzu devel/TAP :all

my_env_works () {

    local x

    # based on Huffman principle, those are the commands 
    # i need to survive (i use them in vim also)

    for x ( E s z sz g rt t lfm ) {
        shush whence $x; ok "$x is ready for action"
    } 

    . uze/rt
    local got expected
    got="$( rt/-query "_YOURS_ and status=stalled" )"
    expected='Owner=__CurrentUser__ and status=stalled'
    is $got $expected "uze/rt and m4/rtquery ok"

} 

prove my_env_works   
