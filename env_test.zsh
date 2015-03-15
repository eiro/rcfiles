uzu devel/TAP :all
uzu ldap
lf=ldap/filter

my_env_works () {
    local got expected
    got=$( $lf/minify <<< "
        (| (uid=a)
           (uid=b))" )
    expected="(|(uid=a)(uid=b))"
    is $got $expected "ldap minification works" || note "got $got"

}

prove my_env_works 
