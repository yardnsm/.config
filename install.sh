#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Source all the stuff
# --------------------------------------------- #
source $current_dir/_setup/initializer.sh

# --------------------------------------------- #
# | Checking the options
# --------------------------------------------- #
DOTFILES_OPT__FULL=false
DOTFILES_OPT__HARD=false

case "$1" in
  "--full" ) DOTFILES_OPT__FULL=true ;;
  "--hard" ) DOTFILES_OPT__HARD=true ;;
  "-h" | "--help" )
    echo "Usage: ./install.sh [OPTIONS]                                 "
    echo "  Installs the dotfiles                                       "
    echo "                                                              "
    echo "Options:                                                      "
    echo "  --full        Use full install (running all tasks)          "
    echo "  --hard        Symlinking/copying process will override files"
    echo "  -h, --help    Show this output                              "
    echo "                                                              "
    exit 0
    ;;
esac

# --------------------------------------------- #
# | Show welcome message
# --------------------------------------------- #
print_welcome_message

# --------------------------------------------- #
# | Preinstall stuff
# --------------------------------------------- #
print_title "Getting ready"

# Run preinstall script
print_info "Make sure everything alright"
source $DOTFILES/_setup/preinstall.sh

# Ask if it's okay
print_info "Just to make sure"
ask_for_confirmation "Continue? "
print_divider

# Check if answer is yes
if answer_is_yes; then

  # Get sudo permissions
  check_for_sudo

  [[ $DOTFILES_OPT__FULL == true ]] &&
    source $DOTFILES/_setup/execute.sh ||
    source $DOTFILES/common/main.sh

else
  print_error "aborted"
  exit 1
fi

# --------------------------------------------- #
# | Done!
# --------------------------------------------- #
print_finish_message
