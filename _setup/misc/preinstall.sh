#!/bin/bash

# --------------------------------------------- #
# | Initializing git modules
# --------------------------------------------- #
git submodule update --init --recursive
print_result $? "Initializing git modules"
