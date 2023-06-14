---
title: Starter project
desctiption:  From scratch to MWP
author: Roman Vavilov
date: '2023-06-14 05:04'
---

## Local development

### PostgreSQL

To start the postgresql server, please, refer to the [run-under-macos](/backend/postgresql/run_under_macos.md) memo.

To verify on which address it's running:
```Shell
lsof -Pi :postgresql
// -i - selects [<IPv>46][protocol][@hostname|hostaddr][:service|port]
// -P - show port

| COMMAND  | PID   | USER   | FD | TYPE | DEVICE             | SIZE/OFF | NODE | NAME                    |
|----------|-------|--------|----|------|--------------------|----------|------|-------------------------|
| postgres | 99072 | <user> | 5u | IPv4 | 0xc941f304a7c39659 | 0t0      | TCP  | localhost:5432 (LISTEN) |
```

Knowing `host` and `port` of postgresql server you need to create database

Connect to the server with credentials: [how-to-use](/backend/postgresql/how-to-use.md)
```Shell
psql -h localhost -p 5432 -U vavilovroman postgres
```
