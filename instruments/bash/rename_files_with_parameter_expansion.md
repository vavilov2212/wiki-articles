---
title: Rename files using parameter expansion
desctiption: None
author: Roman Vavilov
date: '2022-12-05 10:11'
---

## Parameter extension

Having the following file structure
```Shell
$ ls -la
$ .
$ ..
$ ???????_0.jpg
$ ???????_1.jpg
$ ???????_10.jpg
$ ???????_11.jpg
$ ???????_12.jpg
...
```

Do the following:
- Rename each file, leaving what goes after `_`
- Replace questing marks with `passport`

Use [parameter expansion](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html) (found in this [stackoverflow/answear](https://stackoverflow.com/a/428580)) to leave suffix starting with `_`.

```Shell
$ for file in *.jpg; do echo ${file#*_}; done
0.jpg
1.jpg
10.jpg
11.jpg
12.jpg
...
```

Rename each file:
```Shell
$ for file in *.jpg; do mv ${file} passport_${file#*_}; done
$ ls -la
$ .
$ ..
$ passport_0.jpg
$ passport_1.jpg
$ passport_10.jpg
$ passport_11.jpg
$ passport_12.jpg
...
```

TODO: Research why the letter works, but the following doesn't. Here the file extension is implicitly stated in curly braces.
```Shell
$ for file in *.jpg; do echo ${file#*_.jpg}; done // <--
???????_0.jpg
???????_1.jpg
???????_10.jpg
???????_11.jpg
???????_12.jpg
...
```

