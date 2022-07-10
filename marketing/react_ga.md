---
title: react-ga
description: What is the difference between URI and URL
author: Roman Vavilov
date: '2022-01-26 00:37'
---

## Initialyze and send GA events in react components

This is how to initialize multiple google analytics trackers with [react-ga](https://github.com/react-ga/react-ga) library.

```JavaScript
  useEffect(() => {
    ReactGA.initialize([
      { trackingId: 'UA-0000-1' },
      {
        trackingId: 'UA-1111-1',
        gaOptions: {
          name: 'tracker1'
        }
      }
    ]);
  }, []);
```

The first `trackingId` is set to name 'auto'. And if invoking other ga functions with no explicit name parameter - this is the one, that's going to be used.

<hr/>

Consider the following `useEffect` hook that is triggered on response from some XHR request.

```JavaScript
  import { AxiosResponse } from 'axios';

  ...

  const [apiResponse, setApiResponse] = useState<AxiosResponse>();

  useEffect(() => {
    if (!!apiResponse && apiResponse?.status < 400) {
      ReactGA.event({
        category: 'User',
        action: 'User action'
      }, ['tracker1']);
    }
  }, [apiResponse])

  ...
```

<hr/>

The same can be achived with the [original ga function](https://github.com/react-ga/react-ga#reactgaga).

```JavaScript
  ...

  const sendGaEvent = (category: string, action: string) => {
    const ga = ReactGA.ga();
    ga('create', 'UA-11111-1', 'auto', 'tracker1');
    ga('tracker1.send', 'event', category, action);
  };

  useEffect(() => {
    if (!!apiResponse && apiResponse?.status < 400) {
    sendGaEvent('User', 'User action');
    }
  }, [apiResponse]);

  ...
```
