---
title: Declaratioin file
desctiption: How to write TS declaration files
author: Roman Vavilov
date: '2022-01-26 11:21'
---

# Configure declarations

See the [TypeScript handbook](https://www.typescriptlang.org/docs/handbook/declaration-files/introduction.html).

## What are declaration files and how do I get them?

To get type declarations for packages you can use `@typs`, that will request the [DefinitelyTyped](https://github.com/DefinitelyTyped/DefinitelyTyped) repository.

> The master branch is automatically published to the @types scope on npm thanks to [DefinitelyTyped-tools](https://github.com/microsoft/DefinitelyTyped-tools/tree/master/packages/publisher).

```Shell
$ npm install --save-dev @types/node
```

The types should then be automatically included by the compiler. You may need to add a types reference if you're not using modules:

```TypeScript
/// <reference types="node" />
```
