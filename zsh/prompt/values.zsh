# --------------------------------------- #
# | Prompt
# --------------------------------------- #

# Symbols
local SYMBOL_PROMPT="❯"
local SYMBOL_EXIT_PROMPT="❯❯"
local SYMBOL_PROMPT2='◇'
local SYMBOL_DIVIDER=" :: "

# --------------------------------------- #
# | Background jobs
# --------------------------------------- #

# Symbols
local SYMBOL_BACKGROUND_JOBS="*"

# Themes
local THEME_BACKGROUND_JOBS="%{$fg[magenta]%}[${SYMBOL_BACKGROUND_JOBS}]%{$reset_color%}"

# --------------------------------------- #
# | Git info
# --------------------------------------- #

# Symbols
local SYMBOL_GIT_CLEAN="☀︎"
local SYMBOL_GIT_DIRTY="☂"
local SYMBOL_THEME_GIT_NEEDS_PULL="✈︎"
local SYMBOL_THEME_GIT_NEEDS_PUSH="☁︎"

# Themes
local THEME_GIT_CLEAN="%{$fg[green]%}$SYMBOL_GIT_CLEAN%{$reset_color%}"
local THEME_GIT_DIRTY="%{$fg[red]%}$SYMBOL_GIT_DIRTY%{$reset_color%}"
local THEME_GIT_NEEDS_PULL="%{$fg[red]%}$SYMBOL_THEME_GIT_NEEDS_PULL%{$reset_color%}"
local THEME_GIT_NEEDS_PUSH="%{$fg[blue]%}$SYMBOL_THEME_GIT_NEEDS_PUSH%{$reset_color%}"

# --------------------------------------- #
# | Versions
# --------------------------------------- #

# NodeJS
local SYMBOL_VERSION_NODEJS="⬢"
local THEME_VERSION_NODEJS_PREFIX="%{$fg[green]%}[$SYMBOL_VERSION_NODEJS "
local THEME_VERSION_NODEJS_SUFFIX="]%{$reset_color%}"
