---
title: Real world example
description: CSP config allowing google/facebook etc. sources content
author: Roman Vavilov
date: '2022-01-21 13:40'
---

# Configure CSP for letting common external services

- GTM (google tag manager)
- Google analytics
- Google recaptcha (for `<form />`)
- Mailchimp and similar
- Amazon aws

The following set of directives allows sources from trusted external hosts.
```Nginx
add_header Content-Security-Policy "
  default-src 'self';
  script-src 'self' https://*.google-analytics.com https://*.googletagmanager.com https://*.gstatic.com https://*.google.com 'unsafe-inline';
  style-src 'self' https://*.gstatic.com 'unsafe-inline';
  img-src 'self' data: https://*.gstatic.com https://*.amazonaws.com https://*.google-analytics.com https://*.facebook.com https://*.google.com https://*.google.ru;
  connect-src 'self' https://*.google-analytics.com;
  font-src 'self' https://*.gstatic.com;
  frame-src 'self' https://*.googletagmanage.com https://*.google.com https://*.g.doubleclick.net 'unsafe-inline';
";
```

## Explanation

The company where i worked had a number of web applications running on nginx servers and having no CSP headers set. I global searched the `<script>`, `<style>`, `<ifarame>` etc. tags to find what remote resources they use.

I replaced some of it (like fonts) with local resources. But GTM, google-analytics and some other packages work the way, that they load code sources from their remote hosts and execute it client-side.

To make shure everything still works after setting CSP polices, i had to browse each of my company's web applications and click through requests (in developer-tools/network). Some of google services, for instace made more then one request to diffrent hosts, so each of these had to be put in CSP configuration.

Hosts, that i found were the following:

| scripts                | styles        | images                 | fonts               | frames                |
|------------------------|---------------|------------------------|---------------------|-----------------------|
| inline scripts         | inline styles | *.gstatic.com          | *.gstatic.com       | *.googletagmanage.com |
| *.gstatic.com          | *.gstatic.com | *.google-analytics.com | *.g.doubleclick.net | *.google.com          |
| *.googletagmanager.com |               | *.google.com           |                     | *.g.doubleclick.net   |
| *.google.com           |               | *.google.ru            |                     |                       |
| *.google.ru            |               | *.facebook.com         |                     |                       |
| *.google-analytics.com |               |                        |                     |                       |
| *.g.doubleclick.net    |               |                        |                     |                       |
| *.facebook.net         |               |                        |                     |                       |
| *.facebook.com         |               |                        |                     |                       |
| *.googleadservices.com |               |                        |                     |                       |
