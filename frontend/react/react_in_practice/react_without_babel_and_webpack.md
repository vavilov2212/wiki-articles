---
title: React without babel & webpack
desctiption: React example without babel & webpack
author: Roman Vavilov
date: '2022-01-31 10:04'
---

# React without babel and webpack

[Smale project](https://github.com/vavilov2212/react_javascript_without_babel_and_webpack) consist of simple node server, that serves html file from `dist/` directory. The html has a script tag `<script src="src/index.js"></script>` which is entry point to react application. It also has sources to react@14 library from cdn.

For now i don't know if the entry index.js file can import react sources on its own from node_modules/. I gues for that project need some sort of bundler, that links node packeges and code together.

---

The point here is to shocase how react & javascript works. React is simple library, piece of code, that exposes number of methods (`createElement()`, `render()`, etc.). So basicly all other instruments like babel (transpiles javascript) or webpack (module bundler) tie up pices of application together.

---

TODO Expriment forther.

Usefull links:
- [jamesknelson.com/learn-raw-react-no-jsx-flux-es6-webpack/](http://jamesknelson.com/learn-raw-react-no-jsx-flux-es6-webpack/)
- [jamesknelson.com/react-js-by-example-interacting-with-the-dom/](http://jamesknelson.com/react-js-by-example-interacting-with-the-dom/)
- [bable root import](https://dev-yakuza.posstree.com/en/react-native/root-import/)
- [Использование Babel и Webpack для настройки React-проекта с нуля](https://habr.com/ru/company/ruvds/blog/436886/)
- [blog.bitsrc.io/setting-a-react-project-from-scratch-using-babel-and-webpack-5f26a525535d](https://blog.bitsrc.io/setting-a-react-project-from-scratch-using-babel-and-webpack-5f26a525535d)
- [github.com/react-from-scratch](https://github.com/anshulrgoyal/react-from-scratch)
- [webformyself.com/gotovim-s-webpack-chast-2-ponyatie-i-ispolzovanie-webpack-zagruzchikov/](https://webformyself.com/gotovim-s-webpack-chast-2-ponyatie-i-ispolzovanie-webpack-zagruzchikov/)
- [www.sitepoint.com/webpack-beginner-guide](https://www.sitepoint.com/webpack-beginner-guide/)
- [bocoup.com/blog/webpack-a-simple-loader](https://bocoup.com/blog/webpack-a-simple-loader)
- [medium.com/введение-в-webpack-для-новичков](https://medium.com/nuances-of-programming/%D0%B2%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B2-webpack-%D0%B4%D0%BB%D1%8F-%D0%BD%D0%BE%D0%B2%D0%B8%D1%87%D0%BA%D0%BE%D0%B2-6cafbf562386)
- [www.integralist.co.uk/posts/modern-js/](https://www.integralist.co.uk/posts/modern-js/)
- [github.com/react-no-webpack-required](https://github.com/jackfranklin/react-no-webpack-required)
- [github.com/react-webpack-babel](https://github.com/ReactJSResources/react-webpack-babel)
