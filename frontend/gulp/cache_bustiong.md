---
title: Cache busting
desctiption: Cache busting with gulp plugins
author: Roman Vavilov
date: '2022-01-14 10:57'
---

# Cache busting

[gulp-hash-src](https://github.com/nmrugg/gulp-hash-src) - this one i used in production.

```HTML
<!-- This -->
<link href="/css/app.min.css">
<script src="/js/app.min.js"></script>
<!-- Becomes this -->
<link href="/css/app.min.css?cbh=54d0b3bcc0d8edda0d2953a20f2bc36e">
<script src="/js/app.min.js?cbh=9eb58911e543ab1de4e3182ba958f4f8"></script>
```
The updated url will always match with the file contents. If file contents remains the same, so does the
url, but when the contents changes, the url will also change.

___
The plugin processes html files, that has allready been put into the `./dist` folder. It finds tags which match the regular expression and then calculate a hash of the files contents to update the url. 

The following gulp task will write html files and add <i><u>content hash</u></i> to tags.

```JavaScript
function buildHtml() {
  return src('src/html/**/*.html')
    /* This block does the job */
    .pipe(hash_src({
      build_dir: "./dist",
      src_path: "./src",
      exts: ['.css', '.js']
    }))
    /* If files come from different folders */
    .pipe(hashsrc({ build_dir: "./dist", src_path: "./js", exts: [".js"]}))
    .pipe(hashsrc({ build_dir: "./dist", src_path: "./css", exts: [".css"]}))
    .pipe(dest('dist'))
};
```
Other options:

- __hash__ – the hash type to use, but I’m happy with the default “md5”
- __hash_len__ – if you’re not happy with the length you can shorten it
- __enc__ – the character encoding, but I’m happy with the default “hex”
- __regex__ – regular expression can be used to limit the files which match and are processed, but I’m happy with the default
- __analyze__ – ties in with “regex” above
- __query_name__ – I’m happy with the default “cbh” but you can change if required
- __verbose__ – helpful for debugging, set to true if required


___
[gulp-rev](https://github.com/sindresorhus/gulp-rev) - seems to be interesting, but i couldn't figure out the correct way
to use it.

