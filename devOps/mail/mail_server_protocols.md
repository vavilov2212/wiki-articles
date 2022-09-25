---
title: main_server_protocols
desctiption: Reminder of mail server protocols
author: Roman Vavilov
date: '2022-05-24 23:22'
---

## BIMI (Brand Indicators for Message Identification) 

Технически BIMI — это текстовая запись на DNS (Domain Name System), аналогичная DMARC.

Открывок из [статьи](https://www.emailonacid.com/blog/article/email-marketing/bimi/)

> When a mailbox provider receives a message from your brand, it first checks for existing email authentication protocols. Specifically, it uses the DMARC record to look for SPF and DKIM. After that (if applicable), it looks up the domain’s BIMI record in the DNS.
>
> If a brand passes DMARC authentication, and the implementation of BIMI is correct, the mailbox provider should retrieve the logo file and display it in the subscriber’s inbox.

---

Инструмент для проверки всех записей для домена:

*   Официальный <https://bimigroup.org/bimi-generator>

*   Рекомендован <https://mxtoolbox.com/SuperTool.aspx>

*   Еще один <https://powerdmarc.com/power-dmarc-toolbox>

---

[Подробная статья про bimi на *mailchimp*](https://mailchimp.com/marketing-glossary/bimi/#How_to_set_up_BIMI)

Еще один способ прикрепить лого/аватар для почтового адреса - использовать сервис [gravatar](http://en.gravatar.com/) - очень подозрительный сервис, минимум информации на их сайте.
