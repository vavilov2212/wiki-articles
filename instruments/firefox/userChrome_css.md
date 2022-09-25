---
title: userChrome_css
desctiption: customize firefox
author: Roman Vavilov
date: '2022-09-06 20:01'
---

## Where is userChrome.css

### Firefox installed from snap store or via sudo snap install cmd

App data is then stored in `~/snap/firefox/common/.mozilla/firefox/<YourFirefoxProfile>`

### Firefox is installed the other way

It's likely in `/home/<YourUserName>/.mozilla/firefox/<YourFirefoxProfile>`

> If you logged in to only one account, then it's likely the one with the `default` in its name. E.g. `.../.mozilla/firefox/5pf1o16l.default`

Browser styles are kept in `chrome/userChrome.css`. If it doesn't exist - create one

```Shell
mkdir chrome && touch chrome/userChrome.css
```

## Edit browser styles

I ended up having just this

```CSS
/*
 * Hide Tabs on Topbar
 */
#main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
  opacity: 0;
  pointer-events: none;
}
#main-window:not([tabsintitlebar="true"]) #TabsToolbar {
  visibility: collapse !important;
}
```

You also have to set `toolkit.legacyUserProfileCustomizations.stylesheets` to true in [about:config](about:config). This is for Firefox 69+.

But you can do almost anything with browser appearance. Here are some usefull links.

- [Hide horizontal tabs at the top of the window](https://github.com/piroor/treestyletab/wiki/Code-snippets-for-custom-style-rules#hide-horizontal-tabs-at-the-top-of-the-window-1349-1672-2147) - huge list of tweeks with code samples. This anchor particularly leads to hiding horizontal tabs.
- [A userChrome.css to use with Tree Style Tab](https://gist.github.com/collinbarrett/45c90f7d427e08d69d32dfef402c86f6) - just how to hide horizontal tabs along with "Tree Style Tabs" sidebar header.
- [Firefox UI tweaks extending the 'Tree Style Tab'-Addon for optimizing vertical page size](https://github.com/funkykay/firefox-vertical-tweaks) - someone sharing his approach of customizing browser with tree style tab extension.
