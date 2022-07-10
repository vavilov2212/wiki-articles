---

title: Slate code editting

author: Roman Vavilov

date: '2022-06-22 10:03'

---

## Projects, allready exist

[slate-edit-code](https://github.com/GitbookIO/slate-edit-code) - react library, which does exactly this. It's based on pre 0.50.0 slate, so pretty much outdated. But it's nice for refference of how code is structured or, for instance, how to [detect code line indentation](https://github.com/GitbookIO/slate-edit-code/blob/master/lib/utils/getIndent.js).

---

[slate-prism](https://github.com/GitbookIO/slate-prism) - this is basicly *slate-edit-code* with integrated code highlighting using [prism.js](https://github.com/PrismJS/prism). I ended up implementing the same approach, where you have a `decoration` function, which puts up className attribute for each slate node, that needs to be highlighted. The one thing, that i encountered, during development - was that when prismjs library does its changes to the layout, then next.js throws an error that the initially rendered UI differs from the one it's comparing it to.
To avoid it, i had to import it asynchronosly and have the same instance of prism.js present is the state of component.

```JavaScript
export default function myComponent() {
  const [language, setLanguage] = useState('plain')
  const [Prism, setPrism] = useState<any>();

/* 
 * This hack is to avoid next.js UI desynchronisation
 */
  useEffect(() => {
    (async () => (await import('prismjs')).default)()
      .then(Prism => {
        Prism.manual = true;
        setPrism(Prism);
      })
  }, [])

  const decorate = useCallback(
    ([node, path]) => {
      const ranges = []

      ...checks is node is not Editor or Text & node.type is code

      if (Prism) {
       /*
        * The following code is where you pass custom attributes to slate leafs.
        * In my case - i put `className` attribute with the prism.js token type.
       */
        const tokens = Prism?.tokenize(node.text, Prism?.languages?.[language]);
        let start = 0

        for (const token of tokens) {
          const length = getLength(token)
          const end = start + length

          if (typeof token !== 'string') {
            ranges.push(({
              className: `prism-token token ${token.type}`,
              anchor: { path, offset: start },
              focus: { path, offset: end },
            } as never))
          }

          start = end
        }
      }

      return ranges;
    },
    [language, Prism]
  );
}
```
