# Create a directory and `cd` into it
function take() {
  mkdir $1
  cd $1
}

# Show my (local) IP
function ipee() {
  ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk "{print \$2}"
}

function bak() {
  mv "$1" "$1.bak"
}

function unbak() {
  mv "$1.bak" "$1"
}

# Print each PATH entry on a separate line
function path() {
  echo -e ${PATH//:/\\n}
}
