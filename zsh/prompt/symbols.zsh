# --------------------------------------- #
# | Symbols for some prompt values
# --------------------------------------- #

# Prompt Symbols
local PROMPT_SYMBOL="△"
local EXIT_PROMPT_SYMBOL="△"
local BACKGROUND_JOB_SYMBOL="✱"
local PROMPT2_SYMBOL='◇'

# Git Symbols
local CLEAN_SYMBOL="⬢"
local DIRTY_SYMBOL="⬡"
local NEEDS_PULL_SYMBOL="⇣"
local NEEDS_PUSH_SYMBOL="⇡"
local REBASE_SYMBOL="\uE0A0"

# --------------------------------------- #
# | Themed stuff
# --------------------------------------- #

# For the git info
local GIT_PROMPT_CLEAN="%{$fg[green]%}$CLEAN_SYMBOL%{$reset_color%}"
local GIT_PROMPT_DIRTY="%{$fg[red]%}$DIRTY_SYMBOL%{$reset_color%}"
local GIT_NEEDS_PULL="$NEEDS_PULL_SYMBOL"
local GIT_NEEDS_PUSH="$NEEDS_PUSH_SYMBOL"
local GIT_DIVERGED="$DIVERGED_SYMBOL"

# For the Background jobs info
local BACKGROUND_JOB="(%{$fg[yellow]%}${BACKGROUND_JOB_SYMBOL}%{$reset_color%})"
