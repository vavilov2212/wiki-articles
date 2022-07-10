---

title: KeeWeb

desctiption: Opensource password manager

author: Roman Vavilov

date: '2022-05-15 11:31'

---

[KeeWeb](https://github.com/keeweb/keeweb) is an opensourse password manager, which comes in two variants: web based and desktop app.
Its either self-hosted or <https://app.keeweb.info/> which is hosted by the author (i assume).

Its compatible with Keepass and can be encrypted with Youbikey key.

## Protect your password database with Yubikey

[This discussion](https://github.com/keeweb/keeweb/issues/1435) is where the feature was implemented

In order to protect the database file with another layer of encryption (besides password) there are two options in KeeWeb:

*   key file

*   yubikey

In order for yubikey to work with keeweb you need to have [yubikey-manager](https://github.com/Yubico/yubikey-manager#installation) (ykman) installed in your system.

[This issue](https://github.com/keeweb/keeweb/issues/1841) is for when yubikey is not recognized by keeweb. You have to have `ykman` cli installed and it has to be in `/usr/local/bin` in order to work. I previously installed it via homebrew and the path was `/opt/homebrew/bin/ykman` - keeweb did not recognize it.
In this case either manually copy it to `/usr/local/bin` or symlinc `ln -s /opt/homebrew/bin/ykman /usr/local/bin`.

---

To programm a slot with a [challange-response](https://github.com/keeweb/keeweb/wiki/YubiKey#Challenge-response) credential you can use yubikey-manager or ykman cli.

In the terminal run the following command to ensure connection to your yubikey device (name and serial number should output)

```Shell
$ ykman list
```

Program a challenge-response credential to desired slot. `-t` - means require touch, `2` - means slot number 2.

```Shell
$ ykman otp chalresp -t 2
```

After that you will be prompted to enter secret key.
That's it. Youbikey configured. Now in Keeweb go to database settings and select slot 2 in yubiKey dropdown field.

I have yet not found a way to recover encrypted keeweb database if the yubikey device is lost.
