---

title: Slate editor

author: Roman Vavilov

date: '2022-06-06 23:58'

---

# Slate editor explained

I made a bunch  of  *slatejs* components \[[github.com/slate_examples_react](https://github.com/vavilov2212/slate_examples_react)] explaining its  features pretty much based on the examples [](https://www.slatejs.org/examples/richtext)in their documentation [\[slatejs.org/examples](https://www.slatejs.org/examples/richtext)].

While i ended up using remark-slate-transformer with some overrides, first i tried [remark-slate](https://github.com/hanford/remark-slate), but its *serialize* function has no arguments to override built-in types.

<u>TODO: Explore source code and compare the two libraties.</u>

The one problem, that i faced with, was that markdown doesn't have <u>underline</u> syntax. Some flavours (like githubs) allow to use html tags. To have underline formatting, you can use `<u>`<u> tag. When de/serializing i actually transform the type to a </u>`<u></u>`<u>. Another approach is to use </u>[remark-underline](https://github.com/Darkhax/remark-underline) plugin that adds support for underlining.

<u>NOTE: Not researched, just breafly read-through.</u>





---

### Resources:

[remark-slate-transformer](https://github.com/inokawa/remark-slate-transformer) - transforms from .md format to slate json and back. Relies on [mdast](https://github.com/syntax-tree/mdast) **M**ark**d**own **A**bstract **S**yntax **T**ree, but accepts overrides for your custom element and leaf types. See [action examples](https://inokawa.github.io/remark-slate-transformer/?path=/docs/playground-slate-0-50--markdown-to-slate) on storybook playground.

[remark-slate](https://github.com/hanford/remark-slate) - doesn't allow overrides on the type system.

[remark-underline](https://github.com/Darkhax/remark-underline) - adds support for underline formatting.

[slate-plugins](https://github.com/ianstormtaylor/slate-plugins) - someones repo of favourite slate plugins

[awesome-slate](https://github.com/arahansen/awesome-slate) repo
