export WORKON_HOME=~/local/virtualenvs/
ve () {
    local project=$1 
    shift
    virtualenv --no-site-packages --distribute $WORKON_HOME/$project "$@"
}

# export PIP_VIRTUALENV_BASE=$WORKON_HOME
# export PIP_RESPECT_VIRTUALENV=true
# export VIRTUALENVWRAPPER_PYTHON==python
# export VIRTUALENVWRAPPER_VIRTUALENV=virtualenv
# export VIRTUALENVWRAPPER_PROJECT_FILENAME=
#
# fucking retarded script ! 
# source /usr/local/bin/virtualenvwrapper.sh
