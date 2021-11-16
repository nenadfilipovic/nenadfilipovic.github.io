---
title: 'Build Micropython Firmware'
date: 2019-10-07T20:35:45+02:00
draft: false
tags: ['Micropython']
---

During building apps for esp8266 boards in micropython I have stumbled across
many problems, one problem that was most anoying is memory errors.

Naturally I started searching how to fix those problems and people mentioned few
solutions. They have mentioned precompiling source files and that didn't help
me. Then they mentioned freezing files into esp8266 flash, that means
integrating your own python packages into firmware of your board.

I started exploring that solution and that is why I'm making this guide. Here is
how I did it step by step.

For this project you need Virtual Machine and Linux distribution if you are on
Windows, if you are using Linux you are ready. I have chosen Ubuntu but you can
use other distributions.

[VirtualBox](https://www.virtualbox.org/wiki/Downloads) - is powerful
Cross-platform Virtualization Software for x86-based systems.

[Ubuntu](https://ubuntu.com/download) - is an open source software operating
system that runs from the desktop, to the cloud, to all your internet connected
things.

Then you need to create VM with around 30GB, in first try I have used VM with
10GB and it couldn't finish because of lack of space. So use around 30GB.
Install Ubuntu on virtual machine and update it, also install Git.

{{< highlight shell >}} sudo apt-get update sudo apt install git
{{< /highlight >}}

Then you need to create root folder in which you are going to install sdk and
micropython sources.

Create directory Firmware and clone micropython repository in current directory.
In same directory clone esp-open-sdk repository.

{{< highlight shell >}} git clone https://github.com/micropython/micropython git
clone --recursive https://github.com/pfalcon/esp-open-sdk {{< /highlight >}}

Next get tools needed to build sdk and toolchain and also install libtool.

{{< highlight shell >}} sudo apt-get install make unrar-free autoconf automake
libtool gcc g++ gperf flex bison texinfo gawk ncurses-dev libexpat-dev
python-dev python python-serial sed git unzip bash help2man wget bzip2

sudo apt-get install libtool-bin {{< /highlight >}}

Change current directory to open-sdk and build sdk
`make STANDALONE=y |& tee make0.log`, building takes some time and it requires
internet connection so be sure that your VM is connected.

After building is completed terminal will print PATH variable that needs to be
added, it will look like this
`export PATH=/your_path/esp-open-sdk/xtensa-lx106-elf/bin:$PATH`. Just copy that
line from terminal and paste it in terminal again.

Change current directory to micropython and add external dependencies, after
that is finished compile mpy-cross compiler.

{{< highlight shell >}} git submodule update --init make -C mpy-cross
{{< /highlight >}}

Change current directory to ports/esp8266 and build your firmware with make.

New firmware you just built can be found in build folder named
firmware_combined.bin. In future every time you need to build new firmware you
just need to run make commands in ports/esp8266 folder.

After that you just need to erase flash and burn new firmware with esptool.py,
just add correct port value.

{{< highlight shell >}} esptool.py --port erase_flash esptool.py -p --baud
460800 write_flash --flash_size = detect 0 firmware_combined.bin
{{< /highlight >}}

And that's it, you have built your own micropython firmware.
