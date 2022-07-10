---
title: gulp-bem
desctiption: Example bem layout with gulp
author: Roman Vavilov
date: '2022-02-03 19:33'
---

# Bem layout using gulp

[bem methodology](https://ru.bem.info/methodology/quick-start/) stands for "Block Element Modifier".

[Build bem project using gulp](https://www.youtube.com/watch?v=l1G425VcUUg) - this video tutorial from 2016. I forked it's [source code to github](https://github.com/vavilov2212/gulp_bem_step_by_step).

`Important notice` - this tutorial is based on bem-spescific instruments: [gulp-bem-bundle-builder](https://github.com/bem/gulp-bem/tree/master/packages/gulp-bem-bundle-builder) and [gulp-bem-bundler-fs](https://github.com/bem/gulp-bem/tree/master/packages/gulp-bem-bundler-fs). But the info is outdated and latest versions of these instruments use different api now.

## Separate style blocks

The main thing here is the methodology itself. So consider the following gulp project example.

```Shell
.
├── src
│   ├── html
│   │   └── index.html
│   └── styles
│       ├── blocks
│       │   ├── button
│       │   │   ├── _danger
│       │   │   ├── button.css
│       │   │   └── button.deps.js
│       │   ├── header
│       │   │   ├── __logo
│       │   │   └── header.deps.js
│       │   ├── link
│       │   │   └── link.css
│       │   └── page
│       │       ├── page.css
│       │       └── page.deps.js
│       ├── desktop.blocks
│       │   └── page
│       │       ├── __footer
│       │       └── __header
│       └── main.scss
├── gulpfile.js
├── package-lock.json
└── package.json
```

Gulp will merge styles from all the css files and put it in one `app.min.css` file in the dist/ directory.

```JavaScript
function buildStyles() {
return src(['src/styles/**/*.{css,scss}'])
    .pipe(sass())
    .pipe(concat('app.min.css'))
    .pipe(autoprefixer({
      overrideBrowserslist: ['last 10 versions'],
      grid: true 
    }))
    .pipe(cleancss({
      format: 'beautify'
    }))
    .pipe(dest('dist/css/'))
};
```

Separated styles sit in the `blocks/` directory. This allows to separate code blocks, easy maintanance, espescially for larger projects.

If in your project, there are more, than one page with different style blocks, consider the following code.

```JavaScript
const pagesWithStyleBlocks  = [ 'page1', 'page2' ];

function buildStyleBlocks() {
  return Promise.resolve(
    pagesWithStyleBlocks.map((b) => {
      return src(`${sources}/style/blocks/${b}/**/*.{sass,scss}`)
        .pipe(concat(`${b}.scss`))
        .pipe(dest(`${sources}/style/sass/`))
        .pipe(browserSync.stream())
    })
  );
};
```

What a gulp task must return [gulpjs.com/async-completion](https://gulpjs.com/docs/en/getting-started/async-completion#signal-task-completion)

---

## More on instruments

Bem instruments implies, that only those css selectors, that are actually used in html will be put to the resulting css. For that, each html folder must have additional declaration file, that describes which blocks to request. This applies to

```Json
"gulp-bem-bundle-builder": "^0.1.0",
"gulp-bem-bundler-fs": "0.0.4",
```

and, apparently, has changed in latest versions.

This example repository [gulp_bem_step_by_step](https://github.com/vavilov2212/gulp_bem_step_by_step) uses those versions and here's how.

```Shell
.
├── blocks
├── desktop.blocks
├── pages
│   └── main
│       ├── main.bemdecl.js
│       └── main.html
├── .gitignore
├── README.md
├── gulpfile.js
└── package.json
```

```JavaScript
// pages/main/main.bemdecl.js
module.exports = [
    'page',
    'header',
    'link',
    'button'
];
```

```JavaScript
const bemBuilder   = require('gulp-bem-bundle-builder');
const bemBundlerFs = require('gulp-bem-bundler-fs');

const sources = 'src';
const destination = 'dist';

const builder = bemBuilder({
    levels: [`${sources}/blocks`, `${sources}/desktop.blocks`]
});

function buildStyles() {
  return bemBundlerFs(`${sources}/html`)
    .pipe(builder({
      css: bundle =>
        bundle.src('css')
        .pipe(concat(bundle.name + '.css'))
    }))
    .pipe(dest(`${destination}/css/`))
};
```

