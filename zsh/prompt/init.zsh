autoload -U promptinit && promptinit

#
# Inspired by https://github.com/miekg/lean/
# Built using `Blox`: https://github.com/yardnsm/blox-zsh-theme
#

# ---------------------------------------------
# Blox settings

BLOX_CONF__ONELINE=true

BLOX_BLOCK__CWD_COLOR=140

BLOX_BLOCK__SYMBOL_SYMBOL='λ'
BLOX_BLOCK__SYMBOL_EXIT_SYMBOL='λ'
BLOX_BLOCK__SYMBOL_COLOR=140

BLOX_BLOCK__GIT_CLEAN_SYMBOL='+'
BLOX_BLOCK__GIT_DIRTY_SYMBOL='-'

BLOX_SEG__UPPER_LEFT=(host virtualenv bgjobs symbol cwd)
BLOX_SEG__UPPER_RIGHT=(exec_time vi_mode pyenv nodejs git)

# ---------------------------------------------
# Custom SSH settings

if [[ -n $SSH_CONNECTION ]]; then
  BLOX_BLOCK__GIT_UNPULLED_SYMBOL='d'
  BLOX_BLOCK__GIT_UNPUSHED_SYMBOL='p'

  BLOX_BLOCK__HOST_USER_SHOW_ALWAYS=true
  BLOX_BLOCK__HOST_MACHINE_SHOW_ALWAYS=true

  BLOX_SEG__UPPER_RIGHT=(git)
else

  # Hooks
  add-zsh-hook precmd blox_hook__precmd_git_fetch
  add-zsh-hook precmd blox_hook__precmd_reset_cursor

  # Enable VI mode
  blox_helper__enable_vi_mode
fi

# ---------------------------------------------
# Helper functions

blox_helper__redraw_prompt() {
  BLOX_CONF__PROMPT_PREFIX=""

  blox_hook__render
  zle && zle reset-prompt

  BLOX_CONF__PROMPT_PREFIX="\n"
}

blox_hook__precmd_reset_cursor() {
  tput cnorm
}

# ---------------------------------------------

prompt blox
