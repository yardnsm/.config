# yardnsm's dotfiles

These are my dotfiles. A collection of zsh, git and macOS configurations. I built this repo from scratch, while focus on organization.

![](_misc/media/terminal.png)

## Installation

**Note:** This only compatible with macOS at the moment.

```console

# Install Xcode Command Line Tools
xcode-select --install

# Clone this repo
# Make sure to generate an SSH key:
# https://help.github.com/articles/generating-an-ssh-key/
git clone https://github.com/yardnsm/dotfiles.git ~/dotfiles

# Change your shell the ZSH
chsh -s $(which zsh)

# Run the installer!
cd ~/dotfiles
./install.sh --full
```

## Order and hierarchy

- Directories starting with `_` are related to the repo itself (install files, utils, submodules...).
- Every other directory is a topic directory, which may contain symlinks/copies/shell scripts relevant to the topic.

## TODOs:

- [ ] Add an update task
- [ ] Add a status utility (updated, symlinked files...)
- [ ] Clean-up utils
- [ ] Docs?
- [ ] Add support for linux (ubuntu probably).

## License

MIT © [Yarden Sod-Moriah](http://yardnsm.net/)
