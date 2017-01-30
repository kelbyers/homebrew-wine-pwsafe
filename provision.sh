#! /bin/bash -e

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install tools from brew
brew install git git-town
brew install pyenv pyenv-ccache pyenv-pip-migrate pyenv-virtualenv pyenv-virtualenvwrapper
brew install python

# configure shell for pyenv
PROFILE=$HOME/.bash_profile
if [[ ! -f $PROFILE ]] || ! grep -q '^[^#]*pyenv init' $PROFILE; then
    echo 'if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi' >> $PROFILE
fi

# set up easy proxy access
if ! grep -q 'http_proxy' $PROFILE; then
    echo "alias set_proxy='export https_proxy=http://str-www-proxy2-qa.homedepot.com:8080 http_proxy=http://str-www-proxy2-qa.homedepot.com:8080'" >> $PROFILE
fi
