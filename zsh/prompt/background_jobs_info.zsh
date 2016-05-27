# --------------------------------------- #
# | Background jobs info
# --------------------------------------- #

# Indicate a background job
background_jobs_info() {

    # The jobs
    bgjobs=$(jobs 2> /dev/null)

    # Check if there any
    if [[ $bgjobs == "" ]]; then
        echo ""
    else
        echo "$THEME_BACKGROUND_JOB"
    fi
}
