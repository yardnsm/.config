# --------------------------------------- #
# | Gif info
# --------------------------------------- #

# Git info (clean/dirty, needs pull/push, commit)
function git_prompt_info() {
	echo "$(parse_git_dirty) $(git_remote_status)$(git_get_branch) $(git_get_commit) $ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
# Taken fro `oh-my-zsh`
parse_git_dirty() {
	local STATUS=''
	local FLAGS
    FLAGS=('--porcelain')
	if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
		if [[ $POST_1_7_2_GIT -gt 0 ]]; then
			FLAGS+='--ignore-submodules=dirty'
		fi
		if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
			FLAGS+='--untracked-files=no'
		fi
		STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
	fi
	if [[ -n $STATUS ]]; then
		echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
	else
		echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
	fi
}

# Check git remote status
function git_remote_status() {

    local git_local=$(command git rev-parse @ 2> /dev/null)
    local git_remote=$(command git rev-parse @{u} 2> /dev/null)
    local git_base=$(command git merge-base @ @{u} 2> /dev/null)

    # First check that we have a remote
    if ! [[ ${git_remote} = "" ]]; then

        # Now do all that shit
        if [[ ${git_local} = ${git_remote} ]]; then
            echo ""
        elif [[ ${git_local} = ${git_base} ]]; then
            echo "$ZSH_THEME_GIT_NEEDS_PULL"
        elif [[ ${git_remote} = ${git_base} ]]; then
            echo "$ZSH_THEME_GIT_NEEDS_PUSH"
        else
            echo "$ZSH_THEME_GIT_DIVERGED"
        fi
    fi
}

# Get the current branch
function git_get_branch() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "${ref#refs/heads/}";
}

# Get the current commit hash
function git_get_commit() {
    echo "$fg[blue][$(command git rev-parse --short HEAD)]"
}
