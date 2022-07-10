---
title: npm triks
desctiption: npm cli commands
author: Roman Vavilov
date: '2021-11-15'
---

## List of globally installed packages (hide peer dependencies)
```Shell
$ npm list -g --depth 0
```

<br>

---
## Get current package version from package.json file

github discusstion on how to [extract version from package.json (NPM) using bash / shell](https://gist.github.com/DarrenN/8c6a5b969481725a4413?permalink_comment_id=3364676#gistcomment-3364676)

Using the `execute` method
```Shell
$ npx -c 'echo "$npm_package_version"'
$ npm exec -c 'echo "$npm_package_version"'
0.0.5
```

`-c` flag for execute 'cmd' (in quotes) with [...args]

Using npm `pkg` command to magage package.json (`npm pkg get <key>`). The output is surrounded in `"` (double quotes).
```Shell
$ npm pkg get version
"0.0.5"
```
