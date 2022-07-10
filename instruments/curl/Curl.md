---
title: Curl
desctiption: Curl examples
author: Roman Vavilov
date: '2022-03-09 07:22'
---

# Curl examples

---------------------

## Make `POST` request
- `-X` to specsify request type (The specified request will be used instead of the standard GET)
- `-H` to spescify headers
- `-d/--data` for POST request body (emulate as if a user has filled in a HTML form and pressed the submit button)

```Shell
$ curl -X POST \
  -H "Content-Type: application/json" \
  -d '{"fields": {"TITLE": "123", "NAME": "345", "UF_CRM_1646307527741": "678"}}' \
  https://b24-z7ufje.bitrix24.ru/rest/1/mnx0a9iliflkxcvr/crm.lead.add.json
```

---------------------

## Mke `POST` request and write `response` to file

```Shell
$ curl -X POST https://b24-z7ufje.bitrix24.ru/rest/1/mnx0a9iliflkxcvr/crm.lead.fields.json |> tmp.txt
```
