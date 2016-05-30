# --------------------------------------- #
# | Values
# --------------------------------------- #

# Symbols
local SYMBOL_PROMPT="❯"
local SYMBOL_EXIT_PROMPT="❯❯"
local SYMBOL_PROMPT2='◇'
local SYMBOL_DIVIDER=" :: "

# --------------------------------------- #
# | The prompt itself
# --------------------------------------- #

# Prompt values
# >»❭›❯
local current_dir="%{$fg[blue]%}%3~%{$reset_color%}"
local symbol="%{$fg[cyan]%}%(?.$SYMBOL_PROMPT.%{$fg[red]%}$SYMBOL_EXIT_PROMPT)%{$reset_color%}"

# Prompt rows
function prompt_row_upper_left()  { echo " $(info_user)${current_dir} $(info_git)" }
function prompt_row_upper_right() { echo "$(info_background_jobs)$(info_versions)$(get_time)  " }
function prompt_row_lower_left()  { echo " ${symbol} " }
function prompt_row_lower_right() { echo "  " }

# The prompt
PROMPT='
$(prompt_row_upper_left)$(put_spaces)$(prompt_row_upper_right)
$(prompt_row_lower_left)'

# Right prompt
RPROMPT='$(prompt_row_lower_right)'

# PROMPT2
PROMPT2=' ${SYMBOL_PROMPT2} %_ >>> '

# --------------------------------------- #
# | Helper functions
# --------------------------------------- #

# Time
function get_time() {
  echo "[%T]"
}

# Spacessssss
function put_spaces() {

  # The filter
  local zero='%([BSUbfksu]|([FBK]|){*})'

  # Upper left
  local upperleft="$(prompt_row_upper_left)"
  upperleft=${#${(S%%)upperleft//$~zero/}}

  # Upper right
  local upperright="$(prompt_row_upper_right)"
  upperright=${#${(S%%)upperright//$~zero/}}

  # Desired spaces length
  local termwidth
  (( termwidth = ${COLUMNS} - ${upperleft} - ${upperright} ))

  # Calculate spaces
  local spacing=""
  for i in {1..$termwidth}; do
    spacing="${spacing} "
  done
  echo $spacing
}
