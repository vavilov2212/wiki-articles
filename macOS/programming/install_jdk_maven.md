---
title: Install jdk & maven
desctiption: How to install jdk & maven on mac OS
author: Roman Vavilov
date: '2022-04-20 10:55'
---

## TL;DR;

> - `$JAVA_HOME` should output path to your jdk directory.

> - Maven executable should be in the `$PATH`.

> - Shold have `java` and `mvn` commands available in cmd.

## Check system packages

To check if the jdk is installed on your system simply run

```Shell
$ java --version
```

Maven package is accessible via the following name

```Shell
$ mvn -v
```

---

## Install jdk

Go to oracle [java platform help center](https://docs.oracle.com/en/java/javase/index.html) and pick version you want to install. I downloaded the `.dmg` file and just double clicked it.

After the installation proccess, on thing to keep in mind is setting the `JAVA_HOME` variable into the environment. Copy the following line to your `.bachrc/.zshrc`

```Bash
export JAVA_HOME=`/usr/libexec/java_home -v [VERSION e.g. 18]`
```
---

## Insall Maven

Download the `.zip` archive from maven project site. Unpack it to the `/opt` directory. In my case it looked like this.

![image alt](/images/operating_systems__macOS__install_jdk_maven.png)

Next add the bin directory of the created directory apache-maven-3.8.5 to the PATH environment variable.

To do this, copy the following line to your `.bachrc/.zshrc`.

```Bash
export PATH=/opt/apache-maven-3.8.5/bin:$PATH
```
