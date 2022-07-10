---

title: npm-version
desctiption: npm version cmd memos
author: Roman Vavilov
date: '2022-05-15 12:26'
------------------------

## Bump package version with commit message

```Shell
$ npm version patch -m \
  "Increment package version $(npx -c 'echo "$npm_package_version"') -> %s"
```

---

asdasdasdasdasd

## Commiting & .npmrc configuration

To make commit as result of this command there must be `git-tag-version` key set in `.npmrc`. Run the following command to see current configuration.

---

## Increment options

To increment version following semver rules there are `patch | minor | major | prepatch | preminor | premajor | prerelease | from-git` options to the command.

> `from-git` will try to read the latest git tag, and use that as the new npm version.

To set [-pre- pattern](https://docs.npmjs.com/cli/v8/commands/npm-version#preid) to your versions add `preid=dev` to .npmrc or add `--preid <pattern>` to the command.

```Shell
$ npm pkg get version // "1.0.0"
$ npm version prerelease // "1.0.1-dev.0" (--preid dev)
$ npm version prepatch // "1.0.2-dev.0"
$ npm version preminor // "1.1.0-dev.0"
$ npm version premajor // "2.0.0-dev.0"
$ npm version patch // "2.0.1"
$ npm version minor // "2.1.0"
$ npm version major // "3.0.0"

```

To disable commit hooks add `--no-commit-hooks` param to the command.
