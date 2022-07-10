---
title: Async_JavaScript_Patterns
desctiption: Async JavaScript Patterns
author: Roman Vavilov
date: '2022-03-29 20:22'
---

# Async patterns in JavaScript

[лекция оттус](https://www.youtube.com/watch?v=KPzCRNN2cDE)

- Callbacks

Примеры - eventListeners, setTimeOut etc.
Паттерн callback существует в любой среде исполнения в javascript, в т.ч. в NodeJs они изначально поставляются из коробки. Например модуль fs или http.

```JavaScript
const http = require('http');
const fs   = reqiure('fs');

const server = http.createServer((req, res) => {
  // This is callback
  fs.readFile(source, (err, fules) {
    // This is callback too
    ...
  });
});
```

Отрицательным моментом использования callback'ов является `callback hell` - когда код превращается в мешанину из большого количества вложенных callback'ов.

- Promise

Промисы можно назвать "улучшенными" callback'ами. Разница в подходах с callback'ами в том, что есть некоторое замыкание на сторонний api (promise api), который возвращает некоторое состояние pending, resolve, reject. Использование промисов означает использование унифицированного подхода - цепочек .then, .catch и т.д. интерфейсов thenable, catchable.
Еще есть синхронное создание промисов при помощи `Promise.resolve(value)` или `Promise.reject(reason)`. 

- async/await

Синтаксический сахар для работы с Promise. async функция, если написатьт `return` возращает значение обернутое в Promise.
[упражнение - переписать функция на async/await](https://gist.github.com/korzio/9aa3d7519fea9db1eed59938578b6170)

- Итераторы

Не так давно в javascript (ecmascript 6). Позволяет итерироваться по специальным iterable объектам - то, что содержит метод next и возвращает значение в формате `{ value: any, done: boolean }`.
Iterable протокол - это статическое значение внутри Sybmol - iterator и оно должно возвращать функцию, которая возвращает итератор (this). Внутри next описывает по каким правилам мы будем итерироваться.
```JavaScript
```

Протокол итератор позволяет использовать выражения типа for...of.
У массива есть встроенный итератор, например
```JavaScript
const it = [1][Symbol.iterator];
it.next() // { value: 1, done: false }
it.next() // { value: undefined: done: true }
```

- Генераторы

Появились в js в стандарте 2015 (TODO проверить). Позволяют скрыть итераторы под ключевым словом yield. Каждый раз, когда вызывается yield означает что генератор вызвался и остановился до тех пор, пока не вызовется метод next. Это синхровнная вещь.

Чтобы сделать асинхронно нужно добавить ключевое слово async. `Symbol.asyncIterator` - все тоже самое, только функция next должна возвращать `Promise`. В javascript есть конструкция `for await of` она умеет итерироваться по асинхронному iterable объекту.

Асинхронные генераторы - просто добавить к выражению `function*`, которое создает генератор, ключевое слово `await`.

Стратегии:
  - in order - in order
  - asap - in order
  - asap - asap - [статья Why Would You Use Async Generators](https://betterprogramming.pub/why-would-you-use-async-generators-eabbd24c7ae6)

В nodeJs есть `Iterable Streams` - текут данные и мы не знаем когда они появятся. Это пример, где применимы `for await ... of`. Еще один пример это пайплайны (TODO написать пример).

- Observables & RxJS

Другая репрезентация асинхронно-генераторного паттерна. Мы можем подписаться на события из асинхронного паттерна. По сути эти observable - это потоки данных.
```JavaScript
const subscription = source.subscribe(
() => console.log('Next:', x).
(err) => console.log('Error:', err),
() => console.log('Completed')
```

Это хорошо написанная технология, но, по сути, для работы с потоками достаточно использовать встроенный синтаксис javascript.
