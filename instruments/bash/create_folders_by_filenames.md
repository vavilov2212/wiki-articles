---
title: Create folders by filenames
desctiption: Saved scripts to use later
author: Roman Vavilov
date: '2022-01-18 17:02'
---

## Create folders by filenames

Having the following file structure
```Shell
$ ls -la
$ .
$ ..
$ index.html
$ file1.html
$ file2.html
...
```

Do the following:
- Put each file in the directory, which name is the name of the respective file
- In each directory, create file `index.html` with contents of the original file

```Shell
$ for i in *.html ; do mkdir ${i%.*}; cat $i > ${i%.*}/index.html ; done
```
### Step by step

Take every file with `.html` extention and echo its name.

```Shell
$ for i in *.html ; do echo $i ; done
index.html
file1.html
file2.html
...
```

Use [parameter expansion](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html) (found in this [stackoverflow/answear](https://stackoverflow.com/a/428580)) to remove suffix starting with ".".

```Shell
$ for i in *.html ; do echo ${i%.*} ; done
index
file1
file2
...
```

Pass each entry as parameter to `mkdir` to create folders. Use `cat`, to send the stdout to files in respective
directories.

> ```man cat```
The cat utility reads files sequentially, writing them to the standard output.

```Shell
$ for i in *.html ; \
  do mkdir ${i%.*} ; \
  cat $i > ${i%.*}/index.html ; \ # This line
  done
```
