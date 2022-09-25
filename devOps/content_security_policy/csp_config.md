---
title: Basic CSP config
desctiption: Manage Content Security Policy headers in nginx config
author: Roman Vavilov
date: '2022-01-21 13:40'
---

# Basic CSP config

[https://content-security-policy.com/](https://content-security-policy.com/) - policy, directive references & examples.

When setting content-security-policy keep in mind, that headers with multiple values are set as string and cannot merge.

This will not work when set in nginx config:

```Nginx
add_header Content-Security-Policy "default-src 'self'";
add_header Content-Security-Policy "script-src 'self' https: 'unsafe-inline'";
add_header Content-Security-Policy "font-src 'self' *.googleapis.com";
```

This only takes first line and ignores the rest. More info [developer.mozilla.org/multiple_content_security_policies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy#multiple_content_security_policies)

This will work in nginx config file:

```Nginx
add_header Content-Security-Policy "
  default-src 'self';
  script-src 'self' https: ... 'unsafe-inline';
  style-src 'self' https: ... 'unsafe-inline';
  img-src 'self' data: https: ...;
  connect-src 'self' https: ...;
  font-src 'self' ...;
";
```

Note, that setting scheme (eg. https:) will allow all sources, utiliising it, disregarding further restrictions. The following will let everything with https: scheme including `https://www.example.com` but not limited to it.

```Nginx
add_header Content-Security-Policy "
  connect-src: https: *.example.com
";
```

If you want to limit exact list of hostnames, that use https: scheme, add their full URL eg. https://*.example.com

# script-src directive

Setting 'script-src' means that only tags with external source that matches hosts defined in this directive will be loaded.

The following will allow sources with https: scheme only

```Nginx
add_header Content-Security-Policy "script-src https:";
```

If `unsafe-inline` is not set, CSP will block inline `<script></script>` execution, either local or javascript from remote sources, that executes inline scripts. This directive applies to

> inline `<script>` elements, javascript: URLs, inline event handlers, and inline `<style>` elements.

There are ways to not set 'unsafe' directives but let inline scripts to execute safely. They are described here [developer.mozilla.org/script-src#unsafe_inline_script](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/script-src#unsafe_inline_script).

# style-src directive

Allowing styles is very much like setting 'script-src', but for sources with styles.

> If 'style-src' is not set, the following stylesheets are blocked and won't load:
```Html
<link href="https://not-example.com/styles/main.css" rel="stylesheet" type="text/css" />
<style>
#inline-style { background: red; }
</style>
<style>
  @import url("https://not-example.com/styles/print.css") print;
</style>
```
> Inline style attributes are also blocked: `<div style="display:none">Foo</div>`. As well as styles that are applied in JavaScript by setting the style attribute directly, or by setting cssText: `document.querySelector('div').style.cssText = 'display:none;';`
> Standalone style rpoperties set directly will NOT be blocked `document.querySelector('div').style.display = 'none';`. These types of manipulations can be prevented by disallowing Javascript via the script-src CSP directive.

More info [developer.mozilla.org/violation_cases](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/style-src#violation_cases)

Setting 'unsafe-inline' will allow all the above. Safe ways to execute inline styles are same as with inline scripts (nonce attribute, hashing inline styles). More on that here [developer.mozilla.org/style-src#unsafe_inline_styles](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy/style-src#unsafe_inline_styles)

# connect-src directive

> connect-src directive restricts the URLs which can be loaded using script interfaces. The APIs that are restricted are:
    `<a> ping`,
    `fetch()`,
    `XMLHttpRequest`,
    `WebSocket`,
    `EventSource`,
    `Navigator.sendBeacon()`

Setting 'self' keyword will allow requests to api if it is located on the same host (which usually it is).

Google tag manager will make XHR requests on events such as client routing from page to page for example. Setting *.googletagmanager.com will allow GTM events to fire

```Nginx
add_header Content-Security-Policy "
  connect-src 'self' https://*.google-analytics.com;
";
```
