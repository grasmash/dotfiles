export OS=`uname`

source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/projects
source ~/dotfiles/bash/paths
source ~/dotfiles/bash/completions
source ~/dotfiles/drush/.drush_bashrc

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

bind 'set completion-ignore-case on'
bind 'set completion-prefix-display-length 2'
bind 'set completion-map-case on'
bind 'set completion-query-items 9001'
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'
bind 'set mark-directories on'
bind 'set mark-symlinked-directories on'
bind 'set page-completions off'
bind 'set visible-stats on'

# Set options
shopt -s cdable_vars

export HISTFILESIZE=10000
export HISTSIZE=10000
export EDITOR=vim
export PHP_AUTOCONF=/usr/local/Cellar/autoconf/2.69/bin/autoconf
export PHP_AUTOHEADER=/usr/local/Cellar/autoconf/2.69/bin/autoheader
export PATH=~/dotfiles/bin:$PATH
export PATH=/Applications/MAMP/Library/bin:$PATH
export PATH=/Applications/MAMP/bin/php/php5.3.28/bin:$PATH
export PATH=/usr/local/share/npm/bin:$PATH
export TERM=xterm-256color
export NODE_PATH="/usr/local/lib/node"

_update_ps1() {
    # combining powerline with drush customizations.
  if [ "\$(type -t __git_ps1)" ] && [ "\$(type -t __drush_ps1)" ]; then
    # PS1='\u@\h \w$(__git_ps1 " (%s)")$(__drush_ps1 "[%s]")\$ '
    # PS1="$($HOME/dotfiles/repos/powerline/powerline-shell.py $?)"
    PS1="$($HOME/dotfiles/repos/powerline/powerline-shell.py)$(__drush_ps1 [%s]) "
  fi
}
export PROMPT_COMMAND="_update_ps1"

shopt -s cdspell

# set PATH so it includes Support-Tools bin
if [ -d "/Users/matthew.grasmick/Sites/acquia/Support-Tools/bin" ] ; then
    export PATH="/Users/matthew.grasmick/Sites/acquia/Support-Tools/bin:$PATH"
fi

# set bastion function to use
function bastion { mywik2 ; }

# set ahtools autocomplete
complete -W '$(/Users/matthew.grasmick/Sites/acquia/Support-Tools/aht --autocomplete)' aht

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# include AH profile
if [ -f ~/.ah_profile ]; then
  . ~/.ah_profile
fi