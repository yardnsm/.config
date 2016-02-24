# Inspired by: https://github.com/sindresorhus/pure

# Load Colors
autoload -U colors && colors
autoload -U promptinit && promptinit

# Symbols
local PROMPT_SYMBOL="❯"
local CLEAN_SYMBOL="☀"
local DIRTY_SYMBOL="☂"
local NEEDS_PULL_SYMBOL="✦"
local NEEDS_PUSH_SYMBOL="☁"
local DIVERGED_SYMBOL="[DIVERGED]"

# For the git status
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]$CLEAN_SYMBOL "
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]$DIRTY_SYMBOL "
ZSH_THEME_GIT_NEEDS_PULL="$fg[red]$NEEDS_PULL_SYMBOL "
ZSH_THEME_GIT_NEEDS_PUSH="$fg_bold[magenta]$NEEDS_PUSH_SYMBOL "
ZSH_THEME_GIT_DIVERGED="$fg_bold[red]$DIVERGED_SYMBOL "

# The prompt
PROMPT='
$(user_host)${current_dir}$(git_prompt_info)
${arrow} '

# Right prompt, show time
RPROMPT="%T"

# Prompt values
local current_dir="%{$fg[white]%}%3~%{$reset_color%} "
local arrow="%(?.%{$fg[cyan]%}.%{$fg[red]%})%B${PROMPT_SYMBOL}%b"

# Show user@host for SSH connections
function user_host() {

    # Make the color red if is root
    if [[ $USER == "root" ]]; then
    	USER_COLOR="red"
    else
    	USER_COLOR="white"
    fi

	if [[ -n $SSH_CONNECTION ]]; then
		me="%{$fg[USER_COLOR]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%{$reset_color%}"
	elif [[ $LOGNAME != $USER ]]; then
		me="%{$fg[USER_COLOR]%}%n%{$reset_color%}"
	fi
	if [[ -n $me ]]; then
		echo "$me:"
	fi
}

# Git info (clean/dirty, needs pull/push)
function git_prompt_info() {
	ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
	echo "$(parse_git_dirty)$(git_remote_status)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
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

    local git_local=$(command git rev-parse @)
    local git_remote=$(command git rev-parse @{u})
    local git_base=$(command git merge-base @ @{u})

    if [[ ${git_local} = ${git_remote} ]]; then
        echo ""
    elif [[ ${git_local} = ${git_base} ]]; then
        echo "$ZSH_THEME_GIT_NEEDS_PULL"
    elif [[ ${git_remote} = ${git_base} ]]; then
        echo "$ZSH_THEME_GIT_NEEDS_PUSH"
    else
        echo "$ZSH_THEME_GIT_DIVERGED"
    fi
}

# Async task to show git remote data
# =============
# 'git fetch' takes some time, so we do that in thr background.
# How? glad you asked.
# Basically, we are starting a function in the background. When it
# ends, we reset the prompt. Sounds like fun? yea, I know.
#
# http://www.anishathalye.com/2015/02/07/an-asynchronous-shell-prompt/
ASYNC_PROC=0
function precmd() {
    function async {

        # Fetch the data
        git fetch 2> /dev/null

        # Save the prompt in a temp file so the parent shell can read it
        printf "%s" $PROMPT > "${HOME}/.zsh_tmp_prompt"

        # Signal the parent shell to update the prompt
        kill -s USR2 $$

        # Kill child if necessary
        if [[ "${ASYNC_PROC}" != 0 ]]; then
            kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
        fi
    }

    # Build the prompt in a background job
    async &!
    ASYNC_PROC=$!
}

# For the async prompt
function TRAPUSR2 {
    PROMPT=$(cat "${HOME}/.zsh_tmp_prompt")
    zle && zle reset-prompt
}
