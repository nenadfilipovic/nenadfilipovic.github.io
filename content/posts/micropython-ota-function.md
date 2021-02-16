---
title: "Micropython Ota Function"
date: 2019-10-07T20:40:24+02:00
draft: false
tags: ["Micropython"]
---

I assume you have built your esp-open-sdk and you know how to compile micropython firmware, if you dont know how check older posts.
Installation procedure goes like this.

Download [yaota8266](https://github.com/pfalcon/yaota8266) and [axtls](https://github.com/pfalcon/axtls/tree/3c6b62b718427c03c345ee15be9bb66959a34ccd) repositories.

Create esp8266ota folder and extract yaota8266 repository in it. Then navigate to `esp8266ota/yaota8266/ota_server/lib/axtls` and extract axtls repository there.
I have tried to clone yaota8266 repository but it was giving me empty axtls folder so I had to do it manually.

To generate your keys in ota_client folder run this code.

{{< highlight python >}}
.gen_keys.sh
python -c "import rsa_sign; rsa_sign.dump_c(rsa_sign.load_key())"
{{< /highlight >}}

Terminal will show you some values and you need mod value.
You need to keep priv.key and pub.key in same location as your ota_client.py or else it wont be able to authenticate and ota will fail.
Copy mod value to modulus field in config.h.example and rename file to config.h.

Prepare new sdk and check for updates, change folder to esp-open-sdk and run make clean,
then check if there is any update to it with git.

{{< highlight shell >}}
git pull
git submodule sync
git submodule update
{{< /highlight >}}

Copy etshal.h and boot8266.ld from patch folder to your boot8266 folder and replace old files.
Also copy ota.ld from patch folder to your ota_server folder and replace old file.

From root of yaota8266 folder run make.
In root folder yaota8266.bin will be created, save it somewhere.
Go to `micropython/port/esp8266` folder and run make ota.
In build folder firmware-ota.bin will be created, put it next to yaota8266.bin.

Using esptool flash ota server and ota firmware with these commands.

{{< highlight shell >}}
esptool.py --port your-port --baud 230400 write_flash -fm dio --flash_size = detect 0x0 yaota8266.bin
esptool.py --port your-port --baud 230400 write_flash -fm dio --flash_size = detect 0x3c000 firmware-ota.bin
{{< /highlight >}}

To flash firmware by ota restart esp8266 board and in next 3 seconds press flash button to enter ota mode. I am using NodeMCU V3 board, for other boards google which pins you need to use to activate it.

Connect board to internet and get its ip address.
On PC execute this command and change ip address and filename to your board ip and your generated firmware filename.

{{< highlight shell >}}
python ota_client.py -a 196.182.12.10 live-ota myfirmware.bin
{{< /highlight >}}

In terminal you will see send requests and receive messages and hopefully you will see done message at the end.

Find whole project in this [repository](https://github.com/nenadfilipovic/esp8266-micropython-ota) on github.