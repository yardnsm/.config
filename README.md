# yardnsm's dotfiles
yep.

These are my dotfiles. A collection of zsh, git and OSX configurations. I built this repo from scratch, while focus on organization.

![](https://raw.githubusercontent.com/yardnsm/dotfiles/master/_misc/media/terminal.png)

*screenshot may not be updated*

## Installation
**THIS DOTFILES REPO IS ONLY COMPATIBLE WITH MAC OSX AT THE MOMENT**

First, make sure that you have Xcode Command Line Tools installed:

```
xcode-select --install
```

Did that? gr8. Now follow GitHub's instructions on how to [Generate an SSH key](https://help.github.com/articles/generating-an-ssh-key/).

Then, clone the dotfiles repository into `~/dotfiles`. The symbolic links will be created in your home directory (~/).
After that, run the installation script.

**Before** you run the script, you should check what it does. Make sure to check the setup files (located in `_setup`).

```
# Clone this repo
git clone https://github.com/yardnsm/dotfiles.git ~/dotfiles

# Run the installer!
cd ~/dotfiles
./install.sh
```

It will take some time.

## Order and hierarchy
Everything in this repo is built around topical areas. Each 'topic' has its own directory. In each topic's directory there may be
a file called `main.sh`, which is the main topic's installer. There also may be sub-directories like `scripts` (some `.sh` scripts used for installing),
`shell` (some `.zsh` files like functions and aliases), `symlinks` (includes files to symlink to the home directory) and `copies` (guess whats in there).

## The Prompt
![](https://raw.githubusercontent.com/yardnsm/dotfiles/master/_misc/media/terminal-sliced.png)
I ~~made the prompt myself~~ stole everything from others.
- Syntax highlighting with [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- Auto suggestion with [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- Shows info about git (branch, commit hash, dirty/clean, needs pull/push)
- Shows the current working directory (dah.) + in the title
- Shows indicator for background processes
- The symbol next the the working directory turns red if the last command exited with an error
- Shows node's version if there is a `package.json` file in the working directry
- Magical stuff with [z](https://github.com/rupa/z)

## Iterm config
Too lazy to add a topic for iTerm, because it just take 2 seconds.

### Text/fonts
![](https://raw.githubusercontent.com/yardnsm/dotfiles/master/_misc/media/iterm-text.png)

### Window
![](https://raw.githubusercontent.com/yardnsm/dotfiles/master/_misc/media/iterm-window.png)

# Inspired by
- [pure prompt](https://github.com/sindresorhus/pure)
- [nicknisi's dotfiles](https://github.com/nicknisi/dotfiles)
- [carlos' dotfiles](https://github.com/caarlos0/dotfiles)
- [alrra's dotfiles](https://github.com/alrra/dotfiles)
- [geometry ZSH theme](https://github.com/frmendes/geometry)

## TO-DO:
- [ ] Add a topic for iTerm2
- [ ] Make this README more fancy, update pictures
- [ ] Add one-command install (curl)
- [ ] More git info!!!!
- [ ] Show more info (cpu, ram, battery...)
- [ ] emojis 😁🚀
- [ ] Add a sync script
- [ ] Docs?
- [ ] Add support for linux
- [ ] Add more file to 'bin'
- [ ] Achieve 42,956 commits. Add support for windows after that? nah.
