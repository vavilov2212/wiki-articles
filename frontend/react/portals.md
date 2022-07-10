---
title: React Portal
desctiption: Memos on React Portal
author: Roman Vavilov
date: '2022-01-19 01:01'
---

## Memos on React Portal

[stackoverflow/About portals](https://stackoverflow.com/a/46435051) - great answer, that covers basic description

[habr.com/smartprogress/blog](https://habr.com/ru/company/smartprogress/blog/306096/) - article on portal component wrapper - TODO Explore [source code](https://github.com/sunify/react-relative-portal) for interesting ideas

<hr/>

## Strange thing about portals

I tried it on codesandbox [Problem with Portal and next/link](https://codesandbox.io/s/sparkling-meadow-213jid)

```JavaScript
const ComponentWithPortal = () => {

  const portal = () => {
    const portalRoot = document.getElementsByTagName('some-root')?.[0];

    return ReactDOM.createPortal(
      <Portal 
        {...someProps}
      />,
      portalRoot
    );
  };

  return (
    <div>
      {portal()}
    </div>
  );
};

const Portal = () => {
  return <div>I am Portal</div>
};
```

Consider having 2 pages in nextjs with the same piece of code on both. You navigate between them via [next/link](https://nextjs.org/docs/api-reference/next/link). So when you first open the browser on page 1, this will work just fine. When you click the link to page 2 and the page 2 loads, suddenly there's no DOM element with text "I am Portal".

```JavaScript
const ComponentWithPortal = () => {
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);

    return () => setMounted(false);
  }, []);

  const portal = () => {
    const portalRoot = document.getElementsByTagName('some-root')?.[0];

    // This piece when you only create portal
    // when `mounted` is set to true makes it work
    return mounted &&
      ReactDOM.createPortal(
        <Portal 
          {...someProps}
        />,
        portalRoot
      );
  };

  return (
    <div>
      {portal()}
    </div>
  );
};

const Portal = () => {
  return <div>I am Portal</div>
};
```

When you totaly move portal creation to the `<Portal />` component itself, the problem disappears at all.

My guess is that it's related to context, because react portal, when put to another parent, it still has access to context of that initial DOM tree.

For now, i don't know why this happens.
