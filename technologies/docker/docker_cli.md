---
title: Docker shell commands
desctiption: List of common cmd's to look up
author: Roman Vavilov
date: '2023-02-20 06:45'
---

# Container
List Containers
```Shell
docker container ls -a
```
List of all containers that we ran
```Shell
docker ps -a
```
Stop docker container ID
```Shell
docker container stop <CONTAINER ID> // a9a4b81e26a7
```
Remove docker container ID
```Shell
docker container rm <CONTAINER ID> // a9a4b81e26a7
```
Shows you all containers that are currently running
```Shell
docker ps
```

# Database
Access the server directly without using exec (container bash) from your localhost
```Shell
psql -h localhost -p 5432 -U postgres // (-h = host, -p = port, -U = user)
```
To connect from the localhost you need to add '--net host'
```Shell
docker run --name some-postgres --net host -e POSTGRES_PASSWORD=mysecretpassword -d -p 5432:5432 (?5234) postgres
```
Set hashed password with salt to postgres table from terminal
```Shell
// enter database
psql -h localhost -p 5434 -U <user name>
// create extension
create extension pgcrypto
// insert encrypted password using different algorithms
INSERT INTO <table name> (email, name, password) VALUES ('admin@admin.com', 'Administator', crypt('1234qwer', gen_salt('md5')));
UPDATE administrators SET password=
VALUES ('admin@admin.com', 'Administator', crypt('1234qwer', gen_salt('md5')));
```

# Image/Volume

Image info
```Shell
docker inspect <image name>
```
List Volumes
```Shell
docker volume ls
```
