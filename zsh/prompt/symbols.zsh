# --------------------------------------- #
# | Symbols for some prompt values
# --------------------------------------- #

# Prompt Symbols
local SYMBOL_PROMPT="△"
local SYMBOL_EXIT_PROMPT="△"
local SYMBOL_PROMPT2='◇'
local SYMBOL_DIVIDER=" :: "
local SYMBOL_THEME_BACKGROUND_JOB="✱"

# Git Symbols
local SYMBOL_GIT_CLEAN="⬢"
local SYMBOL_GIT_DIRTY="⬡"
local SYMBOL_THEME_GIT_NEEDS_PULL="⇣"
local SYMBOL_THEME_GIT_NEEDS_PUSH="⇡"

# Versions symbol
local SYMBOL_VERSION_NODEJS="⬢"

# --------------------------------------- #
# | Themed stuff
# --------------------------------------- #

# Git themes
local THEME_GIT_CLEAN="%{$fg[green]%}$SYMBOL_GIT_CLEAN%{$reset_color%}"
local THEME_GIT_DIRTY="%{$fg[red]%}$SYMBOL_GIT_DIRTY%{$reset_color%}"
local THEME_GIT_NEEDS_PULL="$SYMBOL_THEME_GIT_NEEDS_PULL"
local THEME_GIT_NEEDS_PUSH="$SYMBOL_THEME_GIT_NEEDS_PUSH"

# Versions themes
local THEME_VERSION_NODEJS_PREFIX="%{$fg[green]%}[$SYMBOL_VERSION_NODEJS "
local THEME_VERSION_NODEJS_SUFFIX="]%{$reset_color%}"

# Background jobs theme
local THEME_BACKGROUND_JOB="%{$fg[yellow]%}${SYMBOL_THEME_BACKGROUND_JOB}%{$reset_color%}"
