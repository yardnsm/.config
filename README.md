# YardNsm's Dotfiles
Whoo-Hoo! Can't believe I finished it..

Hi, this is my dotfiles. A collection of zsh, git and OSX configurations. I built this repo from scratch, while focus on organization.

![the final product](https://raw.githubusercontent.com/YardNsm/dotfiles/master/_misc/media/terminal.png)

## Installation
**THIS DOTFILES REPO IS ONLY COMPATIBLE WITH MAC OSX AT THE MOMENT**

First, make sure that you have Xcode Command Line Tools installed:

```
xcode-select --install
```

Then, clone the dotfiles repository. You can clone it anywhere: the symbolic links will be created in your home directory (~/).
After that, run the `install` script.

**Before** you run the script, I strongly recommend to check what it does. Make sure to check the setup files (located in `_setup`).

```
# Clone this repo
git clone https://github.com/yardnsm/dotfiles.git ~/dotfiles

# Run the installer!
cd ~/dotfiles
./install.sh
```

Follow the instruction on the screen, and you are good to go.

![installer](https://raw.githubusercontent.com/YardNsm/dotfiles/master/_misc/media/install.png)

## The prompt
__(Coming Soon)__

## OSX Setup
__(Coming Soon)__

## TO-DO:
- [ ] Improve README, update pictures
- [ ] Add an update installer in the 'misc' task
- [ ] Add RSA key creation
- [ ] Add IntelliJ IDEA setting in _misc folder
- [ ] Add an option to turn off auto updates
- [ ] add applications
- [ ] add applications settings
- [ ] review osx settings
- [ ] review applications settings
- [ ] add a sync script inside 'bin'
- [ ] add an update script inside 'bin'
- [ ] add a backup script inside 'bin' (?)
- [ ] add support for ubuntu (do ton of refactor before)
