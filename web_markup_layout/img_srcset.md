---
title: Image srcset property
desctiption: Explanation and usefull comments on img tag srcset property
author: Roman Vavilov
date: '2022-08-18 14:24'
---

## Switching image resolutions without css

Here's an example of how it looks.

```html
  <img
    src="/images/acq-hero-dotsbg.png"
    loading="lazy"
    srcset="
      /images/acq-hero-dotsbg-p-500.png 500w,
      /images/acq-hero-dotsbg-p-800.png 800w,
      /images/acq-hero-dotsbg-p-1080.png 1080w,
      /images/acq-hero-dotsbg.png 1520w
    "
    sizes="
      (max-width: 479px) 100vw,
      (max-width: 767px) 560px,
      (max-width: 991px) 700px,
      1120px
    "
    alt=""
    class="image-6"
  />
```

According to this article [mozilla.org/Responsive_images](https://developer.mozilla.org/en-US/docs/Learn/HTML/Multimedia_and_embedding/Responsive_images#resolution_switching_different_sizes)

> **srcset** defines the set of images we will allow the browser to choose between, and what size each image is.
  Each set of image information is separated from the previous one by a comma.
> **sizes** defines a set of media conditions (e.g. screen widths) and indicates what image size would be best to choose,
  when certain media conditions are true — these are the hints we talked about earlier.
