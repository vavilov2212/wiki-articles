---
title: Templating
desctiption: Templating in gulp
author: Roman Vavilov
date: '2022-01-14 10:58'
---

# Templating

You can write purely on template engines like pug or jekyll (see awesome-gulp). But as for just having some parts of html reusable across static pages i encountered projects that used [gulp-rigger](https://github.com/kuzyk/gulp-rigger) (it has been updated over 6 years ago, but still works). The other one is [gulp-include](https://github.com/wiledal/gulp-include).

```JavaScript
function buildHtml() {
  return src('src/html/**/*.html')
    .pipe(include({
      extensions: 'html',
      includePaths: __dirname + '/src/html_templates'
    }))
    .pipe(dest('dist'))
  };
```

In html files you write `//=include [path to file]`. Path to file is relative to the on you entered in `includePaths` option. For more - refer [documentation](https://github.com/wiledal/gulp-include).

```JavaScript
<!DOCTYPE html>
<html>
//=include head.html
<title>Title</title>
<meta ...>
...rest
```


