---
title: Operations on pg_cli
desctiption: Initial DB operations
author: Roman Vavilov
date: '2023-02-20 06:36'
---

## Installed <u>manually</u>:

> pg_ctl is a utility to initialize, start, stop, or control a PostgreSQL server.

To start:
```Shell
pg_ctl -D /usr/local/var/postgres start
pg_start
```
To stop:
```Shell
pg_ctl -D /usr/local/var/postgres stop
pg_stop
```

## Installed via <u>homebrew</u>:

To start PostgreSQL server now and relaunch at login:
```Shell
brew services start postgresql
```
And stop PostgreSQL:
```Shell
brew services stop postgresql
```
