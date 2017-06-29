# dotfiles

These are my dotfiles. A collection of zsh, git, vim and macOS configurations. I built this repo from scratch, while focus on organization.

## Installation

The installation currently supports macOS and linux distros that ships with `apt-get` (targeted for ubuntu and debian).

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
./install.sh
```

## Order and hierarchy

- Directories starting with `_` are related to the repo itself (install files, utils, submodules...).
- Every other directory is a topic directory, which may contain symlinks/shell scripts relevant to the topic.

## License

MIT © [Yarden Sod-Moriah](http://yardnsm.net/)
