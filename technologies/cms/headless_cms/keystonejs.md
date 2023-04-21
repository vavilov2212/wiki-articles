---
title: Keystonejs
desctiption: Keystonejs
author: Roman Vavilov
date: '2022-04-25 14:17'
---

## Links

[Documentation on version 6](https://keystonejs.com/docs)


## Prisma

When running on mac M1 chip `npm run dev` command in keystonejs project spawns this error:
```Shell
Error: Could not find prisma-fmt binary. Searched in [path-to-keystonejs-project]/node_modules/@prisma/sdk/prisma-fmt-darwin and [path-to-keystonejs-project]/node_modules/@prisma/prisma-fmt-darwin
```

But it's not there.

*SOLUTION*:

Run `npx prisma --version` in the project root and it somehow downloads the binaries.

Proof:

```Shell
$ npx prisma --version
prisma                  : 3.11.0
@prisma/client          : 3.11.0
Current platform        : darwin
Query Engine (Node-API) : libquery-engine b371888aaf8f51357c7457d836b86d12da91658b (at node_modules/@prisma/engines/libquery_engine-darwin.dylib.node)
Migration Engine        : migration-engine-cli b371888aaf8f51357c7457d836b86d12da91658b (at node_modules/@prisma/engines/migration-engine-darwin)
Introspection Engine    : introspection-core b371888aaf8f51357c7457d836b86d12da91658b (at node_modules/@prisma/engines/introspection-engine-darwin)
Format Binary           : prisma-fmt b371888aaf8f51357c7457d836b86d12da91658b (at node_modules/@prisma/engines/prisma-fmt-darwin)
Default Engines Hash    : b371888aaf8f51357c7457d836b86d12da91658b
Studio                  : 0.458.0
```
