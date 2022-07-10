---
title: Search and replace in vim
desctiption: How to search and replace in vim
author: Roman Vavilov
date: '2022-01-11 17:03'
---

# Search and replace practice using built-in vim commands

`:s/[search]/[replace]/[flag]` - searches current line and replaces<br>
`%s/[search]/[replace]/[flag]` - searches current file and replaces accirding to flags.

`help s_flags` - for flags manual

Because `s` command utilizes `/` as delimiter other foreward slashes must be escaped.<br>
Instead of the `/` which surrounds the pattern and replacement string, you can use any other single-byte character, but
not an alphanumeric character, `\`, `"` or `|`.  This is useful if you want to include a `/` in the search pattern or
replacement string.  Example: `:s+/+//+` - `+` is the replacement for pattern delimiter.

This examples finds and replaces all accurances of html tag, which has `/` in it.

```Vim
%s/  <link href="css\/normalize.css">\n/  <link href="\/css\/app.min.css">/g
```

Unlike with shell commands, with vim's `s` theres no need to wrap search term in quotes, because delimiter is not a space. Carriege return is `\r`.

<!-- TODO: Add character escaping desctiption <11-01-22, Roman Vavilov> -->
