# --------------------------------------- #
# | ZSH Config
# --------------------------------------- #

# Prompt
setopt NO_BG_NICE                             # Don't nice background tasks
setopt PROMPT_SUBST                           # Expand parameters within prompts

# History
setopt APPEND_HISTORY                         # Don't overwrite history
setopt INC_APPEND_HISTORY                     # Incrementally append commands to the history
setopt HIST_FIND_NO_DUPS                      # Do not file duplicated entries
setopt HIST_IGNORE_SPACE                      # Ignore commands with leading spaces
setopt HIST_IGNORE_ALL_DUPS                   # Ignore all duplicate entries in the history
setopt HIST_REDUCE_BLANKS                     # Tidy up commands before comitting them to history
setopt EXTENDED_HISTORY                       # Remember all sorts of stuff about the history

# Auto Completion
setopt COMPLETE_ALIASES                       # Also autocomplete aliases
setopt AUTO_LIST                              # Always automatically show a list of ambiguous completions
setopt COMPLETE_IN_WORD                       # Complete items from the beginning to the cursor

# Directory Changing
setopt AUTO_CD                                # Automatically cd in to directories if it's not a command name
setopt AUTO_PUSHD                             # Automatically push visited directories to the stack
setopt PUSHD_IGNORE_DUPS                      # Don't duplicate them

# Misc
setopt RM_STAR_WAIT                           # Wait, and ask if the user is serious when doing 'rm *''
setopt EXTENDED_GLOB                          # Give meaning to lots of crazy characters
setopt INTERACTIVE_COMMENTS                   # Allows to comment lines in an interactive shell
