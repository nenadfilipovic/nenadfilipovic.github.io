---
title: "Micropython Frozen Modules"
date: 2019-10-07T20:39:21+02:00
draft: false
tags: ["Micropython"]
---

Last time we finished building custom micropython firmware for esp8266 and now we are going to add our custom modules to it.

Frozen modules are very good option if you are low on memory as I was with one project.
Other useful thing is you don't need to upload those files on to rom, they will always be there.

Open `port/esp8266` folder and put your python files into modules directory.

Now you just need to run make clean to remove files from previous time we generated firmware.
After that run make and build folder will be created and in there you will find newly created firmware_combined.bin.

When you flash your new firmware check for your loaded modules in REPL with `help('modules')` command.