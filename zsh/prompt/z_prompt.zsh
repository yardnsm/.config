# --------------------------------------- #
# | The prompt itself
# --------------------------------------- #

# Prompt values
local current_dir="%{$fg[blue]%}%3~%{$reset_color%}"
local symbol="%(?.$PROMPT_SYMBOL.%{$fg[red]%}$EXIT_PROMPT_SYMBOL)"

# The prompt
PROMPT='
 ${symbol} $(user_host)${current_dir}'

# Right prompt, show git info
RPROMPT='$(git_prompt_info)  '

#
PROMPT2=' ${PROMPT2_SYMBOL} %_ >>> '

# Show working directory in the title
function precmd () {
    tab_label=${PWD/${HOME}/\~}
    echo -ne "\e]2;${tab_label}\a"
}
