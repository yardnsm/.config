# --------------------------------------- #
# | Values
# --------------------------------------- #

# Symbols
local SYMBOL_BACKGROUND_JOBS="*"

# Themes
local THEME_BACKGROUND_JOBS="%{$fg[magenta]%}[${SYMBOL_BACKGROUND_JOBS}]%{$reset_color%}"

# --------------------------------------- #
# | Primary thing
# --------------------------------------- #

# Indicate a background job
function prompt_background_jobs_info() {

    # The jobs
    bgjobs=$(jobs 2> /dev/null)

    # Check if there any
    if [[ $bgjobs == "" ]]; then
        echo ""
    else
        echo "$THEME_BACKGROUND_JOBS "
    fi
}
