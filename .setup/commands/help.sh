#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

command::help() {
  cat <<EOF

  yardnsm's dotfiles maintenance

  Usage

    dots <command> [options]

  Commands

    install [...topics]  Run the symlinking process and the installation script for every topic
    symlink              Run the symlinking process
    list                 List all topics

  Options

    -a, --all            Show all topics in 'list'
    -y, --yes            Skip confirmation questions
    -e, --exclude        Exclude [...topics] from installation
    -d, --debug-log      Puke debug output to a log file
    -b, --base-dir       Run the local installation script
    -h, --help           Show help output

  Examples

    $ dots install common git
    $ dots install --exclude npm homebrew

    # Install another dotfiles repo that follows the same structure
    $ dots install -b ~/dotfiles-local
EOF
}
