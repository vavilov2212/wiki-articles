---
title: gitignore
description: .gitignore configuration for system and project
author: Roman Vavilov
date: '2023-06-13 09:35'
---

# .gitignore

According to the [documentation](https://git-scm.com/docs/gitignore#_description)

>The purpose of gitignore files is to ensure that certain files **not tracked** by Git **remain untracked**.

## Good to know

> To **stop tracking** a file that is currently tracked, use `git rm --cached` to remove the file from the index. The filename can then be added to the .gitignore file to stop the file from being reintroduced in later commits.


## Sources & Order of precedence

> Git normally checks gitignore patterns from <u>_multiple sources_</u>, with the following order of precedence, from highest to lowest (within one level of precedence, the last matching pattern decides the outcome):
> 
> - Patterns read from the command line for those commands that support them.
>
> - Patterns read from a `.gitignore` file in the same directory as the path ... higher level files being overridden by those in lower level files down to the directory containing the file.<br/>
> // **ATTENTION** These patterns match relative to the location of the .gitignore file
>
> - Patterns read from `$GIT_DIR/info/exclude.`<br/>
> // $GIT_DIR is set as an environment variable. <br/>
> // Read more in the `--git-dir=<path>` section of `man git`
>
> - Patterns read from the file specified by the configuration variable core.excludesFile<br/>
> // Which is `$XDG_CONFIG_HOME/git/ignore` by default<br/>
> // OR if the former is missing - `$HOME/.config/git/ignore`<br/>
> // OR is set in `.gitconfig` - see `git config --get core.excludesFile`
