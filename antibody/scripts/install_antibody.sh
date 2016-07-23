#!/usr/bin/env bash

# --------------------------------------------- #
# | Install antibody
# --------------------------------------------- #
if ! cmd_exists 'antibody'; then
  curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s &> /dev/null
  which antibody &> /dev/null
fi
print_result $? 'antibody'
