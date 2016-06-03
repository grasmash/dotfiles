# added by travis gem
[ -f /Users/matthew.grasmick/.travis/travis.sh ] && source /Users/matthew.grasmick/.travis/travis.sh

export NVM_DIR="/Users/matthew.grasmick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:/Applications/DevDesktop/drush"

function blt() {
  if [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    GIT_ROOT=$(git rev-parse --show-cdup)
  else
    GIT_ROOT="."
  fi

  if [ -f "$GIT_ROOT/blt.sh" ]; then
    $GIT_ROOT/blt.sh "$@"
  else
    echo "You must run this command from within a BLT-generated project repository."
  fi
}
