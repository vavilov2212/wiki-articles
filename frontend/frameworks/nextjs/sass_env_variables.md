---
title: sass env variables
desctiption: Inject sass global variables from next.config.js
author: Roman Vavilov
date: '2022-01-25 02:05'
---

# Add global variable to sass compiler

These stackoverflow answears helped me.
[stackoverflow/Using-SASS-variables-from-global-scss](https://stackoverflow.com/a/65467413)
[stackoverflow/How-can-I-use-environment-variables-in-node-sass-.scss-files?](https://stackoverflow.com/a/61705701)

Nextjs has built in sapport for sass. To use component isolated .sass or .scss files you need to install `sass`.
```Shell
$ npm install sass
```

To configure sass compiler you can use `sassOptions` in `next.config.js`. [nextjs.org/#customizing-sass-options](https://nextjs.org/docs/basic-features/built-in-css-support#customizing-sass-options)

For instance, if you want to load assets from styles like `@font-face` src and have different locations on prod and dev environments, you can do the following:

In next.config.js set `assetPrefix` depending on the environment. Then, add `sassOptions` variable.

```JavaScript
module.exports = (phase) => {
  // when started in development mode `next dev` or `npm run dev`
  const isDev = phase === PHASE_DEVELOPMENT_SERVER;
  // when `next build` or `npm run build` is used
  const isProd = phase === PHASE_PRODUCTION_BUILD;

  const assetPrefix = isProd ? '/prod' : '/';

  const sassOptions = {
    prependData: `$prefix: "${assetPrefix}";`,
  }

  ... // Other configuration

  return {
    ...
    sassOptions
  };
}
```

In .scss files now you can use this `prefix` variable to prepend import paths.

```SCSS
@font-face {
  font-family: 'Open-Sans';
  src: url("#{$prefix}fonts/OpenSans-Regular.ttf");
```
