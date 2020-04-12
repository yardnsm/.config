# dotfiles

[![Build Status](https://github.com/yardnsm/dotfiles/workflows/main/badge.svg)](https://github.com/yardnsm/dotfiles/actions)

These are my dotfiles. A collection of zsh, git, vim and macOS configurations. I built this repo
from scratch, while focus on organization.

## Installation

Simply run the following commands in your terminal:

```bash
# Clone the repository
$ git clone https://github.com/yardnsm/dotfiles ~/dotfiles

# Run the installation script
$ cd dotfiles
$ ./.setup/dots --init
```

## Order and hierarchy

- Every non-hidden directory is considered as a "topic". A topic can have an `install.sh` file that
  will run when installing the dotfiles.
- [`.symlinks`](./.symlinks) contains a list of the directories / files to symlink.
- `init.zsh` files inside each topic will be sourced when the shell loads.

## `dots`

[`dots`](./.setup/dots) is an executable for managing the dotfiles. It will manage every topic's
installation. You can pass some options to exclude certain topics from installation, or set specific
topics to install.

```
$ dots

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
    -d, --debug-log      Puke debug output to a log file
    -b, --base-dir       Set the dotfiles directory to run from
    -D, --dry-run        Check the symlinking operations
    -h, --help           Show help output

  Examples

    $ dots install common git
    $ dots install --exclude npm homebrew

    # Install another dotfiles repo that follows the same structure
    $ dots install -b ~/dotfiles-local
```

----------------------------------------------------------------------------------------------------

## License

MIT © [Yarden Sod-Moriah](http://yardnsm.net/)
