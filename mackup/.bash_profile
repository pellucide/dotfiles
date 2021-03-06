source ~/.profile

# Use brew coreutils over OS X
PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

###############################################################################
# Terminal colors
###############################################################################

# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

###############################################################################
# GitHub
###############################################################################
# alias git=hub
# . ~/dotfiles/apps/hub/hub.bash_completion.sh

###############################################################################
# RVM
###############################################################################
# source ~/.rvm/scripts/rvm

###############################################################################
# Heroku
###############################################################################
# PATH="/usr/local/heroku/bin:$PATH"
