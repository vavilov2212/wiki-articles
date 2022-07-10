---

title: Remove key with spread operator

author: Roman Vavilov

date: '2022-06-06 01:08'

---

Stumbled upon [this article](https://www.leonenkov.ru/remove-a-property-from-object-using-spread-operator/) on how to remove a key from object using spread operator. **Remove a key from an object with spread operator**

```JavaScript
const myObject = {
  a: 1,
  b: 2,
  c: 3
};
const { a, ...noA } = myObject;
console.log(noA); // => { b: 2, c: 3 }
```

**Now let’s do the same, but when the key name is dynamic**

```JavaScript
const myObject = {
  a: 1,
  b: 2,
  c: 3
};
let key = 'a';
let {[key]: foo, ...noKey} = myObject;
console.log(noKey); // => { b: 2, c: 3 }
```
