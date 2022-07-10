---
title: Check health
desctiption: List disks, check blocks, partitions etc.
author: Roman Vavilov
date: '2022-05-24 22:39'
---

## List hardware devices

In LINUX _ATA/SATA_ and SCSI/SAS devices (older protocol) use the forms `/dev/sd[a-z]`
while _NVMe_ device names have the following pattern `/dev/nvme[1-9]n[1-9]`.
___

`lsblk` - List information about block devices.

```Shell
$ lsblk -l /dev/sda

NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda      8:0    0  1.8T  0 disk
├─sda1   8:1    0    1M  0 part
└─sda2   8:2    0  1.8T  0 part /
```
___

`fdisk` - Display or manipulate a disk partition table.

```Shell
$ fdisk -l

Disk /dev/sda: 1.82 TiB, 1999999336448 bytes, 3906248704 sectors
Disk model: Logical Volume
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 52ADC56A-AA95-4AC5-8AF0-FFE8B63C3F84

Device     Start        End    Sectors  Size Type
/dev/sda1   2048       4095       2048    1M BIOS boot
/dev/sda2   4096 3906246655 3906242560  1.8T Linux filesystem
```
___

`smartctl` - controls the Self-Monitoring, Analysis and Reporting Technology (SMART) system built into most ATA/SATA and SCSI/SAS hard drives and solid-state drives.
```Shell
$ smartctl --scan

/dev/sda -d scsi # /dev/sda, SCSI device
```
