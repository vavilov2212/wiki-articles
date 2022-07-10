---
title: Ripgrep
desctiption: Notes on ripgrep
author: Roman Vavilov
date: '2022-01-11 15:16'
---

# Search using ripgrep

By default ripgrep will treat search term as regular expression i.e. wrap it with foreward slashes `/.../`. There
is no need to put them yourself, rg does it for you. Therefore escape regexp meta characters such as .(){}*+? etc. with
backslash `\`.

`-x, --line-regexp` flag will put `^...$` aroung all of the search patterns as Only show matches surrounded by line
boundaries.

`-F, --fixed-strings` - if you want to treat search term as literal string. When this flag is used, special
regular expression meta characters such as .(){}*+ do not need to be escaped.

To search for term which has spaces, wrap it in double quotes `"... ..."` (single quotes are treated as part of search
term). If there are double quotes as part of search term ascape them this backslash `\`.

```Shell
$ rg [term] --- rg "[search term]" --- rg "[search \"quoted\" term]"
```

Line break is `\n`, in this case `-U` flag for multiline is needed. Without it ripgrep will throw error `the literal '"\n"' is not allowed in a regex`.

```Shell
$ rg -U "\n  <link href=\"css/normalize.css\" rel=\"stylesheet\" type=\"text/css\">"
```

## Search and replace

Unfortunately ripgrep cannot write to files in filesystem =( For this use neovims `vim-grepper` plugin, which can
utilize ripgrep system executable. [Search & replace contents of quickfix-list with vims %s/](/vim/search_and_replace).

