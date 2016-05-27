# --------------------------------------- #
# | The prompt itself
# --------------------------------------- #

# Prompt values
# >»❭›❯
local current_dir="%{$fg[blue]%}%3~ ❯%{$reset_color%}"
local symbol="%(?.$SYMBOL_PROMPT.%{$fg[red]%}$SYMBOL_EXIT_PROMPT)"

# The prompt
PROMPT='
 $(versions_info)${symbol} $(background_jobs_info) $(user_host)${current_dir} '

# Right prompt, show git info
RPROMPT=' $(git_prompt_info)  '

PROMPT2=' ${SYMBOL_PROMPT2} %_ >>> '
