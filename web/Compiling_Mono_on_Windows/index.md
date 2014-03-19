---
Title: ./Compiling_Mono_on_Windows
layout: default
---

There are two ways of building Mono on Windows, both do require a Cygwin
setup which provides some tools required by Mono at build time. First,
download and install Cygwin from
[www.cygwin.com](http://www.cygwin.com). Use the 32 bit installer
(setup-x86.exe).

Make sure you select the following packages when installing:

`* autoconf`\
`* automake`\
`* bison`\
`* gcc-core`\
`* gcc-g++`\
`* mingw-gcc`\
`* libtool`\
`* make`\
`* python`

Make sure you are using a recent cygwin version.

Select some handy utils for later use:

`* wget`\
`* zip`

Some other tools that are nice:

`* patch`\
`* openssh or PuTTY`\
`* vim`

At this point, you can do a [VisualStudio
build]({{site.url}}/Compiling_Mono_VSNET "wikilink") or you can continue reading the
instructions for a cygwin build.

Download the Mono source code from the [released
tarballs](http://www.go-mono.com/mono-downloads/download.html) or
[GitHub](https://github.com/mono/mono).

If you download the tarball, extract it with:

`tar -zxvf mono-x.x.x.x.tar.gz`

Add mono to your path. This could be either a previous build of Mono, or
an install from the Mono Windows Combined Installer from
[Downloads]({{site.url}}/Downloads "wikilink"). Using the installer is probably the
easiest for most cases.

`export PATH=$PATH:`<path to installed mono>`/bin`

In the mono source directory, run the following:

`./configure --host=i686-pc-mingw32`

Feel free to use any prefix you like. Continue with:

`make`\
`make install`

If everything goes well, you will have a compiled mono in an hour or
two.

Archive: a tutorial on building Mono on Windows by Andreia Gaita is
available
[here](http://shana.worldofcoding.com/en/mono_cygwin_tutorial.html).
