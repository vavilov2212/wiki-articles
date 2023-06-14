---
title: How to use
desctiption: Use & modify tables, roles, etc.
author: Roman Vavilov
date: '2023-06-14 06:15'
---

## Interactive mode

To enter interactive mode use `psql`

> psql is the PostgreSQL interactive terminal.

Connect to dabase on the server:
```Shell
psql -h <host> -p <port> -U <username> <dbname>
```

Commands starting with `\` are:
> meta-command that is processed by psql
       itself
```Shell
// Show list of roles
\du

// List databases
\l
```

In interactive mode you can write sql requests as usual
```Shell
// The following appears to give equal results
\help CREATE USER
\help CREATE ROLE
\help ALTER USER
\help ALTER ROLE

// ALTER ROLE works as well
// Tip: don't fotget ';'
CREATE USER postgres WITH PASSWORD 'postgres';
ALTER USER postgres SUPERUSER;
CREATE USER postgres WITH PASSWORD 'postgres' SUPERUSER;
ALTER USER postgres WITH PASSWORD 'postgres' SUPERUSER;
```
