# Expand parameters within prompts
setopt PROMPT_SUBST

# History
HISTSIZE=10000
SAVEHIST=$HISTSIZE

# Display info for tasks long than 8sec
REPORTTIME=8

# More history
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Ignore all duplicate entries in the history
setopt HIST_IGNORE_ALL_DUPS

# Always automatically show a list of ambiguous completions
setopt AUTO_LIST

# Complete items from the beginning to the cursor
setopt COMPLETE_IN_WORD

# Automatically cd in to directories if it's not a command name
setopt AUTO_CD

# Automatically push visited directories to the stack
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# More powerful globs
setopt EXTENDED_GLOB

# Allows to comment lines in an interactive shell
setopt INTERACTIVE_COMMENTS

# Disable th
setopt NO_WARN_CREATE_GLOBAL

# ---------------------------------------------

# Make tab completion behave like vim's smartcase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Enable menu selection
zstyle ':completion:*' menu select
