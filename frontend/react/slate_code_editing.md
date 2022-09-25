---

title: Slate code editting

author: Roman Vavilov

date: '2022-06-22 10:03'

---

## Projects, allready exist

[slate-edit-code](https://github.com/GitbookIO/slate-edit-code) - react library, which does exactly this. It's based on pre 0.50.0 slate, so pretty much outdated. But it's nice for refference of how code is structured or, for instance, how to [detect code line indentation](https://github.com/GitbookIO/slate-edit-code/blob/master/lib/utils/getIndent.js).

---

[slate-prism](https://github.com/GitbookIO/slate-prism) - this is basicly *slate-edit-code* with integrated code highlighting using [prism.js](https://github.com/PrismJS/prism). I ended up implementing the same approach, where you have a `decoration` function, which puts up className attribute for each slate node, that needs to be highlighted.
