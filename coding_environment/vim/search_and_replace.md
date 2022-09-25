---
title: Search and replace in vim
desctiption: How to search and replace in vim
author: Roman Vavilov
date: '2022-01-11 17:03'
---

## Search and replace using built-in vim commands

`:s/[search]/[replace]/[flag]` - searches current line and replaces<br>
`%s/[search]/[replace]/[flag]` - searches current file and replaces accirding to flags.

`help s_flags` - for flags manual

> #### Use `+` insted of `/` to surround search.
> Due to the fact that **_s_** command utilizes `/` as delimiter (it surrounds the pattern and replacement string), other foreward slashes must be escaped. Instead, you can use any single-byte character, but
not an alphanumeric character, like **_\_**, **_"_** or **_|_.** This is useful if you want to include `/` in the search pattern or replacement string.
>

Double first occurance of `/` in a line.

```Shell
$ :s+/+//+
```

Find and replace all accurances of html tag, which has `/` in it. There are two spaces before each tag that represent indentation.

```Vim
:%s/  <link href="css\/normalize.css">\n/  <link href="\/css\/app.min.css">/g
```

Unlike with shell commands, with vim's **_s_** theres no need to wrap search term in quotes, because delimiter is not a space.

---
## Use Regexp to replace with condition

To replace a word, that comes before or after just another word, use Regexp capture groups.

Assuming i have a **_SomeModule_** import statement, and i need to replace the path but leave everything else intact. I also have **_OtherModule_** imported from the same path, but i want to keep it that way.
I also want to import **_ThidModule_** from both of these paths.

One can utilize [capture groups](https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Global_Objects/RegExp#grouping-back-references) to achieve this. The one difference with regular RegExp syntax is that the captured value is put WITHOUT the `$` prefix and you have to excape it.

```TypeScript
import { SomeModule } from 'some/module/path'; // replace everything, thats in single quotes
import { OtherModule } from 'some/module/path'; // keep intact
...
return <SomeModule /> // don't touch this

// Only substitute path in line, that has `SomeModule` and `some/module/path`.
%s+\(.*\)SomeModule\(.*\)some/module/path\(.*\)+\1SomeModule\2another/module/path\3+g

// Append `ThidModule` before the closing curly bracket in both lines.
%s+\(.*\)} from\(.*\)+\1, ThirdModule } from\2+g
```
---
## Multiline search and replace

Carriege return is `\n`.
