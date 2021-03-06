---
title: usePrevius
desctiption: Example usage of usePrevius hook
author: Roman Vavilov
date: '2022-01-31 15:00'
---

# usePrevios react hook

This is a great article to reffer - [https://usehooks.com/usePrevious/](https://usehooks.com/usePrevious/).

## TL;DR;
With React class components you have the `componentDidUpdate` method which receives previous props and state as arguments or you can update an instance variable (`this.previous = value`) and reference it later to get the previous value. But inside of a functional component you need to store previous value in custom usePrevious hook.

This is generally accepted practice throughout the react development world.

```TypeScript
import { useState, useEffect, useRef } from "react";

// Usage
function App() {
  // State value and setter for our example
  const [count, setCount] = useState<number>(0);

  // Get the previous value (was passed into hook on last render)
  const prevCount: number = usePrevious<number>(count);

  // Display both current and previous count value
  return (
    <div>
      <h1>
        Now: {count}, before: {prevCount}
      </h1>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}

// Hook
function usePrevious<T>(value: T): T {
  // The ref object is a generic container whose current property is mutable ...
  // ... and can hold any value, similar to an instance property on a class
  const ref: any = useRef<T>();

  // Store current value in ref
  useEffect(() => {
    ref.current = value;
  }, [value]); // Only re-run if value changes

  // Return previous value (happens before update in useEffect above)
  return ref.current;
}
```
