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

Connect to the server with credentials, create user, create database

Refer to [postgresql/how-to-use](/backend/postgresql/how-to-use.md) for more details.
```Shell
psql -h localhost -p 5432 -U vavilovroman postgres
postgres=# // You are now in interactive terminal

postgres=# CREATE USER postgres WITH PASSWORD 'postgres' SUPERUSER;
postgres=# CREATE DATABASE "my-database-name" OWNER postgres;
```

Granted the `SUPERUSER` privilages, when connecting to databse via **postgresql provider**, it will CREATE DATABASE if one doesn't exist.

```Shell
// in keystone.ts
const devPostgresqlUrl = "postgres://postgres:postgres@localhost/my-database-name";

// `keystone dev` output
...
postgresql database "my-database-name" created at localhost
...
```

On the first attempt to run keystone in dev mode it will ask to create first migration. Simply leave it blank and it will suggest the name itself.
```Shell
There has been a change to your Keystone schema that requires a migration

Name of migration … // Press enter
```

***Congrats! You are now running keystonejs localy!***
