#!/bin/bash

# --------------------------------------------- #
# | Source the following if needed
# --------------------------------------------- #

# Check if sourced
if [ -z ${sourced+x} ]; then

    # It was sourced now
    sourced="yep."

    # Source'em all
    source ./_setup/utils/messages.sh
    source ./_setup/utils/ask.sh
    source ./_setup/utils/commands.sh
    source ./_setup/utils/installs.sh
    source ./_setup/utils/spinner.sh
    source ./_setup/variables.sh
fi
