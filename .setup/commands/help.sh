#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

command::help() {
  cat <<EOF

  yardnsm's dotfiles maintenance

  Usage

    dots <command> [options] [...topics]

  Commands

    install [...topics]  Run the installation script for every topic
    symlink              Run the symlinking process
    list                 List all topics

  Options

    --init               Initialize git submodules
    -a, --all            Show all topics in 'list'
    -y, --yes            Skip confirmation questions
    -e, --exclude        Exclude [...topics] from installation
    -d, --debug-log      Write commands output to debug log
    -b, --base-dir       Set the dotfiles directory to run from
    -D, --dry-run        Check the symlinking operations
    -h, --help           Show help output

  Examples

    $ dots install common git
    $ dots install --exclude npm homebrew

    # Install another dotfiles repo that follows the same structure
    $ dots install -b ~/dotfiles-local
EOF
}
