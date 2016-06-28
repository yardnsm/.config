# --------------------------------------- #
# | Theme change
# --------------------------------------- #

# Change to light theme
function light() {
  export BACKGROUND="light" && reloadd
}

# Change to dark theme
function dark() {
  export BACKGROUND="dark" && reloadd
}

# --------------------------------------- #
# | Misc
# --------------------------------------- #

# Create a directory and `cd` into it
function take() {
	mkdir $1
	cd $1
}

# Create a new project
function proj() {
  take $PROJECTS_DIR/github/$1
}

# `cd` into whatever is the forefront Finder window
function cdf() {
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# Show my (local) IP
function ipee() {
  ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk "{print \$2}"
}

# Just create an empty markdown file on my desktop
function todo() {
  touch $HOME/Desktop/$1.md
  echo "Touched '$1' because I like to touch stuff"
}
