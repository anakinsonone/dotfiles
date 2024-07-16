# My Dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

First, check out the dotfiles repo in your `$HOME` directory using git,

```
$ git clone git@github.com:anakinsonone/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks for these dotfiles.

```
$ stow .
```

Or, you can use the `--adopt` flag if you want to let stow handle the symlinks.

```
$ stow --adopt .
```

(In case you forget something, refer to [this video](https://youtu.be/y6XCebnB9gs?si=dqDu_gkoBmzraEi9).)
