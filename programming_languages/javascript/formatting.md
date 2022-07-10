---
title: Formatting dates & numbers
desctiption: Formatting stuff in javascript
author: Roman Vavilov
date: '2022-01-26 12:44'
---

# Formatting dates and numbers

String like this `1976-01-04T00:00:00.000Z` can be formatted using [Global Javascript Intl](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl) object

```JavaScript
new Intl.DateTimeFormat("en-GB", {
    year: "numeric",
    month: "long",
    day: "2-digit"
  }).format('1976-01-04T00:00:00.000Z')
```
The result will be `04 January 1976`.

Currency also can be formatted. `1200` value of currency is formated like this:

```JavaScript
new Intl.NumberFormat("en-GB", {
    style: "currency",
    currency: "GBP",
    minimumFractionDigits: 0,
    maximumFractionDigits: 0
  }).format(1200)
```
 The result if `£1,200`.
