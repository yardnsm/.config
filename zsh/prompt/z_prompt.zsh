# --------------------------------------- #
# | The prompt itself
# --------------------------------------- #

# Prompt values
# >»❭›❯
local current_dir="%{$fg[blue]%}%3~%{$reset_color%}"
local symbol="%{$fg[cyan]%}%(?.$SYMBOL_PROMPT.%{$fg[red]%}$SYMBOL_EXIT_PROMPT)"

# Prompt rows
function prompt_row_upper_left()  { echo " $(user_host)${current_dir}" }
function prompt_row_upper_right() { echo "$(background_jobs_info)$(versions_info)$(get_time)  " }
function prompt_row_lower_left()  { echo "${symbol} " }
function prompt_row_lower_right() { echo "$(git_prompt_info)  " }

# The prompt
PROMPT='
$(prompt_row_upper_left)$(put_spaces)$(prompt_row_upper_right)
 $(prompt_row_lower_left)'

# Right prompt, show git info
RPROMPT='$(prompt_row_lower_right)'

# PROMPT2
PROMPT2=' ${SYMBOL_PROMPT2} %_ >>> '

# --------------------------------------- #
# | Utils
# --------------------------------------- #

# Time
function get_time() {
    echo "[%T]"
}

# Spacessssss
function put_spaces() {

    # To filter
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
