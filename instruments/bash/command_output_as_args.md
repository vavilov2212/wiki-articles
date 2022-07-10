---
title: Command output as args
desctiption: How to put cmd output to another programm
author: Roman Vavilov
date: '2022-05-15 12:36'
---

The easiest way to pass one command output to another command - is to use [Command Substitution](http://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Substitution)
> Command substitution allows the output of a command to replace the command itself.

Its either $(command) or \`command\`

```Shell
$ user=$(whoami)
$ echo "Current user is: $user"
Current user is: my_username
```

> If the substitution appears within double quotes, word splitting and filename expansion are not performed on the results. 
