# Inspired by: https://github.com/sindresorhus/pure

# Load Colors
autoload -U colors && colors
setopt promptsubst
autoload -U promptinit && promptinit

# Symbols
local PROMPT_SYMBOL="❯"
local CLEAN_SYMBOL="☀"
local DIRTY_SYMBOL="☂"

# For the git status
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]$CLEAN_SYMBOL "
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]$DIRTY_SYMBOL "

# The prompt
PROMPT='
$(user_host)${current_dir}$(git_prompt_info)
${arrow} '

# Right prompt, show time
RPROMPT="%T"

# Prompt values
local current_dir="%{$fg[white]%}%3~%{$reset_color%} "
local arrow="%(?.%{$fg[cyan]%}.%{$fg[red]%})%B${PROMPT_SYMBOL}%b"

# user@host for SSH connections
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

# Put the symbol before branch
function git_prompt_info() {
	ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
	echo "$(parse_git_dirty)$(git_needs_push)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
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

# Check if git needs push
git_needs_push() {
  if [[ $(git cherry -v @{upstream} 2>/dev/null) == "" ]]
  then
    echo ""
  else
    echo "%{$fg_bold[magenta]%}☁%f "
  fi
}
