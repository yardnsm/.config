# --------------------------------------- #
# | Gif info
# --------------------------------------- #

# Git info (clean/dirty, needs pull/push, commit)
function git_prompt_info() {

    # Git info
    if git rev-parse --git-dir > /dev/null 2>&1; then

        local branch="%F{242}$(git_get_branch)%{$reset_color%}"
        local remote="$(git_remote_status)"
        local commit="%{$fg[magenta]%}[$(git_get_commit)]%{$reset_color%}"
        local dirtyclean="$(git_parse_dirty)"

	    echo "${branch}${commit} ${dirtyclean}${remote}"
    fi
}

# Checks if working tree is dirty
# Taken fro `oh-my-zsh`
git_parse_dirty() {
    if [[ -z "$(git status --porcelain --ignore-submodules)" ]]; then
        echo $THEME_GIT_CLEAN
    else
        echo $THEME_GIT_DIRTY
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
            echo " $THEME_GIT_NEEDS_PULL"
        elif [[ ${git_remote} = ${git_base} ]]; then
            echo " $THEME_GIT_NEEDS_PUSH"
        else
            echo " $THEME_GIT_NEEDS_PULL $THEME_GIT_NEEDS_PUSH"
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
    echo $(command git rev-parse --short HEAD)
}
