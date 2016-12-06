export OS=`uname`

source ~/dotfiles/bash/aliases
source ~/dotfiles/bash/projects
source ~/dotfiles/bash/paths
source ~/dotfiles/bash/completions
source ~/dotfiles/drush/.drush_bashrc
source "$HOME/.console/console.rc" 2>/dev/null

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
export PATH=$HOME/dotfiles/bin:$PATH
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$PATH:/Applications/MAMP/Library/bin
export PATH=/Applications/MAMP/bin/php/php7.0.12/bin:$PATH
# export PATH=$PATH:/Applications/DevDesktop/drush
export PATH=$PATH:$HOME/.composer/vendor/bin
export TERM=xterm-256color
export NODE_PATH="/usr/local/lib/node"
export XDEBUG_CONFIG="idekey=PHPSTORM"

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# include AH profile
if [ -f ~/.ah_profile ]; then
  . ~/.ah_profile
fi

# added by travis gem
[ -f /Users/matthew.grasmick/.travis/travis.sh ] && source /Users/matthew.grasmick/.travis/travis.sh

export NVM_DIR="/Users/matthew.grasmick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Disable cowsay in Ansible.
export ANSIBLE_NOCOWS=1

# Dev Desktop
export DEVDESKTOP_DRUPAL_SETTINGS_DIR="~/.acquia/DevDesktop/DrupalSettings"
export PATH="$PATH:/Applications/DevDesktop/tools"

# https://github.com/bamarni/symfony-console-autocomplete
# symfony-autocomplete > $(brew --prefix)/etc/bash_completion.d/symfony-autocomplete
# eval "$(symfony-autocomplete)"

function blt() {
  if [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    GIT_ROOT=$(git rev-parse --show-cdup)
  else
    GIT_ROOT="."
  fi

  if [ -f "$GIT_ROOT/vendor/bin/blt" ]; then
    $GIT_ROOT/vendor/bin/blt "$@"
  else
    echo "You must run this command from within a BLT-generated project repository."
    exit 1
  fi
}
