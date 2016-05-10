# --------------------------------------- #
# | Symbols for some prompt values
# --------------------------------------- #

# Prompt Symbols
local PROMPT_SYMBOL="❯"
local BACKGROUND_JOB_SYMBOL="✱"

# Git Symbols
local CLEAN_SYMBOL="☀"
local DIRTY_SYMBOL="☂"
local NEEDS_PULL_SYMBOL="✈︎"
local NEEDS_PUSH_SYMBOL="☁"
local DIVERGED_SYMBOL="✂︎"

# --------------------------------------- #
# | Themed stuff
# --------------------------------------- #

# For the git info
local ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
local ZSH_THEME_GIT_PROMPT_CLEAN="$fg[yellow]$CLEAN_SYMBOL"
local ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]$DIRTY_SYMBOL"
local ZSH_THEME_GIT_NEEDS_PULL="$fg[red]$NEEDS_PULL_SYMBOL"
local ZSH_THEME_GIT_NEEDS_PUSH="$fg_bold[magenta]$NEEDS_PUSH_SYMBOL"
local ZSH_THEME_GIT_DIVERGED="$fg_bold[red]$DIVERGED_SYMBOL"

# For the Background jobs info
local ZSH_THEME_BACKGROUND_JOB="%{$fg[yellow]%}${BACKGROUND_JOB_SYMBOL}%f "
