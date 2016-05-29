# --------------------------------------- #
# | Primary thing
# --------------------------------------- #

# Show user@host for SSH connections
function info_user() {

    # Make the color red if the current user is root
    if [[ $USER == "root" ]]; then
    	USER_COLOR="red"
    else
    	USER_COLOR="yellow"
    fi

	if [[ -n $SSH_CONNECTION ]]; then
		info="%{$fg[$USER_COLOR]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}"
	elif [[ $(who am i | awk '{print $1}') != $USER ]]; then
		info="%{$fg[$USER_COLOR]%}%n%{$reset_color%}"
	fi

    # Echo the info
	if [[ -n $info ]]; then
		echo "$info:"
	fi
}
