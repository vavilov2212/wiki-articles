---
title: Raspbery Pi
desctiption: About whats on it & how it's configed
author: Roman Vavilov
date: '2023-01-28 14:16'
---

# Operating system

## Ubuntu

- https://ubuntu.com/download/raspberry-pi - official Ubuntu distros for Raspberry Pi

## Debian
- https://raspi.debian.net/ - list of tested debian images for Raspberry Pi
- https://wiki.debian.org/RaspberryPi4 - official debian.org wiki on Raspberry Pi

## Raspberry Pi OS (previously called Raspbian)
- https://www.raspberrypi.com/software/operating-systems/ - official Raspberry Pi OS images
- https://www.raspberrypi.com/documentation/computers/os.html - documentation on the OS

## Raspbian (unofficial distro)
- https://www.raspbian.org/ - unofficial debian based OS optimized for Raspberry Pi


# Notes
Password for user `root` is not set by default in debian

To install binaries use
```Bash
apt update // try apt-get update
apt install usbutils
```

TODO: _What's the difference between `apt` and `apt-get`?_ Read the documentation [debian.org/doc - Chapter 2. Debian package management](https://www.debian.org/doc/manuals/debian-reference/ch02.en.html)


