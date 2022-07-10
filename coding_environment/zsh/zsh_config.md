---
title: ZSH config
desctiption: Memos on zsh configuration
author: Roman Vavilov
date: '2022-04-13 20:00'
---

## Intro

Mac OS comes with zsh as default shell. On other systems installation is not hard.

## Oh-my-zsh

To install `oh-my-zsh` simply run the [installation script](https://ohmyz.sh/#install).

After the installation there will be 3 major changes on the system:

1. Installation script will make copy of `.zshrc` (there will be cmd prompt) for backup
2. Newly generated `.zshrc` file will take its place
3. There will be `.oh-my-zsh` folder with all the internals (plugins, themes, etc.)

## Themes

[Default themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes) are allready installed. All you need to do is change the `ZSH_THEME` in `~/.zshrc` file.

To install of [external themes](https://github.com/ohmyzsh/ohmyzsh/wiki/External-themes) just add the respective file to `$ZSH/themes` folder. [More info here](https://github.com/ohmyzsh/ohmyzsh/wiki/Customization#overriding-and-adding-themes).

## Uninstall

To uninstall oh-my-zsh run
```Bash
uninstall_oh_my_zsh
```

Read the [docs](https://github.com/ohmyzsh/ohmyzsh#uninstalling-oh-my-zsh).
