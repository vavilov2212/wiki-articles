---
title: useRef
desctiption: How to useRef
author: Roman Vavilov
date: '2022-02-01 11:48'
---

# React useRef hook explained

[medium.com/react-useref-hook](https://medium.com/trabe/react-useref-hook-b6c9d39e2022) - refference.

TL;DR;

[Documentation#useRef](https://reactjs.org/docs/hooks-reference.html#useref) states, that the useRef Hook is a function that returns a mutable ref object whose .current property is initialized with the passed argument (initialValue). The returned object will persist for the full lifetime of the component.

```JavaScript
const refContainer = useRef(initialValue);
```

> Updating a ref value is a side effect. All side effects should be done in the “Layout phase” or in the “Commit phase”; inside useLayoutEffect or the useEffect when using React Hooks.

  <details><summary>React life cycle diagram</summary>

  ![](https://miro.medium.com/max/1400/1*Lvb5C_NdJCyt7YgA89nvNg.jpeg)

  </details>

  <details><summary>Example</summary>

  A ref created with useRef will be created only when the component has been mounted and preserved for the full lifecycle.

```JavaScript
import React, { useRef } from "react";

const RenderCounter = () => {
  const counter = useRef(0);
  
  // Since the ref value is updated in the render phase,
  // the value can be incremented more than once
  /*
   * This is wrong
   */
  counter.current = counter.current + 1;

  /*
   * This is right
   */
  useEffect(() => {
    // Every time the component has been re-rendered,
    // the counter is incremented
    counter.current = counter.current + 1;
  }); 

  
  return (
    <h1>{`The component has been re-rendered ${counter} times`}</h1>
  );
};
```

  </details>

> Keep in mind that useRef doesn’t notify you when its content changes. Mutating the .current property doesn’t cause a re-render. If you want to run some code when React attaches or detaches a ref to a DOM node, you may want to use a [callback ref](https://reactjs.org/docs/hooks-faq.html#how-can-i-measure-a-dom-node) instead.

---

There are two main uses of useRef that are explained in the following sections: 
- `Accessing the DOM nodes or React elements`
- `Keeping a mutable variable`.


## Accessing the DOM nodes or React elements

`Class component`

> If you create a ref using createRef in a functional component, React will create a new instance of the ref on every re-render.

```JavaScript
import React, { Component, createRef } from "react";

class CustomTextInput extends Component {
  textInput = createRef();

  render() {
    return (
      <>
        <input type="text" ref={this.textInput} />
        ...
      </>
      )
    }
};
```

`Functional component`

```JavaScript
import React, { useRef } from "react";

const CustomTextInput = () => {
  const textInput = useRef();

  return (
    <>
      <input type="text" ref={textInput} />
      ...
    </>
  )
};
```


## Keeping a mutable variable

Below is an example of keeping a mutable variable in a ref. The component <Timer> initializes a setInterval on every re-render and needs to implement a callback to stop its interval imperatively:

```JavaScript
import React, { useRef, useEffect } from "react";

const Timer = () => {
  const intervalRef = useRef();

  useEffect(() => {
    const id = setInterval(() => {
      console.log("A second has passed");
    }, 1000);

    // We need the interval id to be accessible from the whole component.
    // If we stored the id in a state variable, the component would be re-rendered
    // after the state update so a new interval will be created (this effect is triggered
    // after every re-render) leading us to the infinite loop hell.
    intervalRef.current = id;

    return () => clearInterval(intervalRef.current);
  });

  const handleCancel = () => clearInterval(intervalRef.current);
  
  return (
    <>
      ...
    </>
  );
}
```

