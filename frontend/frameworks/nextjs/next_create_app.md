---
title: next-create-app
desctiption: Nexjt js create app tutorial
author: Roman Vavilov
date: '2022-01-25 00:14'
---

# Nextjs create app 

Create nextjs app documentation - [nextjs.org/create-next-app](https://nextjs.org/docs/api-reference/create-next-app)

> You can create a TypeScript project with the `--ts`, `--typescript` flag:

```Shell
$ npx create-next-app@latest --ts
```

> Create Next App can bootstrap your application using an example from the Next.js examples collection.

```Shell
$ npx create-next-app --example api-routes
```

## Nextjs create app examples has usefull repositories with common use cases.

| Repositories                                                                                                      | Decription                                                                                        |
|-------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| [with-dynamic-import](https://github.com/vercel/next.js/tree/main/examples/with-dynamic-import)                   | const DynamicComponent1 = dynamic(() => import('../components/DynamicComponent1'))                |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [svg-components](https://github.com/vercel/next.js/tree/main/examples/svg-components)                             | custom .babelrc to add support for importing .svg files and rendering them as React components.   |
|                                                                                                                   | babel-plugin-inline-react-svg is used to handle transpiling the SVGs.                             |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-app-layout](https://github.com/vercel/next.js/tree/main/examples/with-app-layout)                           | Shows how to use _app.js to implement a global layout for all pages.                              |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-absolute-imports](https://github.com/vercel/next.js/tree/main/examples/with-absolute-imports)               | configure Babel to have absolute imports instead of relative imports without modifying            |
|                                                                                                                   | the Webpack configuration.                                                                        |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-custom-reverse-proxy](https://github.com/vercel/next.js/tree/main/examples/with-custom-reverse-proxy)       | Reverse Proxy example                                                                             |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-custom-babel-config](https://github.com/vercel/next.js/tree/main/examples/with-custom-babel-config)         | An app using proposed do expressions. It uses babel-preset-stage-0, which allows us to use        |
|                                                                                                                   | above JavaScript feature.  It uses '.babelrc' file in the app directory to add above preset.      |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-env-from-next-config-js](https://github.com/vercel/next.js/tree/main/examples/with-env-from-next-config-js) | This example demonstrates setting parameters that will be used by your application and            |
|                                                                                                                   | set at build time (not run time).                                                                 |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [environment-variables](https://github.com/vercel/next.js/tree/main/examples/environment-variables)               | This example shows how to use environment variables in Next.js.                                   |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-context-api](https://github.com/vercel/next.js/tree/main/examples/with-context-api)                         | This example shows how to use react context api in our app.                                       |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-mobx](https://github.com/vercel/next.js/tree/main/examples/with-mobx)                                       | This is an example on how you can use mobx that also works with our universal rendering approach. |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-jest](https://github.com/vercel/next.js/tree/main/examples/with-jest)                                       | This example shows how to configure Jest to work with Next.js.                                    |
|                                                                                                                   | This includes Next.js' built-in support for Global CSS, CSS Modules, and TypeScript!              |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-loading](https://github.com/vercel/next.js/tree/main/examples/with-loading)                                 | Example app with page loading indicator                                                           |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-next-sass](https://github.com/vercel/next.js/tree/main/examples/with-next-sass)                             | This example demonstrates how to use Next.js' built-in Global Sass/Scss imports                   |
|                                                                                                                   | and Component-Level Sass/Scss modules support.                                                    |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-polyfills](https://github.com/vercel/next.js/tree/main/examples/with-polyfills)                             | If your own code or any external npm dependencies require features not supported by your target   |
|                                                                                                                   | browsers, you need to add polyfills yourself. In this case, you should add a top-level import     |
|                                                                                                                   | browsers, pecific polyfill you need in your Custom <App> or the individual component.             |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-react-bootstrap](https://github.com/vercel/next.js/tree/main/examples/with-react-bootstrap)                 | This example shows how to use Next.js along with react-bootstrap.                                 |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-react-ga](https://github.com/vercel/next.js/tree/main/examples/with-react-ga)                               | This example shows the most basic way to use react-ga using custom App component with NextJs.     |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-redux](https://github.com/vercel/next.js/tree/main/examples/with-redux)                                     | This example shows how to integrate Redux in Next.js.                                             |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-static-export](https://github.com/vercel/next.js/tree/main/examples/with-static-export)                     | This example show how to export to static HTML files your Next.js application fetching data       |
|                                                                                                                   | from an API to generate a dynamic list of pages.                                                  |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-slate](https://github.com/vercel/next.js/tree/main/examples/with-slate)                                     | This example shows how to use Next.js along with Slate.js.                                        |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-sitemap](https://github.com/vercel/next.js/tree/main/examples/with-sitemap)                                 | This example shows how to generate a sitemap.xml file based on the pages in your Next.js app.     |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-typescript-types](https://github.com/vercel/next.js/tree/main/examples/with-typescript-types)               | This example shows how to integrate the TypeScript type system into Next.js. Since TypeScript     |
|                                                                                                                   | is supported out of the box with Next.js, all we have to do is install TypeScript.                |
| ---------------------------------------------------------------------------------                                 | ------------------------------------------------------------------------------------------------- |
| [with-why-did-you-render](https://github.com/vercel/next.js/tree/main/examples/with-why-did-you-render)           | This is a simple example of how to use why-did-you-render. The header component will rerender     |
|                                                                                                                   | despite the state staying the same. You can see why-did-you-render console logs about this        |
|                                                                                                                   | redundant re-render in the developer console.                                                     |
| [with-typescript-eslint-jest](https://github.com/vercel/next.js/tree/main/examples/with-typescript-eslint-jest)   | Bootstrap a developer-friendly NextJS app configured with:                                        |
|                                                                                                                   | - Typescript                                                                                      |
|                                                                                                                   | - Linting with ESLint                                                                             |
|                                                                                                                   | - Formatting with Prettier                                                                        |
|                                                                                                                   | - Linting, typechecking and formatting on by default using husky for commit hooks                 |
|                                                                                                                   | - Testing with Jest and react-testing-library                                                     |
| [with-eslint](https://github.com/vercel/next.js/tree/main/examples/with-eslint)                                   | This example shows a Next.js application using the built-in ESLint setup with the next shareable  |
|                                                                                                                   | configuration enabled in .eslintrc                                                                |
