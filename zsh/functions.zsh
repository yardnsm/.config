# Create a directory and `cd` into it
function take() {
  mkdir $1
  cd $1
}

# Show my (local) IP
function ipee() {
  ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk "{print \$2}"
}

# Todo
function todo() {
  local name=$1
  [[ -z $name ]] && name="$(date +'%d.%m.%y::%H:%M')"

  $EDITOR "$HOME/todos/$name.md"
}

function todos() {
  pushd "$HOME/todos/" > /dev/null

  echo "Switched to $(pwd)\n"
  echo "Available todos:"

  ls
}
