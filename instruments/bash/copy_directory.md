---
title: Copy subtree of directories
desctiption: Saved scripts to use later
author: Roman Vavilov
date: '2022-01-18 17:02'
---

## Copy source directory and its entire subtree into the target directory...
...and show files as they are copied.

`-R` flag causes symbolic links to be copied, rather then indirected through.
```Shell
$ cp -R -v source-directory target-directory/
```
