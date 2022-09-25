---
title: Configure wifi dongle
desctiption: 
author: Roman Vavilov
date: '2022-09-12 10:23'
---

This is taken from [suffix.be/configuring-wifi-network-adapter-ubuntu](https://www.suffix.be/blog/configuring-wifi-network-adapter-ubuntu/).

## Configuring a wireless network adapter on Ubuntu

List all usb devices

```Shell
$ lsusb
```

Now we need to find the USB device’s logical name, the name we can use to refer to it. Meet lshw.

```Shell
$ lshw -C network

// Output
*-network
      description: Ethernet interface
      product: RTL8125 2.5GbE Controller
      vendor: Realtek Semiconductor Co., Ltd.
      physical id: 0
      bus info: pci@0000:07:00.0
      logical name: enp7s0
      version: 04
      serial: f0:2f:74:2e:7c:19
      size: 1Gbit/s
      capacity: 1Gbit/s
      width: 64 bits
      clock: 33MHz
      capabilities: bus_master cap_list ethernet physical tp mii 10bt 10bt-fd 100bt 100bt-fd 1000bt-fd autonegotiation
      configuration: autonegotiation=on broadcast=yes driver=r8169 driverversion=5.15.0-47-generic duplex=full firmware=rtl8125b-2_0.0.2 07/13/20 ip=192.168.102.65 latency=0 link=yes multicast=yes port=twisted pair speed=1Gbit/s
      resources: irq:38 ioport:f000(size=256) memory:fc500000-fc50ffff memory:fc510000-fc513fff
*-network DISABLED
      description: Wireless interface
      physical id: 10
      bus info: usb@1:4
      logical name: wlxd03745ec7bba // <-- This is the name of a usb dongle
      serial: d0:37:45:ec:7b:ba
      capabilities: ethernet physical wireless
      configuration: broadcast=yes driver=r8188eu driverversion=5.15.0-47-generic multicast=yes wireless=unassociated
```

Now manually enable the network connection.

> In my case on ubuntu `Ubuntu 22.04.1 LTS` with full installation, it didn't have ifconfig. In this case just run
>```Shell
>$ sudo apt install net-tools
>```

After that run
```Shell
$ ifconfig wlxd03745ec7bba up
```

To check if the device is actually up, simply check for exesting wifi-networks

```Shell
$ nmcli dev wifi

// Output
IN-USE BSSID             SSID                       MODE  CHAN RATE      SIGNAL BARS SECURITY
       18:E8:29:FE:1F:45 Stynergy_Uni               Infra 10   16 Mbit/s 88     ▂▄▆█ WPA2
       FA:0D:AC:D4:DC:D2 DIRECT-D2-HP M428fdw LJ    Infra 6    44 Mbit/s 74     ▂▄▆_ WPA2
       9E:93:4E:43:1B:29 DIRECT-KuWorkCentre 3225   Infra 11   54 Mbit/s 70     ▂▄▆_ WPA2
       2E:6F:C9:01:E8:1B DIRECT-1b-HP M203 LaserJet Infra 6    16 Mbit/s 60     ▂▄▆_ WPA2
       AC:84:C6:65:ED:14 Chemistry-Invest.com       Infra 1    44 Mbit/s 0      ____ WPA2
       C6:EC:E4:20:EC:8D vivo Y31                   Infra 1    44 Mbit/s 0      ____ WPA2
       FC:EC:DA:1A:09:61 Clarus                     Infra 1    16 Mbit/s 0      ____ WPA2
       02:EC:DA:1A:09:61 Clarus Guest               Infra 1    16 Mbit/s 0      ____ WPA2
```

At this time this list should allready be shown in ubuntu visual UI setting. If not

```Shell
$ wpa_passphrase <ssid> > wlan.config
```
This is going to work untill reboot system. For more read the original [article](https://www.suffix.be/blog/configuring-wifi-network-adapter-ubuntu/).
