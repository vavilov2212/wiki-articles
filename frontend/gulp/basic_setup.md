---
title:  Basic setup
desctiption: Gulp 4 basic project setup tutorial
author: Roman Vavilov
date: '2022-01-10 08:45'
---

# Gulp overview

[TOC]
> __Gulp__ - это таск-раннер, инструмент, который позволяет автоматизировать любой ручной труд в любой области. Его
используют не только в веб-разработке, но и в других областях, где требуется автоматизация рабочего процесса посредством
построения задач - сборка, билд, копирование и другая работа с файлами и файловой системой.

## <p id="filesystem">Filesystem</p>

Gulp takes files as input, processes them either with built-in functions or with external plugins. When it receives a
file passed through the pipeline, it writes the contents and other details out to the filesystem at a given directory.
More on that in documentation - [working with files](https://gulpjs.com/docs/en/getting-started/working-with-files).

## <p id="gulpfile">Gulpfile.js</p>

Main file of a gulp project must be titled `gulpfile.js` (or or capitalized as `Gulpfile.js`), that automatically loads
when you run the gulp command.

[__gulp4_tutorial.git__](https://github.com/vavilov2212/gulp4_tutorial) - example project following
[__this tutorial__](https://webdesign-master.ru/blog/tools/gulp-4-lesson.html).

Gulp API exposes number of methods like `task`, `src`, `dest`, etc. A gulp task is an asynchronous JavaScript function.
To register a function as task in previous versions of gulp a `task()` syntax was used, but starting gulp 4, primary
mechanism - is *__exporting__*.

*__gulp < 4__*
```JavaScript
gulp.task('buildJs', function () {
  return gulp.src(...) // Find file
  .pipe(...) // Proccess
  ...
});
```

*__gulp >= 4__*
```JavaScript
function buildJs() {
  return gulp.src(...).pipe(...);
};

exports.buildJs = buildJs;
```

*__run gulp task in shell__*
```Shell
$ gulp buildJs
```

## <p id="scripts">Scripts</p>

Gulp defines special `default` task, which runs when executing `gulp` with no explicit script in cli.
```Shell
$ cd ~\gulp4_tutorial
$ gulp
[10:55:15] Using gulpfile ~\gulp4_tutorial\gulpfile.js
[10:55:15] Task never defined: default
[10:55:15] To list available tasks, try running: gulp --tasks
```
<details><summary>Gulp 3 & 4 comparison</summary>

<br>

*__gulp < 4__*
```JavaScript
gulp.task('default', ['dev', 'buildJs', 'webserver', 'watch']);
```

*__gulp >= 4__*
```JavaScript
exports.default = parallel(dev, buildJs, webserver, watch);
```
</details>

## <p id="local">Local development</p>

There is no built-in live server in gulp so you need to install one. The recommended solution is
__[browser-sync](https://browsersync.io/docs)__, that is needed to watch on local files changes.

*__The flow of local development is the following:__*

Install and import `browser-sync`
```JavaScript
const browserSync = require('browser-sync').create();
```
Initiate `live server`
```JavaScript
function browsersync() {
  browserSync.init({
    server: { baseDir: 'src/' },
    notify: false, // Desctop notifications
    online: true, // External IP
  });
};
```
Prepare `watch` script
```JavaScript
function watch() {
  watch(['src/js/**/*.js'], buildJs);
};
```
Export `default` task
```JavaScript
exports.default = parallel(buildJs, browsersync, watch);
```

To update javascript in browser you actually need to reload the page. The `watch` script re-builds sources when a file
changes, but our server doesn't know about it. In order to update the browser, last step in the `buildJs` script must be
the following:
```JavaScript
function buildJs() {
  return ... // build sources
  .pipe(browserSync.stream()); // reload page
};
```

## <p id="styles">Styles</p>

The flow is almost the same as with javascript, exscept for when you use preprocessors `sass`, `less`, etc. For these
you need to install the respective executables. Also install
[`gulp-autoprefixer`](https://github.com/sindresorhus/gulp-autoprefixer) plugin that automatically adds specific
prefixed selectors for better browser support. Plugin [`gulp-clean-css`](https://github.com/scniro/gulp-clean-css)
minifies css or buitifies it, if you want to.
```Shell
$ npm i --save-dev gulp-sass sass gulp-autoprefixer gulp-clean-css
```
```JavaScript
function buildStyles() {
  return src(['src/sass/**/*.sass'])
    .pipe(sass()) // Compile to .css
    .pipe(concat('app.min.css')) // Merge files
    .pipe(autoprefixer({
      overrideBrowserslist: ['last 10 versions'], // Add prefixes for last 10 versions of browsers
      grid: true //  // Add grid selector prefixes for IE
    }))
    .pipe(cleancss({
      level: {
        1: { // Minify
          specialComments: 0 // Remove comments
        }
      }/* , format: 'beautify' */ // Beautify
    }))
    .pipe(dest('dist/css/')) // Put to destination directory
    .pipe(browserSync.stream()) // Reload styles in browser
}
```

## <p id="html">Html files</p>

```HTML
<!DOCTYPE html>
<html land="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Gulp 4 tutorial</title>
    <!--
        We are allready in `dist/` directory, paths are relative to it.
        If the .html file is in subdirectory you can either put leading `/` indicating root,
        which is `dist/` in this case. Or you can step back (`../`) relative to the current directory
    -->
    <link rel="stylesheet" href="/css/app.min.css">
    <script src="/js/app.min.js"></script>
  </head>
  <body>
    Gulp 4 tutorial body
  </body>
</html>
```

Add *__.html__* files to watch list, but the syntax is different.
```JavaScript
watch('src/html/**/*.html').on('change', browserSync.reload);
```

## <p id="images">Images</p>

Gulp task `buildImages` has the same layout: `return src(...).pipe(...).pipe(dest(...));`. In the middle you can
compress unoptimized images with [`gulp-imagemin`](https://github.com/sindresorhus/gulp-imagemin) plugin. It works out
of the box with __PNG, JPEG, GIF and SVG__ formats.
> Starting from version 8 `gulp-imagemin` is Pure ESM package, which means It cannot be `require()`'d from CommonJS and
requires nodejs@12.  More on this in
[sindresorhus/esm-package.md](https://gist.github.com/sindresorhus/a39789f98801d908bbc7ff3ecc99d99c).

In this tutorial i descided to stick with last CommonJS version, which is v7.1.0
```Shell
$ npm i --save-dev gulp-imagemin@7.1.0
```
```JavaScript
function buildImages() {
  return src('src/images/**/*')
    .pipe(imagemin()) // This does all the job
    .pipe(dest('dist/images/'))
};
```
Alternitevely you can look at these plugins [`compress-images`](https://github.com/Yuriy-Svetlov/compress-images)
[`gifsicle`](https://github.com/imagemin/gifsicle-bin) [`pngquant-bin`](https://github.com/imagemin/pngquant-bin)

## <p id="nodejs_modules">Nodejs modules</p>

When rebuilding you might need to clean the `dist/` directory in order to allways have a clean run. You can use nodejs
[`del`](https://github.com/sindresorhus/del) package to
> Delete files and directories using [`globs`](https://github.com/sindresorhus/globby#globbing-patterns)
```Shell
$ npm i --save-dev del
```

Task `clean` must be finished before other tasks. `del` returns a Promise, so you can define asyc function and
explicitly wait for deletion to accure. 

> NOTE: this doesn't pause thread execution if you invoke async task in `parallel`.

```JavaScript
async function clean() {
  return await del('dist/', { force: true })
    .then(res => {
      // https://simplernerd.com/js-console-colors/
      console.log("\x1b[38;2;0;128;0m%s\x1b[0m", "Successfully cleaned directory " + res)
    });
}
```

## <p id="default_task">Default task</p>

There are two methods of combining tasks: [`parallel`](https://gulpjs.com/docs/en/api/parallel) and
[`series`](https://gulpjs.com/docs/en/api/series). The following code invokes tasks one after another, in sequential
order.

```JavaScript
exports.default = series(
  clean,
  buildStyles,
  buildJs,
  ... // other tasks
);
```

If you want your tasks to run in `parallel` and still want `clean` function to finish before others are started - use
package.json start script like this:

```JSON
  "scripts": {
    "start": "gulp clean && gulp"
  }
```

## <p id="synchronous_tasks">Synchronous tasks</p>

Gulp 4
> Synchronous tasks are no longer supported. ... you can define your task as an async function, which wraps your task in
a promise. This allows you to work with promises synchronously using await and use other synchronous code.

See [Nodejs modules](#nodejs_modules) section.

