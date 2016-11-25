# --------------------------------------- #
# | ZSH Config
# --------------------------------------- #

# Expand parameters within prompts
setopt PROMPT_SUBST

# History
HISTSIZE=10000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE

# More history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Ignore all duplicate entries in the history
setopt HIST_IGNORE_ALL_DUPS

# Also autocomplete aliases
setopt COMPLETE_ALIASES

# Always automatically show a list of ambiguous completions
setopt AUTO_LIST

# Complete items from the beginning to the cursor
setopt COMPLETE_IN_WORD

# Automatically cd in to directories if it's not a command name
setopt AUTO_CD

# Automatically push visited directories to the stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Guess what
setopt EXTENDED_GLOB

# Allows to comment lines in an interactive shell
setopt INTERACTIVE_COMMENTS
