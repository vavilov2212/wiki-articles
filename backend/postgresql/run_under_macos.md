---
title: Operations on pg_cli
desctiption: Initial DB operations
author: Roman Vavilov
date: '2023-02-20 06:36'
---

If you installed PostgreSQL via Homebrew:
[Installing Postgres via Brew](https://gist.github.com/ibraheem4/ce5ccd3e4d7a65589ce84f2a3b7c23a3)

To start manually:
```Shell
pg_ctl -D /usr/local/var/postgres start
pg_start
```
To stop manually:
```Shell
pg_ctl -D /usr/local/var/postgres stop
pg_stop
```
To start PostgreSQL server now and relaunch at login:
```Shell
brew services start postgresql
```
And stop PostgreSQL:
```Shell
brew services stop postgresql
```
