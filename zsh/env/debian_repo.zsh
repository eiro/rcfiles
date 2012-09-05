# debian local repo 
hash -d repodebs=$HOME/local/debs
gzscan-packages () { dpkg-scanpackages $@ | gzip -c9 }
repo_update     () {
    pushd ~repodebs
    gzscan-packages . > Packages.gz
    popd
}
repo_add     () { mv $@ ~repodebs && repo_update }


