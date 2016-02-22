
# Take
function take() {
	mkdir $1
	cd $1
}

# Theme change
function light() {
    export BACKGROUND="light" && reloadd
}

function dark() {
    export BACKGROUND="dark" && reloadd
}
