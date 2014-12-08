source ~/.git-completion.bash

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by travis gem
[ -f /Users/danielsuo/.travis/travis.sh ] && source /Users/danielsuo/.travis/travis.sh


export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/fincoda
source /usr/local/bin/virtualenvwrapper.sh
