---
title: Find
desctiption: Find utility
author: Roman Vavilov
date: '2022-06-27 13:57'
---

## Find files by pattern

`-name` - pattern to match name of file. Leading directories are removed, so anything, that contains **/** (foreward slash) will be ignored.
`-path` - pattern to match path. Must be put in quotes (TODO: find out why)

```Shell
$ find -name *.*.orig -path "./**" -type f
```

---

## Delete files found by pattern

`-delete` - action to apply to matched files

```Shell
$ find -name *.*.orig -path "./**" -type f -delete
```
