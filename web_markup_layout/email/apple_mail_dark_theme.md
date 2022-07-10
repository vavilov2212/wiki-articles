---
title: Apple mail dark theme
desctiption: Support apple mail dark theme color inversion
author: Roman Vavilov
date: '2022-05-23 15:35'
---

# Color shemes (dark/light mode)

Detectingg `dark` / `light` color scheme is handled by the 
```css
@media (prefers-color-scheme: light) {
  body {
    background: white;
  }
}
@media (prefers-color-scheme: dark) {
  body {
    background: black;
  }
}
```

> - [browser support](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-color-scheme)
> - Read more on `prefers-color-scheme` media query in [web.dev/prefers-color-scheme: Hello darkness, my old friend](https://web.dev/prefers-color-scheme/)
> - Read about `color-scheme` CSS property and how to cobine it with the *prefers-* one in [web.dev/Improved dark mode default styling with the color-scheme CSS proper...](https://web.dev/color-scheme/)
> - Additionaly on `color-scheme` and `prefers-color-scheme` for webKit [webkit.org/dark-mode-support-in-webkit](webkit.org/dark-mode-support-in-webkit)

<br>

___

## Email clients support

As of writing this, just *2 major* email-clients [have this feature](https://www.caniemail.com/features/css-at-media-prefers-color-scheme/)
- Apple mail on both desktop & ios,
- Outlook macOS/iOS app, outlook web version 
- ... thats it

Gmail web does not support it (tested on mac firefox with system and forced dark mode). I could'nt get proper coloring on Android 10 gmail app. Allthough it did change the body background to dark, everything else was incorrect and some weired color inversions happened.

___
## What's the secret with apple mail?

Apple mail applies some adjustments to colors (text, background etc.) following certain rules (i assume, based on contrast ratio). For instance, when in dark mode on an apple device and, say, your text-color is set to a color close to black - it'll be inverted to something gray.

[This article](https://www.maildesigner365.com/the-secret-to-building-dark-mode-email-newsletters-for-macos-mojave-mail/) states, that the following happens under the hood

```CSS
@media (prefers-color-scheme: dark) {
  body {
    -apple-color-filter: invert(0.8235) hue-rotate(180deg) saturate(300%);
    -apple-color-filter: apple-invert-lightness(); 
  }
}

/*
 * This overrides it
 */
@media (prefers-color-scheme: dark) {
  body {
    background-color: white !important;
    -apple-color-filter: none;
  }
}
```

___
There is also `prefered-dark-interface` seems to be working on desctop client only, and i couldn't find any explanation on this query whatsoever.
After it failed on iOS, i just replaced it with `preffers-color-scheme: dark`, which work on both platforms.
