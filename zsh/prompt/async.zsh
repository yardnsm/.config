# --------------------------------------- #
# | Async prompt for `git fetch`
# --------------------------------------- #

# Async task to show git remote data
# =============
# 'git fetch' takes some time, so we are doing that in the background.
# How? glad you asked.
# Basically, a function is strated in the background. When it
# ends, the prompt is reloaded. Sounds like fun? yea, I know.
#
# http://www.anishathalye.com/2015/02/07/an-asynchronous-shell-prompt/

ASYNC_PROC=0
local tmp_prompt_location="${HOME}/.zsh_tmp_prompt"
function precmd() {

    # Show working directory in the title
    tab_label=${PWD/${HOME}/\~}
    echo -ne "\e]2;${tab_label}\a"

    function async {

        # Fetch the data from git
        git fetch > /dev/null 2>&1
        git remote update > /dev/null 2>&1

        # Save the prompt in a temp file so the parent shell can read it
        printf "%s" $PROMPT > "$tmp_prompt_location"

        # Signal the parent shell to update the prompt
        kill -s USR2 $$

        # Kill child if necessary
        if [[ "${ASYNC_PROC}" != 0 ]]; then
            kill -s HUP $ASYNC_PROC > /dev/null 2>&1 || :
        fi
    }

    # Build the prompt in a background job
    async &!
    ASYNC_PROC=$!
}

# For the async prompt
function TRAPUSR2 {

    # Change the prompt
    PROMPT=$(cat "$tmp_prompt_location")

    # Restart the prompt
    zle && zle reset-prompt && printf '\n'
}
