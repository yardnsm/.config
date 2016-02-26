#!/bin/bash

# --------------------------------------------- #
# | Change shell to zsh if needed
# --------------------------------------------- #
if ! [ $SHELL = $(which zsh) ]; then
    chsh -s $(which zsh)
    print_result $? "Changed shell to ZSH"
else
    print_success "ZSH is already your shell, horray!"
fi
